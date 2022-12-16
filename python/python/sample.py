import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="root",
  database="imdb"
)

mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM imdb.movie")
for i in mycursor:
    print(i)