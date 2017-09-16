# learn how to scrape a Facebook Fan Page and make practice with python 
# dictionaries using python 2.7
# what is a dictionary?
# example

my_dictionary = {"apple": 50, 
                 "lemon": 30, 
                 "pear": 100, 
                 "garlic": 40}

my_dictionary["apple"]
my_dictionary["mango"] # error returned

my_complex_dictionary = {"indirizzo" : {"via": "Via Veneto",
                                        "civico": 5,
                                        "cap": 50027,
                                        "citta": "firenze"},
                        "scorte": my_dictionary,
                        "dipendenti": ["00123", "05694", "32424", "34954"],
                        "budget": 600000,
                        "last_year": 500000}

my_complex_dictionary["dipendenti"]
my_complex_dictionary["indirizzo"]["via"]
my_complex_dictionary["scorte"]

############################################################
#
# before going on be sure to have set up you FB DEV account!
#
############################################################

# import some Python dependencies

import urllib2
import json
import datetime
import csv
import time
import os

# Since the code output in this notebook leaks the app_secret,
# it has been reset by the time you read this.

app_id = "725607114204497"
app_secret = "be05f6b9d69f668b3f3313117851e1b7"

access_token = app_id + "|" + app_secret

page_id = 'nytimes'
path = 'C:\Users\GiulioVannini\Documents\Visual Studio 2017\Projects\MABIDA2017\Gigli-Python\data'
os.chdir(path)

def testFacebookPageData(page_id, access_token):
    
    # takes in input a FB page ID and the access_token
    # returns the FB graph url if all good
    
    # construct the URL string
    base = "https://graph.facebook.com/v2.8"
    node = "/" + page_id
    parameters = "/?access_token=%s" % access_token
    url = base + node + parameters
    
    # retrieve data
    req = urllib2.Request(url)
    response = urllib2.urlopen(req)
    data = json.loads(response.read())
    
    print json.dumps(data, indent=4, sort_keys=True)
    print url
    

testFacebookPageData(page_id, access_token)

def request_until_succeed(url):
    
    # manages problems in connection, or delay in server answer
    
    max_trials = 5
    req = urllib2.Request(url)
    success = False
    counter = 0
    
    while success is False:
        try: 
            response = urllib2.urlopen(req)
            if response.getcode() == 200:
                success = True
        except Exception, e:
            print(e)
            time.sleep(3)
            print "Error for URL %s: %s" % (url, 
                                            datetime.datetime.now())
            counter +=1
            
            if counter > max_trials:
                response = ""
                success = True
                
    if counter > max_trials:
        return response
    else:
        return response.read()

test_url = "https://graph.facebook.com/v2.8/nytimes/?access_token=" + access_token
request_until_succeed(test_url)

def getFacebookPageFeedData(page_id, 
                            access_token, 
                            num_statuses):
    
    # construct the URL string
    base = "https://graph.facebook.com"
    node = "/" + page_id + "/feed" 
    parameters = "/?fields=message,link,created_time,type,name,id,likes.limit(1).summary(true),comments.limit(1).summary(true),shares&limit=%s&access_token=%s" % (num_statuses, access_token) # changed
    url = base + node + parameters
    print(url)
    
    # retrieve data
    data = json.loads(request_until_succeed(url))
    
    return data
    
test_status = getFacebookPageFeedData(page_id, access_token, 1)["data"][0]
print(test_status) #messy print

print json.dumps(test_status, indent=4, sort_keys=True) #pretty print


def processFacebookPageFeedStatus(status):
    
    # reads the dictionary status and uses keys to call values
    
    # Additionally, some items may not always exist,
    # so must check for existence first
    
    status_id = status['id']
    status_message = '' if 'message' not in status.keys() else status['message'].encode('utf-8') # encoding is very important
    link_name = '' if 'name' not in status.keys() else status['name'].encode('utf-8')
    status_type = status['type']
    status_link = '' if 'link' not in status.keys() else status['link']
    
    
    # Time needs special care since 
    # a) it's in UTC and
    # b) it's not easy to use in statistical programs.
    
    status_published = datetime.datetime.strptime(status['created_time'],'%Y-%m-%dT%H:%M:%S+0000')
    # status_published = status_published + datetime.timedelta(hours=-5) # EST
    status_published = status_published.strftime('%Y-%m-%d %H:%M:%S') # best time format for spreadsheet programs
    
    # Nested items require chaining dictionary keys.
    
    num_likes = 0 if 'likes' not in status.keys() else status['likes']['summary']['total_count']
    
    
    '''
    print 'status.keys', status.keys()
    print "status['comments']['summary']", status['comments']['summary']
    if 'comments' in status.keys():
        print status['comments']['summary']
        if 'message' in status.keys():
            print status['id'], status['type'], status['created_time'], status['message'], status['comments']['summary']['order']#, status['comments']['summary']['chronological']
    '''
    
    if 'comments' in status.keys():
        try:
            num_comments = status['comments']['summary']['total_count']
        except:
            num_comments = "na"
    
    num_shares = 0 if 'shares' not in status.keys() else status['shares']['count']
    
    # return a tuple of all processed data
    return (status_id, status_message, link_name, status_type, status_link,
           status_published, num_likes, num_comments, num_shares)

processed_test_status = processFacebookPageFeedStatus(test_status)
print processed_test_status


def scrapeFacebookPageFeedStatus(page_id, access_token):
    
    # writes desired data collected from the statuses on a file, status by status, 
    # after calling getFacebookPageFeedData() to return the status, and 
    # processFacebookPageFeedStatus() to process the status
    
    with open('%s_facebook_statuses_test.csv' % page_id, 'wb') as file:
        
        w = csv.writer(file)
        w.writerow(["status_id", "status_message", "link_name", "status_type", "status_link",
           "status_published", "num_likes", "num_comments", "num_shares"]) # writes headers
        
        has_next_page = True
        num_processed = 0   # keep a count on how many status we've processed so far
        scrape_starttime = datetime.datetime.now()
        
        print "Scraping %s Facebook Page: %s\n" % (page_id, scrape_starttime)
        
        statuses = getFacebookPageFeedData(page_id, access_token, 100) #get the status in json format
        
        while has_next_page:
            for status in statuses['data']:
                w.writerow(processFacebookPageFeedStatus(status)) # writes data defined in lie 178-9 on the file
                
                # output progress occasionally to make sure code is not stalling
                num_processed += 1
                if num_processed % 1000 == 0:
                    print "%s Statuses Processed: %s" % (num_processed, datetime.datetime.now())
                    
            # if there is no next page, we're done.
            if 'paging' in statuses.keys():
                statuses = json.loads(request_until_succeed(statuses['paging']['next']))
            else:
                has_next_page = False
                
        
        print "\nDone!\n%s Statuses Processed in %s" % (num_processed, datetime.datetime.now() - scrape_starttime)


scrapeFacebookPageFeedStatus(page_id, access_token)

def get_reactions_from_file_to_file(file_to_read,file_to_write, access_token):
    
    # reads the file where we saved the previous data, get the status_id, collect from FB graph 
    # number of different reactions
    
    reaction_fields_list = ['reactions.type(LIKE).summary(total_count).limit(0).as(like)',
                       'reactions.type(LOVE).summary(total_count).limit(0).as(love)',
                       'reactions.type(WOW).summary(total_count).limit(0).as(wow)',
                       'reactions.type(HAHA).summary(total_count).limit(0).as(haha)',
                       'reactions.type(SAD).summary(total_count).limit(0).as(sad)',
                       'reactions.type(ANGRY).summary(total_count).limit(0).as(angry)']
    
    reaction_fields = ",".join(reaction_fields_list)
    base = "https://graph.facebook.com/"
    parameters = "&access_token=" + access_token
    
    file_to_read  = open(file_to_read, "rb")
    ftr = csv.reader(file_to_read)
    
    file_to_write = open(file_to_write, 'wb')
    ftw = csv.writer(file_to_write)
    
    ftw.writerow(("status_id", "num_like", "num_love", "num_wow", "num_haha", "num_sad", "num_angry"))
    
    rownum = 0
    for row in ftr:
        
        # Writes header row.
        if rownum == 0:
            header = row
            
        # else writes data
        else:
            status_id = row[0]
            url = base + status_id + "/?fields=" + reaction_fields + parameters
            
            data = request_until_succeed(url)
            
            if data != "":
                reactions = json.loads(data)
    
                num_like = 0 if 'like' not in reactions.keys() else reactions['like']['summary']['total_count']
                num_love = 0 if 'love' not in reactions.keys() else reactions['love']['summary']['total_count']
                num_wow = 0 if 'wow' not in reactions.keys() else reactions['wow']['summary']['total_count']
                num_haha = 0 if 'haha' not in reactions.keys() else reactions['haha']['summary']['total_count']
                num_sad = 0 if 'sad' not in reactions.keys() else reactions['sad']['summary']['total_count']
                num_angry = 0 if 'angry' not in reactions.keys() else reactions['angry']['summary']['total_count']
                    
            else:
                num_like = ""
                num_love = ""
                num_wow = ""
                num_haha = ""
                num_sad = ""
                num_angry = ""
            
            print rownum #check status
            ftw.writerow((status_id, num_like, num_love, num_wow, num_haha, num_sad, num_angry))
            
        rownum += 1
        
    file_to_write.close()
    file_to_read.close()

get_reactions_from_file_to_file("nytimes_facebook_statuses.csv",'nytimes_facebook_statuses_reactions.csv', access_token)


def get_comments_from_file_to_file(file_to_read, file_to_write, access_token):

    # reads the file where we saved the statuses, get the status_id, collect from FB graph 
    # the number of likes of each comment and the number of comments the comment received

    field_list = ['comment_count','like_count','created_time']#,'message']

    field_list = ",".join(field_list)
    base = "https://graph.facebook.com/"
    parameters = "&access_token=" + access_token
    
    file_to_read  = open(file_to_read, "rb")
    ftr = csv.reader(file_to_read)
    
    file_to_write = open(file_to_write, 'a')
    ftw = csv.writer(file_to_write)
    
    ftw.writerow(("status_id", "message", "created_time", "like_count", "comment_count"))
    
    rownum = 0
    
    for row in ftr:
        # Save header row.
        if rownum < 0:
            
            header = row
            
        # else do your job
        else:
            nr_comment = 1
            
            status_id = row[0]
            url = base + status_id + "/comments?fields=" + field_list + '&limit=1' + parameters
            print url
                            
            
            data = json.loads(request_until_succeed(url))
            
            #print rownum, nr_comment#, data
            
            #if data exists get them, otherwise go to next status
            if data != "" and data['data'] != []:
                
                message = "" #if 'message' not in data['data'][0] else data['data'][0]['message'].encode('utf-8')
                created_time = "" if 'created_time' not in data['data'][0] else datetime.datetime.strptime(data['data'][0]['created_time'],'%Y-%m-%dT%H:%M:%S+0000')
                like_count = 0 if 'like_count' not in data['data'][0] else data['data'][0]['like_count']
                comment_count = 0 if 'comment_count' not in data['data'][0] else data['data'][0]['comment_count']
                
                #print (status_id, message, created_time, like_count, comment_count)
                
                ftw.writerow((status_id, message, created_time, like_count, comment_count))
                             
                has_next_page = False
                
                #print "check1", has_next_page, data['paging']
                if 'next' in data['paging']:
                    has_next_page = True
                    
                #print "check2",has_next_page, data['paging']
                
                #raw_input()
                
                while has_next_page == True:
                    
                    nr_comment += 1
                    
                    print rownum, nr_comment
                    
                    try:
                        data = json.loads(request_until_succeed(data['paging']['next']))
                    except:
                        data = ""
                    
                    #print data, "\n"
                    
                    #if data exists get them otherwise go to next status
                    if data != "" and data['data'] != []:
                        
                        #print data, "\n"
                        #print data['data']
                    
                        message = "" #if 'message' not in data['data'][0] else data['data'][0]['message'].encode('utf-8')
                        created_time = "" if 'created_time' not in data['data'][0] else datetime.datetime.strptime(data['data'][0]['created_time'],'%Y-%m-%dT%H:%M:%S+0000')
                        like_count = 0 if 'like_count' not in data['data'][0] else data['data'][0]['like_count']
                        comment_count = 0 if 'comment_count' not in data['data'][0] else data['data'][0]['comment_count']
                        
                        ftw.writerow((status_id, message, created_time, like_count, comment_count))
    
                        if 'next' not in data['paging']:
                            
                            has_next_page = False
                    
                    else:
                        
                        has_next_page = False
                        
            else:
                
                message = ""
                created_time = ""
                like_count = ""
                comment_count = ""
                
                print (status_id, message, created_time, like_count, comment_count)
                ftw.writerow((status_id, message, created_time, like_count, comment_count))
            
        
        rownum += 1
    
    file_to_write.close()
    file_to_read.close()

get_comments_from_file_to_file("nytimes_facebook_statuses.csv","nytimes_facebook_statuses_comments.csv", access_token)
