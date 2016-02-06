class RatingsController < ApplicationController
  before_action :login_required, only: [ :create ]

  def create
    @rating = Rating.new(allowed_parameters)
    @rating.user = current_user
    @rating.sale = Sale.find(params[:sale_id])
    if current_user.id == @rating.sale.user.id
      redirect_to @rating.sale, alert: "You can't rate yourself!"
    else
      if @rating.sale.user.already_rated_by(current_user)
        redirect_to @rating.sale, alert: "You can't rate this vendor twice!"
      else
        if @rating.save
          redirect_to @rating.sale, notice: 'Thanks for send your rating about this vendor!'
        else
          redirect_to @rating.sale, alert: "Sorry, an unknown error occurred. Please try again later."
        end
      end
    end
  end

  private

  def allowed_parameters
    params.require(:rating).permit(:rating, :reason)
  end

end
