import os 
import pandas as pd

path        = "C:/Users/User/Dropbox/Strategia Non Frequentanti/Excel_SQL - Della Lunga/data"
file_name_1 = "Ordini.xlsx"
file_name_2 = "Clienti.xlsx"

# Read the file
ordini_df = pd.read_excel(os.path.join(path,file_name_1))
# Output the number of rows
print("Total rows in ordini dataframe : {0}".format(len(ordini_df)))
# See which headers are available
print(list(ordini_df))
#
clienti_df = pd.read_excel(os.path.join(path,file_name_2))
# Output the number of rows
print("Total rows in clienti dataframe: {0}".format(len(clienti_df)))
# See which headers are available
print(list(clienti_df))

resdf = ordini_df.merge(clienti_df, left_on='idcliente', right_on='idcliente')
print resdf.head()

ordini_sort = ordini_df.sort_values('prezzototale', ascending=False)
print ordini_sort.head()

ordini_pivot = ordini_df.groupby('stato').size()
print ordini_pivot

