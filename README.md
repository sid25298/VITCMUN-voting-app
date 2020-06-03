# VITCMUN-voting-app
A simple voting app with login page and two web pages (Delegates and EB)

Executive Board

-> Start, Stop, Reset, view the number of votes and names of people voting

Delegates

-> gets a notification when voting is started/stopped, View the number of votes and view the name of people voting


How to run this Project:-

1. Install a MySQL Server and import the vitcmun.sql file and make sure the DB name is vitcmun
2. Install the requirements using  "pip install -r requirements.txt" command in Cmd.
3. Run main.py
4. You can find the login details of DB and User inside logins table of the DB.

Tables:-

1. logins - For saving the username,password and role of each user.
2. at     - Contains the data of Attendance
2. pv1    - Contains the data of Procedural Voting 1
2. pv2    - Contains the data of Procedural Voting 2
2. sv     - Contains the data of Substantial Voting
