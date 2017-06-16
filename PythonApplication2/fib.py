'''
Created on 16 mag 2017

@author: User
'''

from __future__ import print_function 

'''
Created on 02 mag 2017

@author: Giovanni Della Lunga

Module fib.py '''

def even_fib(n): 
    total = 0 
    f1, f2 = 1, 2 
    while f1 < n: 
        if f1 % 2 == 0: 
            total = total + f1 
        f1, f2 = f2, f1 + f2 
    return total 

if __name__ == "__main__": 
    limit = input("Max Fibonacci number: ") 
    print(even_fib(int(limit)))

