Rails.application.routes.draw do
  root 'recipes#recipes'

  scope '/recipes' do
    get '/all', to: 'recipes#all_recipes', as: 'recipes'
    get '/new', to: 'recipes#new_full', as: 'new_recipe'
    post '/new', to: 'recipes#new_full_action', as: nil
  end

  scope '/:recipe_id' do
    get '/ingredients', to: 'recipes#show_ingredients', as: 'recipe_ingredients'
    get '/instructions', to: 'recipes#show_instructions', as: 'recipe_instructions'
    get '/nutrition', to: 'recipes#show_nutrition', as: 'recipe_nutrition'
    get '/edit', to: 'recipes#edit', as: 'edit_recipe'
    patch '/edit', to: 'recipes#edit_action', as: nil
  end

  scope '/users' do
    get '/authentication', to: 'users#authenticate', as: 'users_authentication'
  end

  scope '/:user_id' do
    get '/progress', to: 'users#progress', as: 'user_progress'
    get '/targets', to: 'users#targets', as: 'user_targets'
    get '/food-log', to: 'users#food_log', as: 'user_food_log'
    get '/account', to: 'users#account', as: 'user'
    get '/edit', to: 'users#edit_account', as: 'edit_user'
    get '/my-recipes', to: 'users#my_recipes', as: 'user_recipes'
    get '/favorite-recipes', to: 'users#favorite_recipes', as: 'user_favorite_recipes'
  end

end
