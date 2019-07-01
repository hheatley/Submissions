#The total number of votes cast

import os
import csv

csvpath = os.path.join('..', 'Code', 'election_data.csv')

with open(csvpath, newline='') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',')
    csv_header = next(csvreader)

    uniqueVotes=[]
    votesCast = []
    for row in csvreader:  
        uniqueVotes.append(row[0])
        votesCast+=(int(row[1]))
    print('Total Votes: ' + str(int(votesCast)))
#A complete list of candidates who received votes


#The percentage of votes each candidate won


#The total number of votes each candidate won


#The winner of the election based on popular vote.