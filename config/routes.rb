Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'books/' => 'books#showseveral'
  get 'books/' => 'books#showall'
  get 'books/borrowed/' => 'books#borrowed'
  get 'books/:id' => 'books#show'
  get 'books/:id/borrow' => 'books#borrow'
  get 'books/:id/return' => 'books#return'

  post 'login/' => 'authentication#login'
  get 'auth/' => 'authentication#authenticate'

  post 'register/' => 'user#register'
end
