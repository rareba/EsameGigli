#!/usr/bin/python
# -*- coding: utf-8 -*-


#------------------------------------------------------------------------------------
# Class          : 
# Description    : 
# Version        : 1.0
# Author         : Giovanni Della Lunga
# Last Mod Date  :  
# Note           : we have to put the import of crawler_movies inside the function
#                  in order to avoid circular references 
#                  ref: 
#                  http://stackoverflow.com/questions/1250103/attributeerror-module-object-has-no-attribute)
#------------------------------------------------------------------------------------
class CCrawler:
    def factory(_type):
        from crawlerMyMovies        import CCrawlerMyMovies
 #       from crawlerStaseraTV       import CCrawlerStaseraTV
        
        if _type == "mymovies"      : return CCrawlerMyMovies()
#        if _type == "staseratv"     : return CCrawlerStaseraTV()
        assert 0, "Bad crawler creation: " + _type
    
    factory = staticmethod(factory)
