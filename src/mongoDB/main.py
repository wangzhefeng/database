import logging
import traceback
from pydantic import BaseModel
from fastapi import FastAPI
import json

from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse

app = FastAPI()

from pymongo import MongoClient
url = 'mongodb://stawary:tuxiujian941125@175.24.0.67:27017/stawary'
db = MongoClient(url)

class add_collection_format(BaseModel):
    collection_name: str
    name: str
    age: int

def add(data, collection_name):
    '''
    往test集合中插入记录
    如果单条记录，格式为: {"key1": "value1", "key2": "value2"}
    如果多条记录，格式为：[{"key1": "value1", "key2": "value2"},
                         {"key1": "value3", "key2": "value4"},
                         ...]
    '''
    collection = db['stawary'][collection_name]
    # 单条数据插入
    if type(data) == dict:
        collection.insert_one(data)
        logging.info("单条记录插入成功，记录=%s", data)
    elif type(data) == list:
        collection.insert_many(data)
        logging.info("多条记录插入成功，记录=%s", data)
    else:
        logging.info("add data format must be dict or list, but get %s", str(type(data)))

@app.post("/add")
async def add_into_collection(request_data: add_collection_format):
    '''
    必须传json的post接口
    param request_data: json字段
    '''
    logging.info("invoke add function!")
    message = ""
    try:
        request_dict = request_data.dict()
        # logging.info("add route get requset data=%s", request_dict)
        collection_name = request_dict["collection_name"]
        del request_dict["collection_name"]
        add(data=request_dict, collection_name=collection_name)

        message = "add success!"
        return message 
    except:
        traceback.print_exc()
        message = "add failed!"
        return message

class delete_format(BaseModel):
    '''
    query_condition为json字符串，格式为"{'key1':'value1'}"
    '''
    query_condition: dict
    collection_name: str

def delete(query_condition, collection_name):
    '''
    从集合中删除记录
    如果单条记录，query_condition格式为: {"key1": "value1", "key2": "value2"}
    如果多条记录，query_condition格式为：[{"key1": "value1", "key2": "value2"},
                                        {"key1": "value3", "key2": "value4"},
                                        ...]
    '''
    collection = db['stawary'][collection_name]
    # 单条记录删除
    if type(query_condition) == dict:
        collection.delete_one(query_condition)
        logging.info("单条记录删除成功，记录=%s", query_condition)
    elif type(query_condition) == list:
        collection.delete_many(query_condition)
        logging.info("多条记录删除成功，记录=%s", query_condition)
    else:
        logging.info("delete data format must be dict or list, but get %s", str(type(query_condition)))

@app.post("/delete")
async def delete_from_collection(request_data: delete_format):
    '''
    必须传json的post接口
    param request_data: json字段
    '''
    logging.info("invoke delete function!")
    try:
        request_dict = request_data.dict()
        # logging.info("get requset data=%s", request_dict)
        collection_name = request_dict["collection_name"]
        query_condition = request_dict["query_condition"]
        result = search(query_condition=query_condition, 
                        collection_name=collection_name)

        logging.error("data type to delete=%s", type(result))
        if len(result) > 0:
            for r in result:
                delete(query_condition, collection_name)
            return "delete success"
        else:
            return "no data matched to delete"
    except:
        traceback.print_exc()
        return "delete failed"


class update_collection_format(BaseModel):
    '''
    query_condition为json字符串，格式为"{'key1':'value1'}"
    '''
    query_condition : dict
    collection_name: str
    update_data: dict

def update(query_condition=None, update_data=None, collection_name="test"):
    # TODO 待完善
    '''
    从集合中修改记录
    如果单条记录，格式为: {"key1": "value1", "key2": "value2"}
    '''
    collection = db['stawary'][collection_name]
    newvalue = { "$set": update_data}
    collection.update_one(query_condition, newvalue)
    logging.error("update success")

@app.post("/update")
async def update_of_collection(request_data: update_collection_format):
    '''
    必须传json的post接口
    param request_data: json字段
    '''
    logging.info("invoke update function!")
    try:
        request_dict = request_data.dict()

        collection_name = request_dict["collection_name"]
        query_condition = request_dict["query_condition"]
        update_data = request_dict["update_data"]
        update(query_condition=query_condition, 
                update_data=update_data, 
                collection_name=collection_name)

        return "update success!" 
    except:
        traceback.print_exc()
        return "update failed!"

class search_collection_format(BaseModel):
    '''
    query_condition为json字符串，格式为"{'key1':'value1'}"
    '''
    query_condition: dict
    collection_name: str
    sort: int = 0
    sort_key: str = "None"
    asc: int = 1

def search(query_condition, collection_name, sort=0, sort_key=None, asc=1):
    '''
    从集合中查询数据
    查询格式query_condition为{key: value}，即查询集合中key=value的记录。
    如果需要按key排序：
    - sort: 1需要排序，0无需排序
    - sort_key：sort为1时，需指定sort_key
    - asc：1升序，0降序
    '''
    collection = db['stawary'][collection_name]

    final_result = []
    result = []
    # logging.info("query_condition = %s, type=%s", query_condition, type(query_condition))

    # query_condition = json.loads(query_condition)
    # logging.info("query_condition in search function=%s", query_condition)

    if len(query_condition) == 0 or query_condition is None:
        try:
            result = collection.find()
        except:
            traceback.print_exc()
            logging.info("search failed")
    else:
        if sort:
            if asc:
                try:
                    result = collection.find(query_condition).sort(sort_key)
                except:
                    traceback.print_exc()
                    logging.info("search failed")
            else:
                try:
                    # result = exec(f"collection.find({query_condition}).sort(sort_key, -1)")
                    result = collection.find(query_condition).sort(sort_key, -1)
                except:
                    traceback.print_exc()
                    logging.info("search failed")
        else:
            try:
                # result = exec(f"collection.find({query_condition})")
                result = collection.find(query_condition)
            except:
                traceback.print_exc()
                logging.info("search failed")
    if type(result) == list:
        return final_result
    else:
        for r in result:
            del r["_id"]
            final_result.append(r)
        logging.error("search result=%s", final_result)
        return final_result

@app.post("/search")
async def search_in_collection(request_data: search_collection_format):
    '''
    必须传json的post接口
    param request_data: json字段
    '''
    logging.info("invoke search function!")
    message = ""
    try:
        request_dict = request_data.dict()
        # logging.info("search route get requset data=%s", request_dict)

        collection_name = request_dict["collection_name"]
        sort = request_dict["sort"]
        sort_key = request_dict["sort_key"]
        asc = request_dict["asc"]

        query_condition = request_dict["query_condition"]
        # logging.info("query_condition=%s, type=%s", query_condition, type(query_condition))
        # query_condition = eval(request_dict["query_condition"])[0]
        # logging.info("query_condition=%s, type=%s", query_condition, type(query_condition))
        result = []
        try:
            result = search(query_condition=query_condition, 
                            collection_name=collection_name,
                            sort=sort,
                            sort_key=sort_key,
                            asc=asc)
            # logging.info("search result=%s, type=%s", result, type(result))
            # result = str(result).replace("\'", "\"")
            # logging.info("str result=%s, type=%s", result, type(result))
            
            if len(result) > 2:
                # result = json.loads(result)
                result = jsonable_encoder(str(result))

                logging.info("search success")

                return JSONResponse(content=result)
            else:
                logging.info("search success, but no data matched!")
                result = jsonable_encoder(str(result))
                return JSONResponse(content=result)

        except:
            traceback.print_exc()
            logging.info("search failed")
            result = jsonable_encoder(str(result))
            return JSONResponse(content=result)

    except:
        traceback.print_exc()
        logging.info("search failed")

        result = jsonable_encoder(str(result))
        return JSONResponse(content=result)
