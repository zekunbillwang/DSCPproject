# -*- coding: utf-8 -*-
"""STAT 605 Covariance function.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1ZMrkLLAaS5_5OIqVpmaraSNRtzURkvYu
"""

!pwd

import csv

stars=[]
date=[]
product_id=[]

with open('/content/drive/MyDrive/STAT 605 /amazon_reviews_us_Musical_Instruments_v1_00 2.tsv', newline='', encoding='utf-8') as tsvfile:
    tsvreader = csv.DictReader(tsvfile, delimiter='\t')

    for row in tsvreader:
        stars.append(row['star_rating'])
        date.append(row['review_date'])
        product_id.append(row['product_id'])

import pandas as pd
data = {'star_rating': stars, 'review_date': date,'product_id':product_id}

df = pd.DataFrame(data)

df['review_date']

df['review_date'] = pd.to_datetime(df['review_date'], errors='coerce')

df = df.dropna(subset=['review_date'])

df['star_rating'] = df['star_rating'].astype(int)

import pandas as pd

# Group by 'review_date', calculate the mean of 'star_rating', and count the number of reviews
daily_stats = df.groupby('review_date').agg({
    'star_rating': 'mean',  # Calculate the mean star rating
    'review_date': 'size'   # Count the number of reviews per day
}).rename(columns={'review_date': 'review_count'}).reset_index()

# Output the result
print(daily_stats)

data=daily_stats['star_rating']

import numpy as np

# Function to compute autocorrelation values for all lags from 1 to n-1
def autocorrelation_all_lags(X):
    n = len(X)
    X_mean = np.mean(X)
    autocorr_values = []
    for h in range(1, n):
        autocorr = np.sum((X[h:] - X_mean) * (X[:n-h] - X_mean)) / n
        autocorr_values.append(autocorr)
    return autocorr_values

# Calculate autocorrelation values for all lags from 1 to n-1
all_autocorrelations = autocorrelation_all_lags(data)