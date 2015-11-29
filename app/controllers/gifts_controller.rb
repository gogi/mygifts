class GiftsController < ApplicationController
  expose(:gift, attributes: :gift_params)
  expose(:gifts) { current_user.gifts }
  expose(:user) { current_user }

  # GET /gifts
  # GET /gifts.json
  def index
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
  end

  # GET /gifts/new
  def new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
  def create
    gift.user = current_user
    respond_to do |format|
      if gift.save
        format.html { redirect_to gift, notice: 'Gift was successfully created.' }
        format.json { render :show, status: :created, location: gift }
      else
        format.html { render :new }
        format.json { render json: gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
    respond_to do |format|
      if gift.update(gift_params)
        format.html { redirect_to gift, notice: 'Gift was successfully updated.' }
        format.json { render :show, status: :ok, location: gift }
      else
        format.html { render :edit }
        format.json { render json: gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_params
      params.require(:gift).permit(:name, :price, :description, :user_id)
    end
end
