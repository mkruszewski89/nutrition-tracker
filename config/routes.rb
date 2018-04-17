Rails.application.routes.draw do
  root 'recipes#all_recipes'

  scope '/recipes' do
    get '/all', to: 'recipes#all_recipes', as: 'recipes_all'
    get '/new', to: 'recipes#new_full', as: 'recipe_new_full'
    post '/new', to: 'recipes#create_full', as: 'create_recipe_full'
  end

  scope '/:recipe_id' do
    get '/ingredients', to: 'recipes#ingredients', as: 'recipe_ingredients'
    get '/instructions', to: 'recipes#instructions', as: 'recipe_instructions'
    get '/nutrition', to: 'recipes#nutrition', as: 'recipe_nutrition'
    get '/edit', to: 'recipes#edit_full', as: 'edit_recipe_full'
    patch '/edit', to: 'recipes#update_full', as: 'update_recipe_full'
  end

  scope '/users' do
    get '/authentication', to: 'users#authenticate', as: 'users_authentication'
  end

  scope '/:user_id' do
    get '/progress', to: 'users#progress', as: 'user_progress'
    get '/targets', to: 'users#targets', as: 'user_targets'
    get '/food-log', to: 'users#food_log', as: 'user_food_log'
    get '/account', to: 'users#account', as: 'user_account'
    get '/edit', to: 'users#edit_account', as: 'edit_user_account'
    get '/my-recipes', to: 'users#my_recipes', as: 'user_recipes_all'
    get '/favorite-recipes', to: 'users#favorite_recipes', as: 'user_recipes_favorites'
  end

  post '/:user_id/:recipe_id/favorites', to: 'recipes#toggle_favorite', as: 'toggle_favorites_recipe'
  post '/:user_id/:recipe_id/food-log', to: 'recipes#create_food_log', as: 'create_food_log_recipe'
  delete '/:food_log_id/food-log', to: 'recipes#destroy_food_log', as: 'delete_food_log_recipe'

end
