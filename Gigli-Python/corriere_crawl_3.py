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
            return  # we parse text/html only
        
        filename = os.path.join(STORAGE_DIR, re.sub("\W", "_", response.url) + '.html')
        
        with open(filename, 'wb') as f:
            f.write(response.body)
        
        for href in response.xpath("//a/@href"):
            url = response.urljoin(href.extract())
            if url.startswith("http://www.corriere.it/politica"):
                yield scrapy.Request(url)

#da terminale: scrapy runspider corriere_crawl_3.py -s DEPTH_LIMIT=3
#oppure
#python3 -m scrapy.cmdline runspider corriere_crawl_3.py -s DEPTH_LIMIT=3

        