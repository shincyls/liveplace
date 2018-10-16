class NeighborhoodPostsController < ApplicationController
  # before_action :set_neighborhood_post, only: [:show]
  # before_action :create_neighborhood_post, only: [:create]
  before_action :neighborhood_post_params, only: [:create, :edit]

  def post
    # respond_to :html, :js
    @neighborhood_posts = Array.new
    if params[:query].empty? || params[:query] == "all"
      @neighborhood_posts = NeighborhoodPost.all.where(neighborhood_id: 2).order("created_at desc")
    else
      @neighborhood_posts = NeighborhoodPost.search_projects(params[:query])
    end
  end

  def edit
  end

  def create
    respond_to :html, :js
    @neighborhood_post = NeighborhoodPost.new(neighborhood_post_params)
    @neighborhood_post.update(user_id: current_user.id, neighborhood_id: current_user.neighborhood.id)
    if @neighborhood_post.save
      redirect_to users_path, flash: { success: 'Post was was created successfully.' }
    else
      redirect_to users_path, flash: { danger: 'Post Failure.' }
    end
  end

  def update
    respond_to do |format|
      if @neighborhood_post.update(neighborhood_post_params)
        format.html { redirect_to @neighborhood_post, notice: 'Neighborhood post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @neighborhood_post.destroy
    respond_to do |format|
      format.html { redirect_to neighborhood_posts_url, notice: 'Neighborhood post was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighborhood_post
      @neighborhood_post = NeighborhoodPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neighborhood_post_params
      params.require(:neighborhood_post).permit(:post, :image, :video_url, :neighborhood_id)
    end

end
