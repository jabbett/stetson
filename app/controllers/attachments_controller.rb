class AttachmentsController < ApplicationController
  before_action :set_page, only: [:create]
  before_action :set_attachment, only: [:show, :destroy]

  # GET /pages/1/attachments/1
  #
  # To support pasted image uploads, we need a way to get a file
  # from its blob_id (which is returned by Active Storage's DirectUpload)
  def show
    redirect_to rails_blob_url(@attachment)
  end

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
      @attachment = ActiveStorage::Attachment.find_by(blob_id: params[:id])
    end
end