## This script helps you create a basic HTTP request
## and get the information from the response.

# Prerequisites:
# > pip install requests

# How to run:
# Run the command py ./HTTPRequests.py

import requests

# The API allows you to specify categories.
chuckNorrisAPI = "https://api.chucknorris.io/jokes/random"
#chuckNorrisAPI = "https://api.chucknorris.io/jokes/random?category=dev"

response = requests.get(url=chuckNorrisAPI)
data = response.json()

# In this case the joke is the `value`field of the json response.
print(f"API Response: {response}")
print(f"Joke:\n {data['value']}")

# uncomment to show the full response
#print(f"Full response:\n{data}")
