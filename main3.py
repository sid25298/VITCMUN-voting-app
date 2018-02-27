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



@app.route('/',methods=['POST','GET'])
def hello():
	return render_template("app.html")
@socketio.on('vote')
def handleVote(ballot):
	cur=mysql.connection.cursor()
	cur.execute("select count(vote) from votes")
	rv=cur.fetchone()
	result=rv[0]
	cur.execute("insert into votes values("+str(result)+","+str(ballot)+");")
	cur.execute("select count(vote) from votes where vote=1");
	rv=cur.fetchone()
	results1=rv[0]
	cur.execute("select count(vote) from votes where vote=2");
	rv=cur.fetchone()
	results2=rv[0]	
	mysql.connection.commit()
	
	emit('vote_results',{'results1':results1,'results2':results2}, broadcast=True)

if __name__=="__main__":
	socketio.run(app)
