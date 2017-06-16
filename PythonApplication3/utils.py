#!/usr/bin/python
# -*- coding: utf-8 -*-
Months      = ['gennaio','febbraio','marzo','aprile','maggio','giugno', 'luglio','agosto','settembre','ottobre','novembre','dicembre']
weekDays    = ['Lunedi','Martedi','Mercoledi','Giovedi','Venerdi', 'Sabato', 'Domenica']

def ToDataMySQL(_data, _format):
    if _format == "DD month YYYY":
        data    = _data.lower().split(' ')
        day     = "%02d" % int(data[0])
        month   = "%02d" % int([index for index, item in enumerate(Months) if item == data[1]][0] + 1)
        year    = "%04d" % int(data[2])
    return year + "-" + month + "-" + day    


#------------------------------------------------------------------------------------
# Function       : 
# Description    : 
# Version        : 1.0
# Author         : Giovanni Della Lunga
# Last Mod Date  :  
#------------------------------------------------------------------------------------
def CleanClip(s):

    # sostituzione caratteri speciali
    s = s.replace("& quot ;"   ,'"')
    s = s.replace("& hellip ;" ,'...')
    s = s.replace("& # 039 ;"  ,"'")
    s = s.replace("& amp ;"    , "&")
    s = s.replace("& # 38 ;"   , "&")
            
    # sostituzione accenti gravi
    s = s.replace(" & agrave ;","a")
    s = s.replace(" & egrave ;","e")
    s = s.replace(" & igrave ;","i")
    s = s.replace(" & ograve ;","o")
    s = s.replace(" & ugrave ;","u")
            
    s = s.replace("à","a")
    s = s.replace("è","e")
    s = s.replace("ì","i")
    s = s.replace("ò","o")
    s = s.replace("ù","u") 
            
    # altra codifica accento
    s = s.replace(" & # 224 ;", "a")
    s = s.replace(" & # 232 ;", "e")
    s = s.replace(" & # 233 ;", "e")
    s = s.replace(" & # 236 ;", "i")
    s = s.replace(" & # 248 ;", "o")
    
    s = s.replace("“",'"')
    s = s.replace("”",'"')
    s = s.replace("& # 249 ; s","")
    return s


if __name__ == "__main__":
    print ToDataMySQL("5 GIUGNO 2013", "DD month YYYY")