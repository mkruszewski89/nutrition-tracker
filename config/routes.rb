Rails.application.routes.draw do
  root 'recipes#index'

  scope '/recipes' do
    get '/', to: 'recipes#index', as: 'recipes'
  end

  scope '/users' do
    scope '/:id' do
      get '/progress', to: 'users#progress', as: 'user_progress'
      get '/targets', to: 'users#targets', as: 'user_targets'
      get '/food-log', to: 'users#food_log', as: 'user_food_log'
      get '/account', to: 'users#account', as: 'user'
      get '/edit', to: 'users#edit_account', as: 'edit_user'
      scope '/recipes' do
        get '/', to: 'users#index_recipes', as: 'user_recipes'
        get '/favorites', to: 'users#favorite_recipes', as: 'user_favorite_recipes'
        get '/new', to: 'recipes#new', as: 'new_recipe'
        post '/new', to: 'recipes#new_action', as: nil
        get '/:recipe_id', to: 'recipes#show', as: 'recipe'
        get '/:recipe_id/edit', to: 'recipes#edit', as: 'edit_recipe'
        patch '/:recipe_id/edit', to: 'recipes#edit_action', as: nil
      end
    end
  end

end
