class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  helper_method :user_signed_in?, :current_user, :top_pages

  attr_reader :current_user

  def top_pages
    Page
      .where(parent: nil)
      .where.not(id: StetsonConfig.first.home_page_id)
      .order(:title)
  end
end
