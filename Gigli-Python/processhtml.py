from lxml import etree #libreria per navigare HTML, vedi http://lxml.de/tutorial.html

'''
<html>
    <body>
        <script>...</script>
        <span id=”titolo”>Governo: fiducia sulla finanziaria</span>
        <style>...</style>
        <span id=”corpo”>Dal nostro inviato
            <b>Ciccio</b> #tail
        : sembra destare polemica...
        </span>
    </body>
</html>
'''

working_directory = r"C:/Users/GiulioVannini/Documents/Visual Studio 2017/Projects/MABIDA2017/Gigli-Python/"

def node_to_text(root):
    
    # converts in text all the elements (nodes)
    # of the html page

    text = u""

    for node in root.getiterator():
        print("node tag: ", node.tag)
        if node.text:
            #print("node text: ", node.text)
            text += node.text
    
        if node.tail:
            #print("node tail: ", node.tail)
            text += node.tail

    return text
    
def html_to_text(html_file):
    
    # reads an html file, then call node_to_text() to convert it in text
    
    parser = etree.HTMLParser()
    tree = etree.parse(html_file, parser)

    if tree.getroot() is None:
        return None

    root = tree.getroot()
    #print(etree.tostring(root, pretty_print=True))
    
    text = node_to_text(root) #see below

    return text
    
#chiamo la funzione html_to_text(html_file)
path = working_directory + r"pages2/corriere/"
filename = r"http___www_corriere_it_politica_17_settembre_03_floris_politici_quarantenni_superficiali_impreparati_dimartedi_527bb77a_9013_11e7_90ab_5e72a21f32c7_shtml.html"
parsed_page = html_to_text(path + filename)

#######################
#miglioriamo il codice#
#######################

def node_to_text(root):
    
    # converts in text all the elements (nodes) of the html page, skipping style and script elements
    
    text = u""

    for node in root.getiterator():
        
        if node.tag not in ["style", "script"]: # skip style and script tags
            if node.text:
                text += node.text
            if node.tail:
                text += node.tail
    return text


def html_to_text(html_file):
    
    # reads an html file, then call node_to_text() to convert the elements contained in the
    # class "chapter-paragraph" in text

    parser = etree.HTMLParser(remove_comments=True) #rimuovo commenti
    tree = etree.parse(html_file, parser)

    if tree.getroot() is None:
        return None

    #root = tree.getroot()
    #text = node_to_text(root)

    matching_nodes = tree.xpath('//p[@class="chapter-paragraph"]') #prendo solo i testi di questa classe CSS
    text = " ".join(node_to_text(n) for n in matching_nodes)
    
    return text
    

parsed_page_v2 = html_to_text(path + filename)

# we now run the previous funcion on the entire list of pages we have scraped

# to do so we need a python library to navigate the filesystem

import os

for filename in os.listdir(path):
    print(filename, "\n", html_to_text(os.path.join(path, filename)))

# I've already saved a file containing some user defined fuctions which you'll find useful 
# for text processing. 

# Change the path to working_directory path

os.chdir(working_directory)
for filename in os.listdir(working_directory):
    print(filename)


# import functions in text_processing.py

from text_processing import *

#tokenization 

tokens = []
for filename in os.listdir(path):
    text = html_to_text(os.path.join(path, filename))
    if text:
        tokens += get_string_tokens(text)
print(tokens)

#text processing
normalized = normalize_words(tokens)            # normalization
filtered_t = filter_words(list(normalized))     # remove stopwords
stemmed = stem_words(list(filtered_t))          # stemming

#normalized = normalize_words(tokens)
#filtered_t = filter_words(list(normalized))
stem_mapping = get_stem_mapping(list(filtered_t))   #stemming map for destemming

destemmed = destem_words(list(stemmed), stem_mapping) # destemming
selected_tokens = list(destemmed)

# visualize through a wordcloud

from wordcloud import WordCloud  #library o create wordclouds
from nltk.corpus import stopwords 

STOPWORDS = [str(s.encode('utf-8')) for s in stopwords.words('italian')] #workaround for dealing with wordcloud in python 2.7
# STOPWORDS = set(stopwords.words('italian')) #this works fine with python 3
import matplotlib.pyplot as plt

wordcloud = WordCloud(stopwords = STOPWORDS, random_state = 0, background_color="white", width=500, height=300)
wordcloud.generate(" ".join(selected_tokens))
plt.figure(figsize=(10, 10))
plt.imshow(wordcloud)
plt.axis("off")

#salvo in working_directory la word cloud
plt.savefig("word_cloud.png")
