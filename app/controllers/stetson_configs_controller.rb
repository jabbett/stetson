class StetsonConfigsController < ApplicationController
  before_action :set_stetson_config
  # GET /stetson_configs/1/edit
  def edit
    @pages = Page.all.order(:title)
  end

  # PATCH/PUT /stetson_configs/1
  def update
    if @stetson_config.update(stetson_config_params)
      redirect_to [:edit, @stetson_config], notice: 'Configuration updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stetson_config
      @stetson_config = StetsonConfig.first
    end

    # Only allow a trusted parameter "white list" through.
    def stetson_config_params
      params.require(:stetson_config).permit(:site_name, :home_page_id)
    end
end
