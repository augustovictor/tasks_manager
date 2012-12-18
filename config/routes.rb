TasksManager::Application.routes.draw do

  devise_for :users

  root to: "projects#index"

  resources :projects do
    post 'add_task'
    resources :tasks, except: [:index] do
      resources :task_questions, only: [:destroy]
      get 'done_task', on: :member
      get 'reopen_task', on: :member
      get 'ask_for', on: :member
      # get 'delete_questioning', on: :member
    end
  end

end
