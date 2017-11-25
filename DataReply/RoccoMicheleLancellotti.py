
import random, re, time
from datetime import datetime

from pyspark import SparkContext
sc = SparkContext.getOrCreate()
print sc.version

lines = sc.textFile('C:/Users/r.lancellotti/Desktop/Lezione Master MaBiDa/confusion/') #RDD
totalLines = lines.count()
print "total lines: %d" % totalLines

lines.take(5)