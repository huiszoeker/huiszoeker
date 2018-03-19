


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

scrapy crawl huizenzoeker_spider -a place=utrecht    -a province=utrecht       -a kind=koop -a number_of_pages=$(<koop_utrecht_max_pages.txt)    -o koop_utrecht_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=amersfoort -a province=utrecht       -a kind=koop -a number_of_pages=$(<koop_amersfoort_max_pages.txt) -o koop_amersfoort_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=hilversum  -a province=noord-holland -a kind=koop -a number_of_pages=$(<koop_hilversum_max_pages.txt)  -o koop_hilversum_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=amsterdam  -a province=noord-holland -a kind=koop -a number_of_pages=$(<koop_amsterdam_max_pages.txt)  -o koop_amsterdam_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=eindhoven  -a province=noord-brabant -a kind=koop -a number_of_pages=$(<koop_eindhoven_max_pages.txt)  -o koop_eindhoven_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=rotterdam  -a province=zuid-holland  -a kind=koop -a number_of_pages=$(<koop_rotterdam_max_pages.txt)  -o koop_rotterdam_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=groningen  -a province=groningen     -a kind=koop -a number_of_pages=$(<koop_groningen_max_pages.txt)  -o koop_rotterdam_houses.json -t jsonlines

scrapy crawl huizenzoeker_spider -a place=utrecht    -a province=utrecht       -a kind=huur -a number_of_pages=$(<huur_utrecht_max_pages.txt)    -o huur_utrecht_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=amersfoort -a province=utrecht       -a kind=huur -a number_of_pages=$(<huur_amersfoort_max_pages.txt) -o huur_amersfoort_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=hilversum  -a province=noord-holland -a kind=huur -a number_of_pages=$(<huur_hilversum_max_pages.txt)  -o huur_hilversum_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=amsterdam  -a province=noord-holland -a kind=huur -a number_of_pages=$(<huur_amsterdam_max_pages.txt)  -o huur_amsterdam_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=eindhoven  -a province=noord-brabant -a kind=huur -a number_of_pages=$(<huur_eindhoven_max_pages.txt)  -o huur_eindhoven_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=rotterdam  -a province=zuid-holland  -a kind=huur -a number_of_pages=$(<huur_rotterdam_max_pages.txt)  -o huur_rotterdam_houses.json -t jsonlines
scrapy crawl huizenzoeker_spider -a place=groningen  -a province=groningen     -a kind=huur -a number_of_pages=$(<huur_groningen_max_pages.txt)  -o huur_groningen_houses.json -t jsonlines