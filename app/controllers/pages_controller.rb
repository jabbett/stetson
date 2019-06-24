class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  def index
    @pages = Page.all.order(:title)
  end

  # GET /pages/1
  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, tables: true, fenced_code_blocks: true, footnotes: true)
    @child_pages = Page.where(parent: @page.id).order(:title)
  end

  # GET /pages/new
  def new
    @page = Page.new
    @pages = Page.all
  end

  # GET /pages/1/edit
  def edit
    @pages = Page.all
  end

  # POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to @page, notice: "Page updated."
    else
      render :edit
    end
  end

  # DELETE /pages/1
  def destroy
    if Page.where(parent: @page).any?
      redirect_to @page, alert: "Can't delete this page, since it contains child pages. Delete the child pages first."
    else
      destination = @page.parent || root_url
      old_title = @page.title
      @page.destroy
      redirect_to destination, notice: "Page '#{old_title}' has been deleted."  
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:title, :body, :slug, :parent_id)
    end
end
