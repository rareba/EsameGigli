from lxml import etree

wd = "C:/Users/GiulioVannini/Documents/Visual Studio 2017/Projects/MABIDA2017/Gigli-Python"

def node_to_text(root):

    text = u""

    for node in root.getiterator():
        print("node tag: ", node.tag)
        if node.text:
            text += node.text

        if node.tail:
            text += node.tail

        return text



def html_to_text(html_file):

    parser = etree.HTMLParser(remove_comments=True)
    tree = etree.parse(html_file, parser)

    if tree.getroot() is None:
        return None

    #root = tree.getroot()

    #text = node_to_text(root)

    matching_nodes=tree.xpath('//p[@class="chapter-paragraph"]')
    text = " ".join(node_to_text(n) for n in matching_nodes

    return text


path = wd + r"pages/corriere"

filename = r"http___www_corriere_it_politica_17_settembre_03_floris_politici_quarantenni_superficiali_impreparati_dimartedi_527bb77a_9013_11e7_90ab_5e72a21f32c7_shtml"

parsed_page = html_to_text(path + filename)




