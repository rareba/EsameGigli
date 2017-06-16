def add_item(item, item_list = None):
    if item_list == None:
        item_list = []
    item_list.append(item)
    print(item_list)