Rails.application.routes.draw do
  resource :user, only: [:new, :create, :update]
end
