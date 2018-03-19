# -*- coding: utf-8 -*-
import scrapy
from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors import LinkExtractor

class NumberOfPagesSpider(CrawlSpider):
    name = "number_of_pages_spider"
    allowed_domains = ["huizenzoeker.nl"]

    def __init__(self, place='utrecht', province='utrecht', kind='koop'):
        self.place = place
        self.province = province
        self.kind = kind

        self.start_urls = ["https://www.huizenzoeker.nl/%s/%s/%s/" % (kind, province, place)]
        self.le_maxpage = LinkExtractor(allow=r'\d+\/$')

    def parse(self, response):
        links = self.le_maxpage.extract_links(response)
        max_page_number = 0

        for link in links:
            if link.url.count('/') == 7 and link.url.endswith('/'):         # Select only pages with a link depth of 3
                page_number = int(link.url.split("/")[-2].strip('p'))       # For example, get the number 10 out of the string 'http://www.funda.nl/koop/amsterdam/p10/'
                if page_number > max_page_number:
                    max_page_number = page_number                           # Update the maximum page number if the current value is larger than its previous value

        filename = '%s_%s_max_pages.txt' % (self.kind, self.place)                         # File name with as prefix the place name

        with open(filename,'wb') as f:
            f.write('%s' % max_page_number)               # Write the maximum page number to a text file
