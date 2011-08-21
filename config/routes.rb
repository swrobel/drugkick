Drugkick::Application.routes.draw do
  root to: "welcome#home"
  resources :inquiries, :except => [:index, :show]
  match 'congrats' => 'welcome#congrats', :as => :congrats

  # resources :leads

  # resources :treatment_types

  # resources :insurers

  # resources :drugs

  # resources :religions

  # resources :inquiries

  # resources :rehabs

end
