#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import pymysql as mdb

from crawler import CCrawler
from config  import dbConnection

def info_tv():

    conn = None
    query = None
    c1 = None
    c2 = None
    r1 = None

    try:
        conn = mdb.connect(host   =  dbConnection["localhost"], 
                           user   =  dbConnection["root"], 
                           passwd =  dbConnection["giulio123"], 
                           db     =  dbConnection["info_tv"]) 
        
        query = " SELECT * FROM gtv_urls"
            
        c1 = conn.cursor() 
        c1.execute(query)
        for r1 in c1.fetchall() :
            if r1[3] == 1:
                site = r1[0]
                query = " SELECT * FROM gtv_channels WHERE site = '" + site + "'"
                print query
                c2 = conn.cursor()
                c2.execute(query)
                # viene utilizzato il patter factory
                craw = CCrawler.factory(site)
                # for r2 in c2.fetchall() :
                 #   craw.download(conn, r2['ch_page'], r2['ch_text'])   
    
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
    
    
