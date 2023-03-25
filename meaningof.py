#!/usr/bin/python3

import requests
import sys

count = 0
n = len(sys.argv)

for i in range(1, n):
    arg = sys.argv[i]

api_url = str("https://api.dictionaryapi.dev/api/v2/entries/en_US/" + arg )
        
req = requests.get(api_url)
dct = req.json()

if "title" in dct:
    print(dct["title"] + ":\n\t",dct["message"])

else:
    word = dct[0]["word"]
    definition = dct[0]["meanings"][0]["definitions"][0]["definition"]
    print(word + ":\n\tdefination:", definition) 