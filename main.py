from flask import Flask, render_template,request, redirect, url_for
from flask_mysqldb import MySQL
from flask_socketio import SocketIO, emit

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'VITCMUN'
mysql=MySQL(app)
socketio=SocketIO(app)
usar={}
lgcnt=0


@app.route('/',methods=['POST','GET'])
def test():
     if request.method=="POST":
         conn=mysql.connection.cursor()
         passw=request.form['password']
         user=request.form['username']
         conn.execute("SELECT * from logins where password=%s and username=%s and extra2='user'",[passw,user])
         row=conn.fetchone()
	 conn.execute("SELECT * from logins where password=%s and username=%s and extra2='eb'",[passw,user])
         row2=conn.fetchone()
         if row:
             #session['Username']=user
             #lgcnt +=1
             #if user=="aditya":
                 #return render_template('index.html')
             #else:
             return render_template('app.html')
             #print("user logged in" + request.sid)
	 elif row2:
	     return render_template('eb.html')
         else:
             #return render_template("")

             return "Username and/or password incorrect."

         #return request.form['username'] + " logged in"
     return render_template("login.html")
@socketio.on('vote')
def handleVote(ballot):
	cur=mysql.connection.cursor()
	cur.execute("select count(vote) from "+str(ballot['agenda']))
	rv=cur.fetchone()
	result=rv[0]
	#print("insert into "+str(ballot['agenda'])+" values("+str(result)+",'"+str(ballot['user'])+"',"+str(ballot['option'])+");")
	cur.execute("insert into "+str(ballot['agenda'])+" values("+str(result)+",'"+str(ballot['user'])+"',"+str(ballot['option'])+");")
	cur.execute("select count(vote) from "+str(ballot['agenda'])+" where vote=1");
	rv=cur.fetchone()
	results1=rv[0]
	cur.execute("select count(vote) from "+str(ballot['agenda'])+" where vote=2");
	rv=cur.fetchone()
	results2=rv[0]	
	cur.execute("select count(vote) from "+str(ballot['agenda'])+" where vote=3");
	rv=cur.fetchone()
	results3=rv[0]	
	cur.execute("select count(vote) from "+str(ballot['agenda'])+" where vote=4");
	rv=cur.fetchone()
	results4=rv[0]	
	cur.execute("select count(vote) from "+str(ballot['agenda'])+" where vote=5");
	rv=cur.fetchone()
	results5=rv[0]	
	mysql.connection.commit()
	
	emit('vote_results',{'results1':results1, 'results2':results2, 'results3':results3, 'results4':results4, 'results5':results5, 'agenda':str(ballot['agenda']) }, broadcast=True)
@socketio.on('ctrl')
def handleCtrl(control):
	if control['option']==1:
		print("hi1")
		emit('vote_on',{'agenda':str(control['agenda'])},  broadcast=True)
	elif control['option']==2:
		print("hi2")
		emit('vote_off',{'agenda':str(control['agenda'])},  broadcast=True)
	elif control['option']==3:
		print("delete "+str(control['agenda']))
		cur2=mysql.connection.cursor()
		cur2.execute("delete from "+str(control['agenda'])+";")
	mysql.connection.commit()
if __name__=="__main__":
	socketio.run(app)
