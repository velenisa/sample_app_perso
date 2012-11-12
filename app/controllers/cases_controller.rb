class CasesController < InheritedResources::Base
  respond_to :html, :json, :xml


   def index
    @cases = Case.paginate(page: params[:page])
  end



   private
     
     def signed_in_user
      unless signed_in?
        store_location
        #redirect_to signin_url, notice: "Please sign in."
        flash[:notice] = "Please sign in."
        redirect_to signin_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
