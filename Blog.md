# Blog

## 1.需求和功能

### 1.1 用户故事

用户故事模板：

- As a (role of user),I want (some feature) so that (some business value)
- 作为一个(某个角色)使用者，我可以做(某个功能)事情，如此可以有(某个商业价值)的好处。

**角色、功能、商业价值**

举例:

- 作为一个招聘网站**注册用户**，我想**查看最近3天发布的招聘信息**，以便于**了解最新的招聘信息**。
- 作为**公司**，可以**张贴发布新工作**。



个人博客系统的用户故事：

角色：**普通访客、管理员(我)**

访客：

- 分页查看所有的博客
- 快速查看博客数最多的6个分类
- 查看所有的分类
- 查看某个分类下的博客列表
- 快速查看标记博客最多的10个标签
- 查看所有的标签
- 查看某个标签下的所有博客
- 根据年度时间线查看博客列表
- 快速查看最新的推荐列表
- 用关键字全局搜索博客
- 查看单个博客内容
- 对博客内容进行评论
- 赞赏博客内容
- 微信扫描阅读博客内容
- 在首页扫描公众号二维码关注我

我：

- 用户名密码登录后台管理
- 管理博客
  - ​	发布新博客
  - 对博客进行分类
  - 对博客打标签
  - 修改博客内容
  - 删除博客
  - 根据标题、分类、标签查询博客
- 管理博客分类
  - 新增一个分类
  - 修改一个分类
  - 删除一个分类
  - 根据分类查询分类
- 管理标签
  - 新增一个标签
  - 修改一个标签
  - 删除一个标签
  - 根据标签查询标签

### 1.2 功能规划

 

2.页面设计与页面开发

2.1 设计

2.2 开发









































## blog_article

| id            |          |      |
| ------------- | -------- | ---- |
| title         | 标题     |      |
| description   | 描述     |      |
| author        | 作者     |      |
| content       | 内容     |      |
| createtime    | 创建时间 |      |
| updatetime    | 更新时间 |      |
| sort_id       | 分类id   |      |
| tag_id        | 标签id   |      |
| like_count    | 点赞数   |      |
| comment_count | 评论数   |      |
| view_count    | 浏览次数 |      |
|               |          |      |

## blog_sort

| sort_id   | 分类id   |      |
| --------- | -------- | ---- |
| sort_name | 分类名称 |      |
|           |          |      |
|           |          |      |

## blog_tag

| tag_id   | 标签id   |      |
| -------- | -------- | ---- |
| tag_name | 标签名称 |      |
|          |          |      |
|          |          |      |

## blog_article_sort

| blog_id | 博客id |      |
| ------- | ------ | ---- |
| sort_id | 分类id |      |
|         |        |      |
|         |        |      |

## blog_article_tag

| blog_id | 博客id |      |
| ------- | ------ | ---- |
| tag_id  | 标签id |      |
|         |        |      |
|         |        |      |

## blog_manager

| id       |      |      |
| -------- | ---- | ---- |
| username |      |      |
| password |      |      |
| role     |      |      |
|          |      |      |
|          |      |      |
|          |      |      |
|          |      |      |
|          |      |      |
|          |      |      |

## blog_role

| role_id   |      |      |
| --------- | ---- | ---- |
| role_name |      |      |
|           |      |      |
|           |      |      |

## blog_permission

| permission_id   |      |      |
| --------------- | ---- | ---- |
| permission_name |      |      |
|                 |      |      |
|                 |      |      |
