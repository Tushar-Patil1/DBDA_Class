from cassandra.cluster import Cluster
clstr=Cluster(['127.0.0.1'],port=9042)
session=clstr.connect('libs')


session.execute("insert into book(bookid, bookname, cost, pages) values ('B001','2 states', 200, 190);") 


