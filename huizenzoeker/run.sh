scrapy crawl number_of_pages_spider -a place=utrecht    -a province=utrecht       -a kind=koop
scrapy crawl number_of_pages_spider -a place=amersfoort -a province=utrecht       -a kind=koop
scrapy crawl number_of_pages_spider -a place=hilversum  -a province=noord-holland -a kind=koop
scrapy crawl number_of_pages_spider -a place=amsterdam  -a province=noord-holland -a kind=koop
scrapy crawl number_of_pages_spider -a place=eindhoven  -a province=noord-brabant -a kind=koop
scrapy crawl number_of_pages_spider -a place=rotterdam  -a province=zuid-holland  -a kind=koop
scrapy crawl number_of_pages_spider -a place=groningen  -a province=groningen     -a kind=koop

scrapy crawl number_of_pages_spider -a place=utrecht    -a province=utrecht       -a kind=huur
scrapy crawl number_of_pages_spider -a place=amersfoort -a province=utrecht       -a kind=huur
scrapy crawl number_of_pages_spider -a place=hilversum  -a province=noord-holland -a kind=huur
scrapy crawl number_of_pages_spider -a place=amsterdam  -a province=noord-holland -a kind=huur
scrapy crawl number_of_pages_spider -a place=eindhoven  -a province=noord-brabant -a kind=huur
scrapy crawl number_of_pages_spider -a place=rotterdam  -a province=zuid-holland  -a kind=huur
scrapy crawl number_of_pages_spider -a place=groningen  -a province=groningen     -a kind=huur

#scrapy crawl huizenzoeker_spider -a place=utrecht    -a province=utrecht       -a kind=koop -o koop_utrecht_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=amersfoort -a province=utrecht       -a kind=koop -o koop_amersfoort_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=hilversum  -a province=noord-holland -a kind=koop -o koop_hilversum_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=amsterdam  -a province=noord-holland -a kind=koop -o koop_amsterdam_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=eindhoven  -a province=noord-brabant -a kind=koop -o koop_eindhoven_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=rotterdam  -a province=zuid-holland  -a kind=koop -o koop_rotterdam_houses.json -t jsonlines

#scrapy crawl huizenzoeker_spider -a place=utrecht    -a province=utrecht       -a kind=huur -o huur_utrecht_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=amersfoort -a province=utrecht       -a kind=huur -o huur_amersfoort_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=hilversum  -a province=noord-holland -a kind=huur -o huur_hilversum_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=amsterdam  -a province=noord-holland -a kind=huur -o huur_amsterdam_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=eindhoven  -a province=noord-brabant -a kind=huur -o huur_eindhoven_houses.json -t jsonlines
#scrapy crawl huizenzoeker_spider -a place=rotterdam  -a province=zuid-holland  -a kind=huur -o huur_rotterdam_houses.json -t jsonlines