import json
from wordcloud import WordCloud
from pprint import pprint
import nltk
import nltk, re, pprint
from nltk import word_tokenize
from nltk.stem.porter import PorterStemmer
stem = nltk.PorterStemmer()
from sklearn.feature_extraction.text import TfidfVectorizer, CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from collections import defaultdict, Counter
from nltk.stem.wordnet import WordNetLemmatizer
lemm = WordNetLemmatizer()
nltk.download('wordnet')
nltk.download('punkt')

with open('C:\\Users\\GiulioVannini\\Documents\\Visual Studio 2017\\Projects\\MABIDA2017\\DataReply\\NLP\\recipes.json') as data_file:    
    data = json.load(data_file)

data[2]

# Visualizzo il contenuto dell'elemento 2 della lista "data"

data = {each['title'] : each for each in data if each}.values()


# La variabile "recipes" deve contenere la lista delle descrizioni di ogni ricetta (contenuto della chiave "directions" del json estraibile utilizzando la funzione GET) 

recipes = [" ".join(a.get('directions')) for a in data]



#seleziono la ricetta di indice 3

recipeN3=recipes[3]
recipeN3

noise_list=[]
#tokens=...
#tagged=...
#ingredients...
#ingredi=...

tokens=nltk.word_tokenize(recipeN3)
tagged=nltk.pos_tag(tokens)
ingredients = [t[0] for t in tagged if tagged[0] not in noise_list and (t[1] == 'NN' or t[1] == 'NNS')]

ingredients = [stem.stem(a) for a in ingredients]

ingredients

bag_of_wordsVectorize = CountVectorizer()
counts=bag_of_wordsVectorize.fit_transform(ingredients)
frequence=zip(bag_of_wordsVectorize.get_feature_names(), np.asarray(counts.sum(axis=0)).ravel())
dict_frequence=dict(frequence)

dict_frequence

wordcloud_Count = WordCloud()
wordcloud_Count.generate_from_frequencies(frequencies = dict_frequence)
plt.figure()
plt.imshow(wordcloud_Count, interpolation="bilinear")
plt.axis("off")
plt.show()

noise_list=[]
def search_from_recipes(text):

    tokens=nltk.word_tokenize(text)
    tagged=nltk.pos_tag(tokens)
    ingredients = [t[0] for t in tagged if tagged[0] not in noise_list and (t[1] == 'NN' or t[1] == 'NNS')]

    ingredi = [stem.stem(a) for a in ingredients]

    return " ".join(ingredi)

def set_documents(n):
    text=[]
    for i in range(0,n):
        text.append(search_from_recipes(recipes[i]))
    return text

text=set_documents(5)

text


###### Prossimi passi:
#- Costruzione della matrice sparsa tf-idf 
#- Estrazione di 5 ingredienti con indice più alto all'interno di una ricetta
#- Definizione della funzione che dato in input l'indice della ricetta (N) restituisca in output l'estrazione dei 5 ingredienti

#vectorizer_tfidf=...
#dictionary=...
#tfidf_matrix=...

# Prendiamo la ricetta di indice 1
#list_tfidf=...
#name_tfidf=...
dict_tfidf=dict(zip(name_tfidf, list_tfidf))
#order_tfidf=...
#max_tfidf=...

def take_n_ingredients(recipe_n, dictionary, tfidf_matrix):
    #list_tfidf=...
    #name_tfidf=...
    dict_tfidf=dict(zip(name_tfidf, list_tfidf))
    #order_tfidf=...
    
    return #...


#Ingredienti principali
                 #A questo punto possiamo creare la funzione "principal_ingredients" che dato un numero di ricette unisca il risultato della funzione "take_ingredients" all'interno di un'unica lista e restituisca il dizionario contentente il numero di volte in cui l'ingrediente è presente nella lista:

def principal_ing_docs(nDocs, dictionary, tfidf_matrix):
    #all_ingredients=...
    d=dict(Counter(all_ingredients))
    
    return d

dict_ingredients=principal_ing_docs(#num_ricettta#, dictionary, tfidf_matrix)

    #wordcloud_tfidf = ...
#wordcloud_tfidf. ...
plt.figure()
plt.imshow(wordcloud_tfidf, interpolation="bilinear")
plt.axis("off")
plt.show()


#wordcloud_tfidf =...
#wordcloud_tfidf. ...
plt.figure(1)
plt.imshow(wordcloud_tfidf, interpolation="bilinear")
plt.axis("off")


###### Confrontiamo i risultati del CountVectorizer e del TfidfVectorizer

#wordcloud_Count = ...
#wordcloud_Count. ...
plt.figure(2)
plt.imshow(wordcloud_Count, interpolation="bilinear")
plt.axis("off")
plt.show()

Document similarity metrics
Vogliamo definire una funzione che determini la somiglianza tra ricette. In particolare, a partire dall'indice della ricetta, vogliamo ottenere tutte le ricette più simili a quella scelta sulla base dell'inidice di similarità. (Utilizziamo la Cosine_similarity della libreria scikit-learn)

def similar_recipes(n_rec):
    #array_sim=...
    list_similarity=array_sim.tolist()
    #list_similarity=...
    #tup= lista contenente tuple composte da (indice numerico, elemento)
    #list_val=...
    #list_ok=...
    #list_title=...
    
    return list_title


similar_recipes(#Indice_ricetta da confrontare#)