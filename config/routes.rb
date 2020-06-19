Rails.application.routes.draw do
  get '/' => "home#top"
  get '/login' => "home#login_form"
  get '/edit' => "home#edit"
  post '/login' => "home#login"
  post '/logout' => "home#logout"
  post '/change_status' => "home#change_status"
  post '/extend' => "home#extend"
  post '/destroy_log/:id' => "home#destroy_log"
  post '/add_link' => "home#add_link"
  post '/change_link/:id' => 'home#change_link'
  post '/destroy_link/:id' => 'home#destroy_link'
end
