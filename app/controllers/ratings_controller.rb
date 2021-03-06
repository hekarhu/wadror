class RatingsController < ApplicationController
  

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end
  def new
    @rating = Rating.new
    @beers = Beer.all
  end

#    def create
#    rating = Rating.create params.require(:rating).permit(:score, :beer_id)
#    current_user.ratings << rating
#    redirect_to current_user
#  end

  def create
    @rating = Rating.new params.require(:rating).permit(:score, :beer_id)

    if @rating.save
      current_user.ratings << @rating
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
  end
  def destroy
    rating = Rating.find params[:id]
    rating.delete if current_user == rating.user
    redirect_to :back
  end
end
