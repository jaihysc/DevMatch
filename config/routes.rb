Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"# Direct to home page- using PAGES_controller
  get 'about', to: "pages#about" #Direct to about page on input of about - in this case "URL/about"
  resources :contacts #Resources expands into 8 different routes
  get 'contact-us', to: 'contacts#new' #Custom url [customPath], to: [Controller+Page]
end
