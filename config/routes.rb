Rails.application.routes.draw do
  root 'recipes#index'

  scope '/recipes' do
    get '/', to: 'recipes#index', as: 'recipes'
  end

  scope '/users' do
    scope '/:id' do
      get '/', to: 'users#show', as: 'user'
      scope '/recipes' do
        get '/:recipe_id', to: 'recipes#show', as: 'recipe'
      end
    end
  end

end
