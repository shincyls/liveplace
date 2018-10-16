class NeighborhoodRepliesController < ApplicationController
  # before_action :set_neighborhood_reply, only: [:show, :edit, :update, :destroy]
  before_action :neighborhood_reply_params, only: [:create, :edit]

  def edit
  end

  def create
    respond_to :html, :js
    @neighborhood_reply = NeighborhoodReply.new(neighborhood_reply_params)
    @neighborhood_reply.update(user_id: current_user.id)
    if @neighborhood_reply.save
      redirect_to users_path, flash: { success: 'Reply was was created successfully.' }
    else
      redirect_to users_path, flash: { danger: 'Post Failure.' }
    end
  end

  def update
    respond_to do |format|
      if @neighborhood_reply.update(neighborhood_reply_params)
        format.html { redirect_to @neighborhood_reply, notice: 'Neighborhood reply was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @neighborhood_reply.destroy
    respond_to do |format|
      format.html { redirect_to neighborhood_replies_url, notice: 'Neighborhood reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighborhood_reply
      @neighborhood_reply = NeighborhoodReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neighborhood_reply_params
      params.require(:neighborhood_reply).permit(:reply, :image, :video_url, :neighborhood_post_id)
    end
end
