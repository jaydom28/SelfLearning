import os

root_path = os.path.abspath(os.path.dirname(__file__)) + "/"
data_path = root_path + 'data/'

def get_data_path(file_name):
    ret_path = os.path.join(data_path, file_name)
    if not os.path.exists(ret_path):
        print("The file does not exist:", ret_path)
        exit()
    return ret_path