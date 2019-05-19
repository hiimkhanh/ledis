# LEDIS ASSIGNMENT FROM HOLISTIC
Ledis is a simple in-memory data structure for Ruby.

Ledis uses cache base on Rails cache to store many special data such as: Linked List, String, Set... It does not require Rails but will increase performance your application.

Ledis is gotten the idea from Redis but for simple Ledis's server to communicate via HTTP interface.

Hosting: https://holistic-ledis.herokuapp.com/
## Why Ruby ?
Ruby just like you would use any other general-purpose scripting language.A few examples would be web applications, web servers, system utilities,... Compare with another programming language, Ruby is good to easy development and build a skeleton of a web project, reduce code lines, nice convention, support OOP so good, ... And the most important thing is Rails framework that is a powerful framework to build a project quickly, just take a few time to generate code. The last reason I have choosen Ruby to develope this task is I would to become an expert Ruby on Rails for the future, so here is good practice. 
## Design
* Ledis is like a API web application. It will send out the data after a API was called. So like description of the assignment, Ledis have a end point: POST /<any command here>.
* The architecture of Ledis is very simple. It has a controller whose name is CacheController extends ApplicationController. It used Rails.cache to implement and store data on RAM. Behind the sense, Ledis supported some special data structure to retrive also save data to memory. That picture below is Ledis's architecture: 

![Image of Yaktocat](https://i.imgur.com/8PeTyc2.png)
                                                                                                                      
## Usage

## Challenge and Process
* Redis is a popular in-memory data structure store. But I've never really worked on it, so I must research and find document about Redis also install Redis to try some method of its. It taken about 3 hours for me.
* Next, the assignment requires implementation the Ledis through Web CLI, but I have not never implement this infrastructure and expirence about it. I spent over 3 hours to research and fancy. After 3 hours, I had to make a decision which develope a API application with the actions like Redis command and query from Rails.cache memory and implement more data structures are Linked List and Set to keep temporary data.
* As you know, Linked List and Set are 2 cocepts that was a long time to study at university, I read it's theory and implement both of them. Fortunately, Ruby had supported very well function to do that.
* At that time, it is the first time I deploy a Ruby on Rails project, so the lack of experience and mistakes is inevitable. Here are some problem I encountered: 
  - Config on development and production is defferent. I just configurated on developmentt env, but when deploy to heroku, the heroku's system throwed errors, and I must read the document to fix it.
  - Heroku reject to install new package. This problem appear when I used dalli gem to store date to cache on production env. But app crashed and I searched this issue, it so takes time to research. After an hour of searching there was no good solution. I back to heroku document and saw the list service which heroku provided and fortunately, I found and tried to use **Memcached Cloud** and config it to production env. It worked well.
## Problem Solving
## 
