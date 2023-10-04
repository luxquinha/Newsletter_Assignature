Rails.application.routes.draw do
  #Routes to Author:
  get 'authors', to: 'author#all'
  get 'authors/:id', to: 'author#index'
  post 'authors/new', to: 'author#create'
  put 'authors/:id', to: 'author#update'
  delete 'authors/:id', to: 'author#destroy'
  #Routes to Reader:
  get 'readers', to: 'reader#all'
  get 'readers/:id', to: 'reader#index'
  post 'readers/new', to: 'reader#create'
  put 'readers/:id', to: 'reader#update'
  delete 'readers/:id', to: 'reader#destroy'
  #Routes to Newsletter:
  get 'newsletters', to: 'newsletter#all'
  get 'newsletters/:id', to: 'newsletter#index'
  post 'newsletters/new', to: 'newsletter#create'
  put 'newsletters/:id', to: 'newsletter#update'
  delete 'newsletters/:id', to: 'newsletter#destroy'
  #Routes to Assignature: 
  get 'assignatures', to: 'assignature#all'
  get 'assignatures/:id', to: 'assignature#index'
  post 'assignatures/new', to: 'assignature#create'

end
