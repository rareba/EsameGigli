#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import MySQLdb as mdb

from crawler import CCrawler
from config  import dbConnection

def info_tv():

    try:
        conn = mdb.connect(host   =  dbConnection["host"], 
                           user   =  dbConnection["user"], 
                           passwd =  dbConnection["passwd"], 
                           db     =  dbConnection["db"]) 
        
        query = " SELECT * FROM gtv_urls"
            
        c1 = conn.cursor(mdb.cursors.DictCursor) 
        c1.execute(query)
        for r1 in c1.fetchall() :
            if r1['active'] == 1:
                site = r1['site']
                query = " SELECT * FROM gtv_channels WHERE site = '" + site + "'"
                c2 = conn.cursor(mdb.cursors.DictCursor)
                c2.execute(query)
                # viene utilizzato il patter factory
                craw = CCrawler.factory(site)
                for r2 in c2.fetchall() :
                    craw.download(conn, r2['ch_page'], r2['ch_text'])   
    
    except:
        print "Unexpected error:", sys.exc_info()[0]
        
    finally:
        if conn:
            conn.close()
        print 'Programma terminato'
#_______________________________________________________________________________________________________________________________
#
if __name__ == "__main__":
    info_tv()
    
    
