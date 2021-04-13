# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  use_doorkeeper
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :todo_tasks, only: %i[index create update destroy]
    end
  end
end
