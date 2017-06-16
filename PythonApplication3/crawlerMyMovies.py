#!/usr/bin/python
# -*- coding: utf-8 -*-

import re
import nltk
import urllib
import datetime

from utils  import CleanClip
from config import txtOutputPath

import crawler

#------------------------------------------------------------------------------------
# Class          : CCrawlerMyMovies
# Description    : 
# Version        : 1.0
# Author         : Giovanni Della Lunga
# Last Mod Date  :  
# Note           : Ensure inherit from a class, not a module. If we write 
#                  crawlerMyMovies(crawler) we are inheriting my class from module 
#                  crawler and not from the class within (this is a good reason to 
#                  set different names between classes and modules!). The error 
#                  given by the python interpreter is not clear in this case, we get
#                  something like
#                  "TypeError: Error when calling the metaclass bases
#                   module.__init__() takes at most 2 arguments (3 given)"
#                  ref:
#                  http://stackoverflow.com/questions/5102051/python-different-constructor-footprint-in-derived-class
#                  ans. 2
#                  
#------------------------------------------------------------------------------------
class CCrawlerMyMovies(crawler.CCrawler):
    #
    # Method       : download
    # Description  : Download a text from web site and processes it
    #
    def download(self, con, channel, channel_text):
        #try:
           
            url     = "http://www.mymovies.it"
                
            url     = url + "/tv/" + channel + "/"    
            html    = urllib.urlopen(url).read()
            
            raw     = nltk.clean_html(html)
            raw     = nltk.word_tokenize(raw)
            raw     = nltk.Text(raw)
            
            outFile = open(txtOutputPath + "raw.txt", 'w')
            outFile.writelines(["%s\n" % item  for item in raw])
            outFile.close()

            s = self.ExtractInfoMyMovies(raw)
                
            outFile = open(txtOutputPath + "out.txt", 'w')
            outFile.write(s)
            outFile.close()
            
            if channel_text != '':
                print channel_text
                self.PutOnDb(con, channel_text)        
                    
        #except Exception as e:
        #    print "Errore nel recupero dati per il canale " + channel
        #    print e.message
    #
    # Method       : ExtractInfoMyMovies
    # Description  :
    #
    def ExtractInfoMyMovies(self, lst):
        
        # Questo sliding e'  specifico  per il sito in esame
        # restituisce l'indice dell'elemento della lista raw 
        # che contiene la parola 'programma'.
        l = [index for index, item in enumerate(lst) if item == 'Programma']
        raw = lst[l[0]:]
                
        l = [index for index, item in enumerate(raw) if item == '|']
        raw = raw[:l[0]]
                
        s = ' '.join(raw)
                
        s = CleanClip(s)
                
        # eliminazione continuazioni
        s = s.replace("continua & raquo ; & laquo ; continua","")
        s = s.replace("& raquo","")        
        # eliminazione righe non informative (dipendono dal sito in esame)
        s = s.replace("Programma : film serie tutti","")
        s = s.replace("Televisione Digitale Terrestre RaiUno","")
                
        # inserimento a capo
        s = s.replace("Ore","\n") 
    
        return s
    #
    # Method       :
    # Description  :
    #
    def PutOnDb(self, con, channel_text):
        try:
            cur  = con.cursor() 
            # current date is today + time lag   
            now  = datetime.datetime.now()
            current_date = str(now)[:10]
            
            lines = [line.strip() for line in open(txtOutputPath + "out.txt")]
            for line in lines:
                if line:
                    ora     = (re.findall(r'[0-9][0-9],[0-9][0-9]', line))[0]
                    program = line[len(ora) + len(channel_text) + 2:]
                    
                    #print ora, channel_text
                    #_info = self.AnalyzeProgram(program)
                    #for k in _info:
                    #    print k + ' : ' + _info[k] + '\n'
                    hh = ora.split(",")[0]
                    mm = ora.split(",")[1]
                    ss = '00'
                    ora = hh +':' + mm + ':' + ss
                    cur.execute("""INSERT INTO gtv_clips VALUES(%s,%s,%s,%s,%s,'')""",(current_date, ora, channel_text,"MY MOVIES", program))
                    #cur.execute("""INSERT INTO gtv_clips_details VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""",(current_date, ora, channel_text,"MY MOVIES", _info['TITOLO'], _info['REGIA'], _info['CON '], _info['TRAMA'], _info['PRODUZIONE'], _info['DURATA'], _info['GENERE']))

        except:
            return 1
        finally:
            con.commit()
            if cur:
                cur.close()
            return 0
    #
    # Method       : AnalyzeProgram
    # Description  : This function try to extract from the string program all the informations related to regia, produzione, etc...
    #
    def AnalyzeProgram(self, program):
    
        keys = ["Regia","Consigliato","Con ","Genere","Produzione","Durata"]
    
        _dict   = {}
        _found  = {}
        for k in keys:
            n = program.upper().find(k.upper())
            if n > 0:
                _dict[n]            = k
                _found[k.upper()]   = 1
        sections = sorted(_dict)        
    
        analyzed = {} 
        analyzed['TITOLO']      = ''  
        analyzed['REGIA']       = ''  
        analyzed['DURATA']      = ''  
        analyzed['TRAMA']       = ''  
        analyzed['CON ']         = ''  
        analyzed['GENERE']      = ''  
        analyzed['CONSIGLIATO'] = ''  
        analyzed['PRODUZIONE']  = ''  
        if sections:  
            startTitolo = 0
            endTitolo   = program.find("(") 
            analyzed['TITOLO'] = program[startTitolo:endTitolo].strip()
        
            for m in range(len(sections)):
                key             = _dict[sections[m]].upper()
                if m < len(sections)-1: 
                    value           = program[sections[m]:sections[m+1]].strip().rstrip('.,')
                else:
                    endSection = program[sections[m]:].find('.')
                    value      = program[sections[m]:sections[m] + endSection].strip().rstrip('.,')    
                analyzed[key]   = value[len(key):].strip() 
            
            analyzed['REGIA']  = analyzed['REGIA'].replace('di ','').strip()
            
            #sezione durata e trama
            resto = program[sections[m]:].split('.')
            if 'DURATA' in _found: analyzed['DURATA'] = resto[0][len('Durata'):]
            
            buffer      = '.'.join(resto[1:])
            endTrama    = buffer.find('Recensione')
            if endTrama > 0:
                analyzed['TRAMA']  = buffer[:endTrama] 
            else:
                analyzed['TRAMA']  = buffer
        else:
            analyzed['TITOLO'] = program
        return analyzed 
