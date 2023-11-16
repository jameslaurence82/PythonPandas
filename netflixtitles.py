"""
Assignment 6 - Netflix Titles Data Wrangling
Using Pandas, Numpy, PostgresSQL
"""
import pandas as pd
import numpy as np

# Psuedocode
# import netflix csv data
# transform data using Pandas or Numpy
# clean data using Pandas or Numpy
# export data using python or to PostgresSQL


# import netflix csv as dataframe
netflixdf = pd.read_csv("netflix_titles.csv")

# check shape of data frame
print(netflixdf.shape)
# (8807 rows, 12 columns)