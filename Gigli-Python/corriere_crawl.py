import scrapy

class CorriereSpider(scrapy.Spider):
    name = "corriere"
    allowed_domains = ["www.corriere.it"]
    start_urls = ["http://www.corriere.it/politica/" ]

    def parse(self, response):
        print("Body:", response.body)

#da terminale: scrapy runspider corriere_crawl.py
#oppure
#python3 -m scrapy.cmdline runspider corriere_crawl.py