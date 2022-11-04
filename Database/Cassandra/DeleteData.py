from cassandra.cluster import Cluster
clstr=Cluster()
session=clstr.connect('libs')


session.execute("delete from book where bookid = 'B003';") 





