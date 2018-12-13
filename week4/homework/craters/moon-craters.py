import requests
from lxml import etree
import time

urls = [
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_A%E2%80%93B',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_C%E2%80%93F',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_G%E2%80%93K',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_O%E2%80%93Q',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_R%E2%80%93S',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_T%E2%80%93Z',
    'https://en.wikipedia.org/wiki/List_of_craters_on_the_Moon:_L%E2%80%93N'
]

parser = etree.HTMLParser()

def get_coords(url):
    res = requests.get(url)
    tree = etree.fromstring(res.text, parser)
    coords = tree.xpath('//span[@class="geo"]/text()')
    return coords

def get_diam(url):
    res = requests.get(url)
    tree = etree.fromstring(res.text, parser)
    diam = tree.xpath('//tbody[1]/tr/td[3]/text()')
    return diam


all_coords = []
all_diams = []

for url in urls:
    coords = get_coords(url)
    diams = get_diam(url)
    all_coords += coords
    all_diams += diams

    print('added {} coords {} diams'.format(len(coords),len(diams)))

print('total of {} lines'.format(len(all_coords)))

i=0

with open('moon_crater_coords.csv', 'w') as f:
    f.write('lat,lon,diam\n')
    for row in all_coords:
        lat, lon = row.split('; ')
        diam = all_diams[i]
        f.write('{},{},{}\n'.format(lat, lon, diam))
        i+=1
