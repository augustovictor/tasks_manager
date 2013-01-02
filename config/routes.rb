TasksManager::Application.routes.draw do

  devise_for :users

  root to: "users#show"

  match '/users/:id' => 'users#show', as: :user_profile
  match '/users/:id/invite' => 'users#invite', as: :invite
  match '/users/:id/projects' => 'users#own_projects', as: :own_projects
  match '/users/:id/tasks' => 'users#own_tasks', as: :own_tasks

  # resources :users, only: [:show] do
  #   get 'user_profile'
  # end

  resources :projects do
    post 'add_task'
    get 'remove_participation'
    resources :tasks, except: [:index] do
      resources :task_questions, only: [:destroy]
      get 'done_task', on: :member
      get 'reopen_task', on: :member
      get 'ask_for', on: :member
      # get 'delete_questioning', on: :member
    end
  end

end
