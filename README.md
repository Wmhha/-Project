# 智慧答—AI答题应用平台
> <font style="color:rgb(31, 35, 40);">深入业务场景的</font>**<font style="color:rgb(31, 35, 40);">AI 答题应用平台。</font>**
>
> <font style="color:rgb(31, 35, 40);">项目基于 Vue 3 + Spring Boot + Redis + ChatGLM AI + RxJava + SSE 的，用户可以基于 AI 快速制作并发布多种答题应用，支持检索和分享应用、在线答题并基于评分算法或 AI 得到回答总结；管理员可以审核应用、集中管理整站内容，并进行统计分析。</font>
>



## 项目架构
![](https://cdn.nlark.com/yuque/0/2024/jpeg/39167620/1726152893817-cb8527a1-304a-4b6d-b37e-ae811a6737b3.jpeg)



## 技术选型
### 后端
+ <font style="color:rgb(31, 35, 40);">Java Spring Boot 开发框架</font>
+ <font style="color:rgb(31, 35, 40);">存储层：MySQL 数据库 + Redis 缓存 + 腾讯云 COS 对象存储</font>
+ <font style="color:rgb(31, 35, 40);">MyBatis-Plus 及 MyBatis X 自动生成</font><font style="color:transparent;">1698503330428461057_0.19030779822367938</font>
+ <font style="color:rgb(31, 35, 40);">Redisson 分布式锁</font>
+ <font style="color:rgb(31, 35, 40);">Caffeine 本地缓存</font>
+ <font style="color:rgb(31, 35, 40);">⭐</font><font style="color:rgb(31, 35, 40);">️ 基于 ChatGLM 大模型的通用 AI 能力</font><font style="color:transparent;">1698503330428461057_0.4765965498677094</font>
+ <font style="color:rgb(31, 35, 40);">⭐</font><font style="color:rgb(31, 35, 40);">️ RxJava 响应式框架 + 线程池隔离实战</font>
+ <font style="color:rgb(31, 35, 40);">⭐</font><font style="color:rgb(31, 35, 40);">️ SSE 服务端推送</font>
+ <font style="color:rgb(31, 35, 40);">⭐</font><font style="color:rgb(31, 35, 40);">️ Shardingsphere 分库分表</font><font style="color:transparent;">1698503330428461057_0.8826726280618142</font>
+ <font style="color:rgb(31, 35, 40);">⭐</font><font style="color:rgb(31, 35, 40);">️ 幂等设计 + 分布式 ID 雪花算法</font>
+ <font style="color:rgb(31, 35, 40);">⭐</font><font style="color:rgb(31, 35, 40);">️ 多种设计模式</font>



## 项目展示
主页

![](https://cdn.nlark.com/yuque/0/2024/jpeg/39167620/1726153435901-14f5a837-1b32-4068-a10d-ae8080d1806b.jpeg)

应用管理，管理员可进行审核

![](https://cdn.nlark.com/yuque/0/2024/jpeg/39167620/1726153435891-5c4d763a-7115-4eb6-910b-3bf0c80d3b2b.jpeg)

生成题目，可选择自定义或者AI

![](https://cdn.nlark.com/yuque/0/2024/jpeg/39167620/1726153435941-08a29615-f863-48d6-ba21-b76ebb9b0613.jpeg)

可视化统计

![](https://cdn.nlark.com/yuque/0/2024/jpeg/39167620/1726153435900-a5d1cb9b-c1a7-469f-8d57-ff9d01376ff5.jpeg)

