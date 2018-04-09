Rails.application.routes.draw do
  root 'recipes#index'

  scope '/recipes' do
    get '/', to: 'recipes#index', as: 'recipes'
    scope '/:id' do
      get '/', to: 'recipes#show', as: 'recipe'
    end
  end

end
