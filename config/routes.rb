Rails.application.routes.draw do
  resources :todos

  get '/send_text' => "texts#send_text"

  
end
