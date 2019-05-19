Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root              'cache#index'
  post '/set'       => 'cache#set'
  post '/get'       => 'cache#get'
  post '/keys'      => 'cache#keys'

  ## Linked List
  post '/rpush'     => 'cache#rpush'
  post '/llen'      => 'cache#llen'
  post '/lpop'      => 'cache#lpop'
  post '/rpop'      => 'cache#rpop'
  post '/lrange'    => 'cache#lrange'

  ## Set
  post '/sadd'     => 'cache#sadd'
  post '/scard'    => 'cache#scard'
  post '/smembers' => 'cache#smembers'
  post '/srem'     => 'cache#srem'
  post '/sinter'   => 'cache#sinter'

  ##
  post '/flushdb'  => 'cache#flushdb'
  post '/expire'   => 'cache#expire'
  post '/del'      => 'cache#del'
end
