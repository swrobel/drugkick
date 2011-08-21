class WelcomeController < ApplicationController
  def home
    redirect_to new_inquiry_path
  end
end
