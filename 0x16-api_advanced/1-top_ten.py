#!/usr/bin/python3
"""
   Write a function that queries the Reddit API and returns the number of
   subscribers (not active users, total subscribers) for a given subreddit.
   f an invalid subreddit is given, the function should return 0.
"""


import requests


def top_ten(subreddit):
    """ print the title of the hottes topics """
    url = ('https://www.reddit.com/r/{}/hot.json?limit=10'.format(subreddit))
    head = {"User-Agent": "Mozilla/5.0"}
    response = requests.get(url, headers=head).json()

    if response.get('error') == 404:
        print('None')
    else:
        data = response.get('data').get('children')
        for i, obj in enumerate(data):
            if i == 11:
                break
            print(obj.get('data').get('title'))
