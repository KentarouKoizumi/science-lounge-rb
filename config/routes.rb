Rails.application.routes.draw do
  get '/' => "home#top"
  get '/login' => "home#login_form"
  get '/edit' => "home#edit"
  post '/login' => "home#login"
  post '/logout' => "home#logout"
  post '/change_status' => "home#change_status"
  post '/extend' => "home#extend"
  post '/destroy_log/:id' => "home#destroy_log"
end
