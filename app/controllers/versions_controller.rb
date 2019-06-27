class VersionsController < ApplicationController
  before_action :set_page

  # GET /pages/:id/versions
  def index
    @versions = @page.versions
    user_ids = @versions.collect(&:whodunnit).reject(&:blank?).uniq
    @version_users = User.where(:id => user_ids)
  end

  # GET /pages/:id/versions/:id
  def show
    @version = @page.versions.find(params[:id])
    @page_at_version = @page.paper_trail.version_at(@version.created_at)
    @markdown = Redcarpet::Markdown.new(StetsonRenderer, tables: true, fenced_code_blocks: true, footnotes: true)
  end

  private

  def set_page
    @page = Page.friendly.find(params[:page_id])
  end
end