class UsersController < ApplicationController
    before_action :set_user, only: [:show, :place, :sethome]
    before_action :valid_user, only: [:index, :home]
    # before_action :home_params, only: [:set_home]
    
    def index
        if user_signed_in?
            @neighborhood_post = NeighborhoodPost.new
            #redirect_to users_path
        else
            redirect_to root_url
        end
    end

    def show
    end

    def place
    end

    def states
        render json: State.where(country_id: params[:country]).order("name asc").to_json
    end

    def cities
        render json: City.where(state_id: params[:state]).order("name asc").to_json
    end

    def sethome

        @town
        @neighborhood

        if Town.find_by(name: params[:town_name]).nil?
            @town = Town.new(name: params[:user][:town_name], city_id: params[:user][:city_id])
            @town.save!
        end

        params[:user][:town_id] = @town.id

        if Neighborhood.find_by(name: params[:neighborhood_name]).nil?
           @neighborhood = Neighborhood.new(name: params[:user][:neighborhood_name], town_id: params[:user][:town_id])
           @neighborhood.save!
        end
        
        params[:user][:neighborhood_id] = @neighborhood.id

        if @user.update_attributes(liveplace_params)
            redirect_to users_path, flash: { success: 'Your Liveplace was successfully updated.' }
        else
            redirect_to root_url, flash: { danger: 'Error Message Shall Be Here.' }
        end

    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def valid_user
        user_signed_in? && @user = User.find(current_user.id)
    end

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end

    def liveplace_params
        params.require(:user).permit(:id, :neighborhood_id, :town_id, :city_id, :state_id, :country_id)
    end

end