import pymysql

db = pymysql.connect("127.0.0.1","root","giulio123","info_tv")

cursor = db.cursor()

sql="INSERT INTO gtv_urls(site,url,name,active) VALUES ('%s','%s','%s','%d')"%('mymovies','http://www.mymovies.it/','MY MOVIES',1)

print sql

try:
    cursor.execute(sql)
    db.commit()
except Exception as e:
        print e.message
        db.rollback()
db.close()
