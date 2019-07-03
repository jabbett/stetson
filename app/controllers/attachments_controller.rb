class AttachmentsController < ApplicationController
  before_action :set_page
  before_action :set_attachment, only: [:destroy]

  # POST /pages/1/attachments
  def create
    if @page.attachments.attach(params[:attachment])
      @attachment = @page.attachments.last
      flash.now[:notice] = "File '#{@attachment.filename}' attached."
    else
      # TODO find documentation about possible Active Storage errors
      flash.now[:alert] = "Could not attach file. Please try again."
    end

    respond_to do |format|
      format.js { render }
    end
  end

  # DELETE /pages/1/attachments/1
  def destroy
    @attachment.purge
    respond_to do |format|
      format.js { render }
    end
  end

  private

    def set_page
      @page = Page.friendly.find(params[:page_id])
    end

    def set_attachment
      @attachment = @page.attachments.find(params[:id])
    end
end