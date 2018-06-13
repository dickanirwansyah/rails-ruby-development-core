Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
        resources :categorys
        resources :matakuliahs
    end
  end
end
