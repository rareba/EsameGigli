import urllib2
import json
import datetime
import csv
import time
import os

my_d = {
    "apple" : 50,
    "lemon" : 30,
    "pear" : 100,
    "garlic" : 40
  }

my_d["apple"]


my_c_d = {
    "indirizzo" :
    {
        "via": "Vittorio Veneto",
        "civico" : 5,
        "cap" : 50027,
        "citta" : "Firenze",
        "stato" : "IT"
        },
    "scorte": my_d,
    "dipendenti" : ["1","2","3"],
    "budget":600000,
    "last_year": 500000
}


'''
http://www.gw2spidy.com/api/v0.9/json/listings/19729/sell/1 
idea per progettino su gw2

'''

import urllib2
import json
import datetime
import csv
import time
import os


app_id = "725607114204497"
app_secret = "be05f6b9d69f668b3f3313117851e1b7"

access_token = app_id + "|" + app_secret

page_id = 'nytimes'

path = "C:\Users\GiulioVannini\Documents\Visual Studio 2017\Projects\MABIDA2017\Gigli-Python\data\"

os.chdir(path)

def testFbPageData(page_id, access_token):

    base = "https://graph.facebook.com/v2.8"
    node = "/" + page_id
    parameters = "/?access_token=%s" % access_token
    url = base + node + parameters

    req = urllib2.Request(url)
    response = urllib2.urlopen(req)
    data = json.loads(response.read())

    print json.dumps(data,indent = 4, sort_keys = True)
    print url



testFbPageData(page_id, access_token)

def Request until_succeded(url):
    max_trials=5
    req=urllib2.Request(url);
    success = False
    counter = 0
    response = "Reached max number of trials"

    while success is False:
        try:
            response = urllib2.urlopen(req)
            if response.getcode() == 200:
                success = True
        except Exception e:
            print(e)
            time.sleep(3)
            print "Errore %s: %s" % (url, datetime.datetime.now())

            counter +=1

    if counter > max_trails:
                response = ""
                success = True

    if counter > max_trials:
         return response
     else:
         return response.read()

test_url= "https://graph.facebook.com/v2.8/nytimes/?access_token=" + access_token
Request until_succeded(test_url)






