class PublicController < ApplicationController
  def index
    if user_signed_in?
      redirect_to StetsonConfig.first.home_page
    end
  end
end