import scrapy
import re
import os

STORAGE_DIR = "pages2/corriere"

class CorriereSpider(scrapy.Spider):
    name = "corriere"
    allowed_domains = ["www.corriere.it"]
    start_urls = ["http://www.corriere.it/politica/" ]

    def parse(self, response):
        if not response.headers.get("Content-Type").startswith(b'text/html'):
            return #non effettua il parsing se il contenuto non e' text/html
        
        filename = os.path.join(STORAGE_DIR, re.sub("\W", "_", response.url) + '.html')
        
        with open(filename, 'wb') as f:
            f.write(response.body)

#da terminale: scrapy runspider corriere_crawl_2.py
#oppure
#python3 -m scrapy.cmdline runspider corriere_crawl_2.py
        
        