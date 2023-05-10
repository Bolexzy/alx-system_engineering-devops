#!/usr/bin/python3
"""Function that queries the Reddit API
prints a sorted count of given keywords from title of all hot articles"""
import requests

after = None
counts = {}


def count_words(subreddit, word_list):
    """Prints sorted counts of given words
    found in hot posts of a given subreddit.
    """
    global after
    global counts

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)

    params = {
            "limit": 100,
            }

    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0 (by /u/Various_Ad_2057)"
        }

    if after:
        params['after'] = after

    response = requests.get(url, headers=headers,
                            params=params, allow_redirects=False)

    if response.status_code != 200:
        return

    after = response.json().get('data').get('after')

    data = response.json().get('data').get('children')
    titles = [post.get('data').get('title').lower() for post in data]

    for title in titles:
        for word in title.split():
            if word.lower() in word_list:
                if word.lower() not in counts:
                    counts[word.lower()] = 0
                counts[word.lower()] += 1

    if after is None:
        results = []
        for word in word_list:
            if word.lower() in counts:
                results.append((word.lower(), counts[word.lower()]))
        results.sort(key=lambda x: (-x[1], x[0]))
        for result in results:
            print("{}: {}".format(result[0], result[1]))
    else:
        return count_words(subreddit, word_list)
