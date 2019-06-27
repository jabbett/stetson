class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :resolve, :unresolve]

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.creator = current_user

    respond_to do |format|
      if @comment.save
        format.js { render }
      else
        # TODO
        # render :new
      end  
    end
  end

  # DELETE /comments/1
  def destroy
    if @comment.creator_id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.js { render }
      end
    end
  end

  def resolve
    @comment.update(resolved_by: current_user, resolved_at: DateTime.current)
    respond_to do |format|
      format.js { render }
    end
  end

  def unresolve
    @comment.update(resolved_by: nil, resolved_at: nil)
    respond_to do |format|
      format.js { render }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:page_id, :creator_id, :body, :resolved_at, :resolved_by_id)
    end
end
