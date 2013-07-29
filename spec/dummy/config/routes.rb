Rails.application.routes.draw do
  mount Questionable::Engine => "/askaquestion"
end
