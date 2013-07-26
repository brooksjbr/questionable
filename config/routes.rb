Askaquestion::Engine.routes.draw do
  resources :questions do
    resources :answers
  end
  
  resources :votes
end
