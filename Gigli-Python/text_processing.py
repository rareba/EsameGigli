import codecs
import re
from nltk.corpus import stopwords
from unidecode import unidecode
from nltk.stem.snowball import ItalianStemmer
from collections import Counter

STOPWORDS = set(stopwords.words('italian'))

def get_string_tokens(text):
    return re.split('\W+', text, flags = re.UNICODE)
    
word_list = get_string_tokens("io sono un Text pieno \
Pien-pien di PaRoLe. NeSSuno mi potra' potere potuto posso puoi piu' leggere \
come mi state leggendo adesso perche' verro \
processato. Il processo a cui mi riferisco \
non e' quello giuridico ma di altro Tipo, un proCESSO di normalization, tokenization, \
filtering, stemming e destemming che solo uno Scienziato dei Dati \
come te e' in grado di processare...")

def get_file_tokens(filename):
    return get_string_tokens(load_file(filename))

def load_file(filename):
    with codecs.open(filename, encoding="utf-8") as f:
        return f.read()

def filter_words(words):    
    return filter(lambda w: len(w) >= 3 
                        and w not in STOPWORDS, words)

word_list_filtered = filter_words(word_list)

def normalize_words(words):
    return map(lambda w: unidecode(w.lower()), words)

word_list_normalized = normalize_words(word_list_filtered)

def stem_words(words):
    # map a list of read words into a list of stemmed words
    s = ItalianStemmer()
    return map(s.stem, words)

word_list_stemmed = stem_words(word_list_normalized)

c = Counter()
print c
c.update('abcdaab')
print c
c.update({'a':1, 'd':5})
print c

c.most_common(1) #returns a list of most common elements represented as tuples
c.most_common(1)[0] # returns the first tuple of the list of most common elements
c.most_common(1)[0][0] # returns the first element of the first tuple of the list of most common elements

def get_stem_mapping(words):
    
    # reads list of words and use update() to update a Counter() object
    # containing the counts of all the words having the same stem
    
    s = ItalianStemmer()
    mapping = {}
    
    for w in words:
        stemmed_w = s.stem(w)
        if stemmed_w not in mapping:
            mapping[stemmed_w] = Counter()
        
        mapping[stemmed_w].update([w]) # returns a dictionary of Counter objects
        
    return mapping

word_mapping = get_stem_mapping(word_list_normalized)

def destem_words(stems, stem_mapping):
    
    # takes in input a list of stemmed terms and a dictionay of counter objects, then
    # uses lambda function for mapping each element of stems over the most common word having the 
    # same stem

    return map(lambda s: stem_mapping[s].most_common(1)[0][0], stems)
