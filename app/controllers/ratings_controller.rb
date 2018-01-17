class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def index
    @ratings = Rating.all
  end
  
  def show
  end

  # GET /ratings/new
  def new
    @rating = Recipe.find_by(id: params[:recipe_id]).ratings.new
  end

  def edit
  end

  def create
    @rating = Recipe.find_by(id: params[:recipe_id]).ratings.new(rating_params)
    @rating.user = current_user

    respond_to do |format|
      if @rating.save
        format.html { redirect_to recipe_path(@rating.recipe), notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new  }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @rating = Recipe.find_by(id: params[:recipe_id]).ratings.new(rating_params)
    @rating.user = current_user

    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:score, :references)
    end
end
