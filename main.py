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
     cur.execute("update logins set "+str(ballot['agenda']+"=0 where username = '"+str(ballot['user'])+"'"))
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
          emit('vote_on',{'agenda':str(control['agenda'])},broadcast=True)
          cur=mysql.connection.cursor()
          cur.execute("update logins set "+str(control['agenda'])+"=1")
          mysql.connection.commit()
     elif control['option']==2:
          print("hi2")
          cur=mysql.connection.cursor()
          cur.execute("update logins set "+str(control['agenda'])+"=0")
          emit('vote_off',{'agenda':str(control['agenda'])},broadcast=True)
          mysql.connection.commit()
     elif control['option']==3:
          print("delete "+str(control['agenda']))
          cur=mysql.connection.cursor()
          cur.execute("delete from "+str(control['agenda'])+";")
          emit('vote_reset',str(control['agenda']),broadcast=True)
          mysql.connection.commit()
@socketio.on('login')
def handleLogin(details):
    cur=mysql.connection.cursor()
    agenda={1:"at",2:"pv1",3:"pv2",4:"sv"}
    result={'results1':0,'results2':0,'results3':0,'results4':0,'results5':0,'agenda':''}
    for i in range(1,5):
        result['agenda']=agenda[i]
        for j in range(1,6):
            cur.execute("select count(vote) from "+str(agenda[i])+" where vote="+str(j));
            rv=cur.fetchone()
            result['results'+str(j)]=rv[0]
        emit('vote_results',result)
        cur.execute("select "+str(result['agenda'])+" from logins where username='"+str(details)+"'")
        rv=cur.fetchone()
        if rv[0]==1:
            emit('vote_on',{'agenda':str(result['agenda'])})
@socketio.on('list')
def handleList(details):
     text=''
     cur=mysql.connection.cursor()
     cur.execute("select count(username) from "+str(details['agenda'])+" where vote="+str(details['option']))
     num=cur.fetchone()
     cur.execute("select username from "+str(details['agenda'])+" where vote="+str(details['option']))
     if num[0]>0:
          for i in range(0,num[0]):
               rv=cur.fetchone()
               text=text+"<br>"+str(rv[0])
          print(text)
          emit('vote_us',{'agenda':str(details['agenda']),'option':str(details['option']),'final_list':text})
     else:
          emit('vote_us',{'agenda':str(details['agenda']),'option':str(details['option']),'final_list':"No Votes Yet."})
          


if __name__=="__main__":
     socketio.run(app,host='0.0.0.0',port='8082')
