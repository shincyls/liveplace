class UsersController < ActionController::Base
    before_action :set_user, only: [:show, :place]

    def show
    end

    def place
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end