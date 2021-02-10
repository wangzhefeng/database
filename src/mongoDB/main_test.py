import requests
import json
import logging

origin_url = "http://127.0.0.1:8000/"

def test_add():
    global origin_url
    url = origin_url + "add"
    data = {
            "collection_name": "test",
            "name": "测试增加",
            "age": 50
        }

    headers = {"Content-Type": "application/json"}
    requests.request("POST", url, headers=headers, data = json.dumps(data))

def test_delete():
    global origin_url
    url = origin_url + "delete"
    data = {
            "collection_name": "test",
            "query_condition": {"name": "测试增加"},
        }

    headers = {"Content-Type": "application/json"}
    requests.request("POST", url, headers=headers, data = json.dumps(data))

def test_update():
    global origin_url
    url = origin_url + "update"
    data = {
            "query_condition": {"name": "测试增加"},
            "collection_name": "test",
            "update_data" : {"age": 18}
        }

    headers = {"Content-Type": "application/json"}
    requests.request("POST", url, headers=headers, data = json.dumps(data))

def test_search():
    global origin_url
    url = origin_url + "search"
    data = {
            "collection_name": "test",
            "query_condition": {"name": "测试增加"},
            # "sort": 0,
            # "sort_key": "None",
            # "asc": 1
        }

    headers = {"Content-Type": "application/json"}
    response = requests.request("POST", url, headers=headers, data = json.dumps(data))
    result = eval(eval(response.text))
    
if __name__ == "__main__":
    test_add()
    test_search()
    test_update()
    test_delete()