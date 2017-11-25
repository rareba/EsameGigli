import scrapy
import re
import os
#from urllib.parse import urljoin

STORAGE_DIR = "/home/mabida2016/Workspace/Management Data Science/Moduli/07 Web Scraping for business Intelligence/pages2/ikea"

class IkeaSpider(scrapy.Spider) :

    name = "Ikea"
    allower_domains = ["http://www.ikea.com/"]
    start_urls = ["http://www.ikea.com/it/it/catalog/productsaz/8/"]
    
    def parse(self, response):
        
        if not response.headers.get("Content-Type").startswith(b'text/html'):
            return  #non effettua il parsing se il contenuto non e' text/html
        
        filename = os.path.join(STORAGE_DIR, re.sub("\W", "_", response.url) + '.html')
        
        with open(filename, 'wb') as f:
            f.write(response.body)
        
        for href in response.xpath("//a/@href"):
            url = response.urljoin(href.extract())
            if url.startswith("http://www.ikea.com/it/it/catalog/products"):
                yield scrapy.Request(url)

#da terminale: scrapy runspider ikea_crawl.py
#oppure
#python3 -m scrapy.cmdline runspider ikea_crawl.py

#Esercizio: scrapa ikea e
#costruisci una distribuzione del prezzo dei prodotti 
#ordina i prodotti per prezzo
#ordina i prodotti per like ricevuti