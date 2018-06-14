Rails.application.routes.draw do
  resource :user, only: [:new, :create, :update]

  get ':id/edit', to: 'users#edit'
end
