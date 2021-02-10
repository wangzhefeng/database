if(!require(rmongodb)) devtools::install_github("mongosoup/rmongodb")



# --------------------------------------------------
# 创建/验证连接
# --------------------------------------------------
mongo = mongo.create(host = "localhost")
mongo.is.connected(mongo)

# --------------------------------------------------
# 查看本地数据库文件
# --------------------------------------------------
## 查看本地数据库名称
mongo.get.databases(mongo)

# 查看pymongo_test数据库内各个集合名称
mongo.get.database.collections(mongo, db = "pymongo_test")

## 查看pymongo_test数据库内的集合数量
mongo.count(mongo, ns = "pymongo_test")

## 修改pymongo_test数据库内posts表名称
mongo.rename(mongo, "pymongo_test.posts", "pymongo_test.post")

# 移除数据库及其内部所有集合
mongo.drop.database(mongo, db = "database")

# 仅删除数据库内部所有集合
mongo.drop(mongo, ns = "database.collection")

# 删除数据集合内某一特定表
mongo.drop(mongo, ns = "rmongo_test.mydata1")

# 删除集合内选定条件的记录
mongo.remove(mongo, ns, criteria = mongo.bson.empty())

# 新建一个json对象
json = '{"A":1,"B":2,"C":{"D":3,"E":4}}'
json = jsonlite::toJSON(list("A" = 1, "B" = 2, "C" = list("D" = 3, "E" = 4)), 
                        auto_unbox = TRUE)

# 将json对象转换为mongodb可识别的bson对象
bson = mongo.bson.from.JSON(json)





# --------------------------------------------------
# 断开连接
# --------------------------------------------------
mongo.destory(mongo)