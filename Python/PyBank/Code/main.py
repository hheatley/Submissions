#import and read csv file
import os
import csv

csvpath = os.path.join('..', 'Code', 'budget_data.csv')

with open(csvpath, newline='') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',')
    csv_header = next(csvreader)
#The total number of months included in the dataset
    uniqueMonths=[]
    profitLoss = []
    profitLossChange = []
    for row in csvreader:
        if row[0] not in uniqueMonths:
            uniqueMonths.append(row[0])
 #The net total amount of "Profit/Losses" over the entire period           
            profitLoss.append(int(row[1]))
 #The average of the changes in "Profit/Losses" over the entire period   
    for i in range(1,len(profitLoss)):
        profitLossChange.append(profitLoss[i] - profitLoss[i-1])   
        profitLossAverage = sum(profitLossChange)/len(profitLossChange)
        profitLossChangeMax = max(profitLossChange)
        profitLossChangeMin = min(profitLossChange)
        profitLossChangeMaxDate = str(uniqueMonths[profitLossChange.index(max(profitLossChange))])
        profitLossChangeMinDate = str(uniqueMonths[profitLossChange.index(min(profitLossChange))])

#print all loops
    print("Financial Analysis")
    print("------------------")
    print('Total Months: ' + str(len(uniqueMonths)))
    print("Total Revenue: $", sum(profitLoss))
    print("Avereage Change: $", str(float(round(profitLossAverage,2))))
    print("Greatest Increase in Revenue:", str(profitLossChangeMaxDate),"($", str(profitLossChangeMaxDate),")")
    print("Greatest Decrease in Revenue:", str(profitLossChangeMinDate),"($", str(profitLossChangeMinDate),")")
  
#ouptut to .txt
 python main.py > C:\Users\HHeatley\Documents\GitHub\ClassSubmissions\Submissions\Python\PyBank\Results/outpot.txt