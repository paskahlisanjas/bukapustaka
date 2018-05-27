Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'books/:id' => 'books#show'
  post 'books/' => 'books#showseveral'
  get 'books/' => 'books#showall'
  get 'books/:id/borrow' => 'books#borrow'
  get 'books/:id/return' => 'books#return'

  post 'auth/login' => 'authentication#login'
  get 'auth/' => 'authentication#authenticate'
end
