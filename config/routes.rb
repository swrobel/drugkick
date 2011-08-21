Drugkick::Application.routes.draw do
  root to: "welcome#home"
  resources :inquiries

  # resources :leads

  # resources :treatment_types

  # resources :insurers

  # resources :drugs

  # resources :religions

  # resources :inquiries

  # resources :rehabs

end
