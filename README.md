# MongoDB-demo
MongoDB的简单使用
①.MongoDB 简介
     MongoDB是用C++语言编写的非关系型数据库。特点是高性能、易部署、易使用，存储数据十分方便，主要特性有：

面向集合存储，易于存储对象类型的数据
模式自由
支持动态查询
支持完全索引，包含内部对象
支持复制和故障恢复
使用高效的二进制数据存储，包括大型对象
文件存储格式为BSON(一种JSON的扩展)
②.使用场景

    1）网站实时数据处理。它非常适合实时的插入、更新与查询，并具备网站实时数据存储所需的复制及高度伸缩性。

    2）缓存。由于性能很高，它适合作为信息基础设施的缓存层。在系统重启之后，由它搭建的持久化缓存层可以避免下层的数据源过载。

    3）高伸缩性的场景。非常适合由数十或数百台服务器组成的数据库，它的路线图中已经包含对MapReduce引擎的内置支持



    不适用的场景：

    1）要求高度事务性的系统。

    2）传统的商业智能应用。

    3）复杂的跨文档（表）级联查询。

②.安装和启动
     常用部署方式:副本集，分片

③.常用操作
创建数据库,使用命令 use 数据库名称 ,如：use mydb1
删除当前数据库，使用命令 db.dropDatabase()
查看所有数据库，使用命令 show dbs
查看当前所在数据库，使用命令 db
查看当前数据库中所有的集合，使用命令 show collections 或使用show tables
创建集合有两种方式，显示创建和隐式创建
显示创建可以使用命令 db.createCollection(“集合名称")
隐式创建可以使用命令 db.集合名称.insert({}),指创建集合并同时向集合中插入数据,例如： db.customer.insert({name:”jack”})
向集合添加文档，使用命令 db.集合名称.insert({})，例如：db.user1.insert({name:”jack”,age:20})
删除集合中的文档，使用命令 db.集合名称.remove({删除条件})，不加删除条件为删除集合中的所有文档，例如，db.c1.remove() 为删除c1集合中的所有文档，db.c1.remove({name:”user1”})为删除c1集合中name为user1的文档
查询集合中的文档，可以使用命令 db.集合名称.find({条件})，或者使用 db.集合名称.findOne() 查询第一个文档
