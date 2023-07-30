Rails.application.routes.draw do
  get 'amazon_books/convert'
  resources :amazon_books
end
