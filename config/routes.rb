Rails.application.routes.draw do
  root 'recipes#all_recipes'

  get '/sign-up', to: 'users#sign_up', as: nil
  post '/sign-up', to: 'users#create_account', as: nil
  get '/log-in', to: 'users#log_in', as: nil
  post '/log-in', to: 'users#authenticate', as: nil
  post '/log-out', to: 'users#log_out', as: nil

  scope '/recipes' do
    get '/all', to: 'recipes#all_recipes', as: nil
    get '/new-full', to: 'recipes#new_full', as: nil
    post '/new-full', to: 'recipes#create_full', as: nil
  end

  scope '/:recipe_slug' do
    get '/ingredients', to: 'recipes#ingredients', as: nil
    get '/instructions', to: 'recipes#instructions', as: nil
    get '/nutrition', to: 'recipes#nutrition', as: nil
    get '/edit-full', to: 'recipes#edit_full', as: nil
    patch '/edit-full', to: 'recipes#update_full', as: nil
    delete '/edit-full', to: 'recipes#destroy_full', as: nil
  end

  scope '/:user_slug' do
    get '/progress', to: 'users#progress', as: nil
    get '/targets', to: 'users#targets', as: nil
    get '/food-log', to: 'users#food_log', as: nil
    get '/account', to: 'users#account', as: nil
    get '/account/edit', to: 'users#edit_account', as: nil
    patch '/account/edit', to: 'users#update_account', as: nil
    delete '/account/edit', to: 'users#destroy', as: nil
    get '/my-recipes', to: 'users#my_recipes', as: nil
    get '/favorite-recipes', to: 'users#favorite_recipes', as: nil
  end

  post '/:user_slug/:recipe_slug/favorites', to: 'recipes#toggle_favorite', as: nil
  post '/:user_slug/:recipe_slug/food-log', to: 'recipes#create_food_log', as: nil
  delete '/:food_log_id/food-log', to: 'recipes#destroy_food_log', as: nil

end
