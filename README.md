# LEDIS ASSIGNMENT FROM HOLISTIC
Ledis is a simple in-memory data structure for Ruby.

Ledis uses cache base on Rails cache to store many special data such as: Linked List, String, Set... It does not require Rails but will increase performance your application.

Ledis is gotten the idea from Redis but for simple Ledis's server to communicate via HTTP interface.

Hosting: https://holistic-ledis.herokuapp.com/
## Why Ruby ?
Ruby just like you would use any other general-purpose scripting language.A few examples would be web applications, web servers, system utilities,... Compare with another programming language, Ruby is good to easy development and build a skeleton of a web project, reduce code lines, nice convention, support OOP so good, ... And the most important thing is Rails framework that is a powerful framework to build a project quickly, just take a few time to generate code. The last reason I have choosen Ruby to develope this task is I would to become an expert Ruby on Rails for the future, so here is good practice. 
## Design
. Ledis is like a API web application. It will send out the data after a API was called. So like description of the assignment, Ledis have a end point: POST /<any command here>.
. The architecture of Ledis is very simple. It has a controller whose name is CacheController < ApplicationController. It used Rails.cache to implement and store data on RAM. Behind the sense, Ledis supported some special data structure to retrive,
        
![alt text](https://imgur.com/hnZbRrc)
                                                                                                                      

## Usage

