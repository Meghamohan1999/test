from flask import *
from src.database import *
import datetime
app=Flask(__name__)

app.secret_key="aaaaaaaaaaa"

# import functools
# def login_required(func):
#     @functools.wraps(func)
#     def secure_function():
#         if "lid" not in session:
#             return redirect ("/")
#         return func()
#     return secure_function

@app.route("/logout")
# #@login_required

def logout():
    session.clear()
    return render_template("rto/login.html")

@app.route('/')
def start():
    return render_template('rto/login.html')

@app.route('/logincode',methods=['post'])
def logincode():
    uname=request.form['textfield']
    pwd=request.form['textfield2']
    qry="select * from login where username=%s and password=%s"
    val=(uname,pwd)
    print(val)
    res=selectone(qry,val)
    print(res)
    if res is None:
        return '''<script>alert(" Invalid Username or Password ");window.location="/"</script>'''
    elif res[3]=="admin":
        session['lid']=res[0]
        return '''<script>alert("Admin login success ");window.location="/rtohome"</script>'''
    elif res[3] == "scraper":
        session['lid'] = res[0]
        return '''<script>alert(" login success ");window.location="/scraphome"</script>'''
    else:
        return '''<script>alert("Invalid Username or Password");window.location="/"</script>'''

@app.route('/acceptrejectscrap')
#@login_required
def acceptrejectscrap():
    qry="SELECT `scrap`.*,`login`.`type` FROM `scrap` JOIN `login` ON `scrap`.`lid`=`login`.`id` WHERE `login`.`type`='pending'"
    res=selectall(qry)
    return render_template('rto/accept reject scrap.html',val=res)

@app.route('/acceptscrap')
#@login_required
def acceptscrap():
    id = request.args.get('id')
    qry = "update login set type='scraper' where id=%s"
    val = id
    print(val)
    iud(qry, val)
    return '''<script>alert("Accepted..");window.location="/acceptrejectscrap"</script>'''

@app.route('/rejectscrap')
#@login_required
def rejectscrap():
    id = request.args.get('id')
    qry = "update login set type='reject' where id=%s"
    val = id
    print(val)
    iud(qry, val)
    return '''<script>alert("Rejected..");window.location="/acceptrejectscrap"</script>'''

@app.route('/acceptedscrap')
#@login_required
def acceptedscrap():
    qry="SELECT `scrap`.*,`login`.`type` FROM `scrap` JOIN `login` ON `scrap`.`lid`=`login`.`id` WHERE `login`.`type`='scraper'"
    res=selectall(qry)
    return render_template('rto/accepted scrap.html',val=res)

@app.route('/rtohome')
#@login_required
def rtohome():
    return render_template('rto/rto home.html')

@app.route('/sendreply')
#@login_required
def sendreply():
    id=request.args.get('id')
    session['rid']=str(id)
    return render_template('rto/send reply.html')

@app.route('/reply',methods=['post'])
#@login_required
def reply():
    reply=request.form['textarea']
    qry = "update `complaint` SET `reply`=%s WHERE `id`=%s"
    val =(reply,session['rid'])
    print(val)
    iud(qry, val)
    return '''<script>alert("Replyed..");window.location="/viewcomplaintreply"</script>'''

@app.route('/viewscraprating')
#@login_required
def viewscraprating():
    qry="SELECT `scrap`.`fname`,`scrap`.`lname`,`user`.`fname`,`user`.`lname`,`rating`.* FROM `scrap` JOIN `rating` ON `rating`.`slid`=`scrap`.`lid` JOIN `user` ON `user`.`lid`=`rating`.`ulid`"
    res=selectall(qry)
    return render_template('rto/view scraprating.html',val=res)

@app.route('/viewcomplaintreply')
#@login_required
def viewcomplaintreply():
    qry="SELECT `user`.`fname`,`lname`,`complaint`.* FROM `complaint` JOIN `user` ON `user`.`lid`=`complaint`.`lid` where `complaint`.reply='pending' "
    res=selectall(qry)
    return render_template('rto/viewcomplaint reply bn.html',val=res)

@app.route('/viewcar')
#@login_required
def viewcar():
    qry="SELECT `user`.`fname`,`lname`,`car_details`.*  FROM `user` JOIN`car_details` ON `car_details`.`lid`=`user`.`lid` where `car_details`.`id` NOT IN (SELECT `cid` FROM `carstatus`)"
    res=selectall(qry)
    return render_template('rto/viewcar.html',val=res)

# @app.route('/vcar')
# #@login_required
# def vcar():
#     id=request.args.get('id')
#
#     qry="SELECT * FROM `car_details` WHERE `id`=%s"
#     res=selectone(qry,id)
#     with open(compiled_contract_path) as file:
#         contract_json = json.load(file)  # load contract info as JSON
#         contract_abi = contract_json['abi']  # fetch contract's abi - necessary to call its functions
#
#         contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
#         blocknumber = web3.eth.get_block_number()
#
#         d = datetime.datetime.now().strftime("%Y-%m-%d")
#         vifo=str(res[2]+","+res[3]+","+res[4]+","+res[5])
#         #  function add_info(uint _bid,uint _uid,uint _vehid,string memory _vehinfo,string memory _date)public{
#
#         message2 = contract.functions.add_info(blocknumber + 1, int(res[1]), int(res[0]),  vifo, d).transact()
#         print (message2,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
#     qry = "INSERT INTO `carstatus` VALUES(%s)"
#     iud(qry, id)
#     return redirect("/viewcar")

# __________________________scrap______________________________________

@app.route('/addpriceinfo')
#@login_required
def addpriceinfo():
    id = session['lid']
    qry="SELECT `car_details`.*,`scraprequest`.`id`,`scraprequest`.`status` FROM `car_details` JOIN `scraprequest` ON `car_details`.`id`=`scraprequest`.`carid` WHERE `scraprequest`.`lid`=%s and scraprequest.status !='pending'"
    res=selectall2(qry,id)
    return render_template('scrap/add price info.html',val=res)


@app.route('/certificateup')
#@login_required
def certificateup():
    id = request.args.get('id')
    session['cid'] = id
    return render_template('scrap/cinfo.html')


@app.route('/priceinfo')
#@login_required
def priceinfo():
    id = request.args.get('id')
    session['pid']=id
    return render_template('scrap/price info.html')

@app.route('/priceinfocode',methods=['post'])
#@login_required
def priceinfocode():
    id=session['pid']
    price=request.form['textfield']
    qry="insert into `price_info` VALUES(NULL,%s,%s)"
    val=(id,price)
    print(val)
    iud(qry,val)
    return'''<script>alert("added..");window.location="/addpriceinfo"</script>'''

@app.route('/cerinfocode',methods=['post'])
#@login_required
def cerinfocode():
    id=session['cid']
    img=request.files['img']
    fn=str(id)+".png"
    img.save("static/certificate/"+fn)

    qry="INSERT INTO `certificate` VALUES(NULL,%s,%s,%s,CURDATE())"
    val=(id,session['lid'],fn)
    print(val)
    iud(qry,val)
    return'''<script>alert("added..");window.location="/addpriceinfo"</script>'''

@app.route('/scraphome')
def scraphome():
    return render_template('scrap/scrap home.html')

@app.route('/scrapregistration')
#@login_required
def scrapregistration():
    return render_template('scrap/scrap registration.html')

@app.route('/register1',methods=['post'])
def register1():
    fname=request.form['textfield']
    lname = request.form['textfield9']
    place=request.form['textfield2']
    post=request.form['textfield3']
    pin=request.form['textfield4']
    phone=request.form['textfield5']
    email=request.form['textfield6']
    username=request.form['textfield7']
    password=request.form['textfield8']
    qry="insert into login values(null,%s,%s,'pending')"
    val=(username,password)
    id=iud(qry,val)
    qry="insert into scrap values(null,%s,%s,%s,%s,%s,%s,%s,%s)"
    val=(id,fname,lname,place,post,pin,email,phone)
    iud(qry,val)
    return '''<script>alert("You can Login after the Admin Confirmation...");window.location="/"</script>'''

@app.route('/viewrating')
#@login_required
def viewrating():
    id = session['lid']
    qry="SELECT `user`.`fname`,`lname`,`rating`.* FROM `rating` JOIN `user` ON `user`.`lid`=`rating`.`ulid` WHERE `rating`.`slid`=%s"
    res=selectall2(qry,id)
    return render_template('scrap/view rating.html',val=res)

@app.route('/viewrequestandverifycardetails')
#@login_required
def viewrequestandverifycardetails():
    id=session['lid']
    qry="SELECT `user`.`fname`,`lname`,`car_details`.* ,`scraprequest`.`date`,`scraprequest`.`id`,`scraprequest`.`status` FROM `user` JOIN`car_details` ON `car_details`.`lid`=`user`.`lid` JOIN `scraprequest` ON `scraprequest`.`carid`=`car_details`.`id` WHERE `scraprequest`.`lid`=%s"
    res=selectall2(qry,id)
    print(res)
    return render_template('scrap/view request andverify cardetails.html',val=res)

@app.route('/verify')
#@login_required
def verify():
    id = request.args.get('id')
    qry = "update `scraprequest` SET `status`='verified' WHERE `id`=%s"
    val = id
    print(val)
    iud(qry, val)
    return '''<script>alert("Verifyed..");window.location="/viewrequestandverifycardetails"</script>'''



app.run(debug=True)