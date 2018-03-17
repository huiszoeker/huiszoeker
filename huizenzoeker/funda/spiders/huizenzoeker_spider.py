import re
import scrapy
from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors import LinkExtractor
from funda.items import FundaItem

class FundaSpider(CrawlSpider):

    name = "huizenzoeker_spider"
    allowed_domains = ["huizenzoeker.nl"]

    def __init__(self, place='utrecht'):
        self.start_urls = ["https://www.huizenzoeker.nl/huur/utrecht/%s/%s/" % (place, page_number) for page_number in range(1,2)]
        self.base_url = "https://www.huizenzoeker.nl/huur/%s/" % place
        self.le1 = LinkExtractor(allow=r'details.html$')

    def parse(self, response):
        links = self.le1.extract_links(response)

        for link in links:
            print "URL"
            print link.url
            item = FundaItem()
            item['url'] = link.url
            yield scrapy.Request(link.url, callback=self.parse_dir_contents, meta={'item': item})

    def parse_dir_contents(self, response):
        new_item = response.request.meta['item']

        location_node = response.xpath('//p[@class="locatie"]/text()').extract()[0]
        postal_code = re.search(r'\d{4} [A-Z]{2}', location_node).group(0)
        city = re.search(r'\d{4} [A-Z]{2} \w+',location_node).group(0).split()[2]
        
        print (postal_code)

        address = response.xpath('//div[@class="details"]/h1/text()').extract()[0]

        price_dd = response.xpath('//div[@class="prijs"]/strong').extract()[0]
        price = re.findall(r' \d+.\d+', price_dd)[0].strip().replace('.','')        

        area_dd = response.xpath("//th[contains(.,'Woonoppervlakte')]/following-sibling::td[1]/text()").extract()[0]
        area = re.findall(r'\d+', area_dd)[0]

        year_built_dd = response.xpath("//th[contains(.,'Bouwjaar')]/following-sibling::td[1]/text()").extract()
        if len(year_built_dd) == 0:
            year_built = 0
        else:     
            year_built = re.findall(r'\d+', year_built_dd[0])[0]

        new_item['postal_code'] = postal_code
        new_item['address'] = address
        new_item['price'] = price
        new_item['year_built'] = year_built
        new_item['area'] = area
        new_item['city'] = city


        print (new_item)

        yield new_item
