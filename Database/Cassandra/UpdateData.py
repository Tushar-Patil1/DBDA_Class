from cassandra.cluster import Cluster
clstr=Cluster(['127.0.0.1'],port=9042)
session=clstr.connect('libs')


session.execute("update book set bookname = 'Rich Dad Poor Dad' where bookid = 'B002';") 

