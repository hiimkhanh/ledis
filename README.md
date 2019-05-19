# LEDIS ASSIGNMENT FROM HOLISTIC
Ledis is a simple in-memory data structure for Ruby.

Ledis uses cache base on Rails cache to store many special data such as: Linked List, String, Set... It does not require Rails but will increase performance your application.

Ledis is gotten the idea from Redis but for simple Ledis's server to communicate via HTTP interface.

Hosting: https://holistic-ledis.herokuapp.com/
## Why Ruby?
Ruby just like you would use any other general-purpose scripting language.A few examples would be web applications, web servers, system utilities,... Compare with another programming language, Ruby is good to easy development and build a skeleton of a web project, reduce code lines, nice convention, support OOP so good, ... And the most important thing is Rails framework that is a powerful framework to build a project quickly, just take a few time to generate code. The last reason I have choosen Ruby to develope this task is I would to become an expert Ruby on Rails for the future, so here is good practice.

## Support
Rails 5.2
Ruby 2.5
Rails cache
Dalli gem
Heroku

## Design
* Ledis is like a API web application. It will send out the data after a API was called. So like description of the assignment, Ledis have a end point: POST /<any command here>.
* The architecture of Ledis is very simple. It has a controller whose name is CacheController extends ApplicationController. It used Rails.cache to implement and store data on RAM. Behind the sense, Ledis supported some special data structure to retrive also save data to memory. The picture below is Ledis's architecture: 

![Image of Yaktocat](https://i.imgur.com/8PeTyc2.png)
                                                                                                                      
## Usage
Similar to Redis, Ledis also has some basic method. I implemented throgh API, I think that is good, because the core value of assignment is how to use cache and build data structure to increase application's performance.

**1. String:**

API | Parameters | Method | Description
------------ | ------------- | ------------- | -------------
``` /get ``` | ``` key ```| **POST** | Get value from cache by key
``` /set ``` | ``` key, value ```| **POST** | Assign new key with value

**2. List:**

API | Parameters | Method | Description
------------ | ------------- | ------------- | -------------
``` /llen ``` | ``` key ```| **POST** | Return lenght of the list
``` /rpush ``` | ``` key, value, [value1, value2,...optional] ```| **POST** | Append 1 or more values to the list, create list if not exists, return length of list after operation
``` /lpop ``` | ``` key ```| **POST** | Remove and return the first item of the list
``` /rpop ``` | ``` key ```| **POST** | Remove and return the last item of the list
``` /lrange ``` | ``` key, start, stop ```| **POST** | Return a range of element from the list (zero-based, inclusive of start and stop), start and stop are non-negative integers

**3. Set**

API | Parameters | Method | Description
------------ | ------------- | ------------- | -------------
``` /sadd ``` | ``` key, value, [value1, value2,... optional] ```| **POST** | Add values to set stored at key
``` /scard ``` | ``` key ```| **POST** | Return the number of elements of the set stored at key
``` /smembers ``` | ``` key ```| **POST** | Return array of all members of set
``` /srem ``` | ``` key, value, [value1, value2,... optional] ```| **POST** | Remove values from set
``` /sinter ``` | ``` key1, key2 ```| **POST** | Set intersection among all set stored in specified keys. Return array of members of the result set

**4. Data expire**

API | Parameters | Method | Description
------------ | ------------- | ------------- | -------------
``` /keys ``` || **POST** | List all available keys
``` /del ``` | ``` key ```| **POST** | Delete a key
``` /flushdb ``` || **POST** | Clear all keys
``` /expire ``` |``` key, seconds```| **POST** | Set a timeout on a key, seconds is a positive integer. Return the number of seconds if the timeout is se


## Problem Solving and Process
* Redis is a popular in-memory data structure store. But I've never really worked on it, so I must research and find document about Redis also install Redis to try some method of its. It taken about 3 hours for me.

* Next, the assignment requires implementation the Ledis through Web CLI, but I have not never implement this infrastructure and expirence about it. I spent over 3 hours to research and fancy. After 3 hours, I had to make a decision which develope a API application with the actions like Redis command and query from Rails.cache memory and implement more data structures are Linked List and Set to keep temporary data.

* As you know, Linked List and Set are 2 cocepts that was a long time to study at university, I read it's theory and implement both of them. Fortunately, Ruby had supported very well function to do that.
* Before implementation, I list out some things needed such as : build base method of list and set, validate params, check type of list or set... Tick task done if finished and testing.

* At that time, it is the first time I deploy a Ruby on Rails project, so the lack of experience and mistakes is inevitable. Here are some problem I encountered: 
  - Config on development and production is defferent. I just configurated on developmentt env, but when deploy to heroku, the heroku's system throwed errors, and I must read the document to fix it.
  - Heroku reject to install new package. This problem appear when I used dalli gem to store date to cache on production env. But app crashed and I searched this issue, it so takes time to research. After an hour of searching there was no good solution. I back to heroku document and saw the list service which heroku provided and fortunately, I found and tried to use **Memcached Cloud** and config it to production env. It worked well.

## Interesting points
* Understand how to implement a basic cache sever like Redis and data structure behind it.
* End to end building a project from generating to deployment.
* Make a decision skills, resolve issues, research appropriate tecnology.

## Limitation
* Not implement snapshot and restore cache.
* Not same behavior with Redis, must improve more.
* Not verify all case of params.
