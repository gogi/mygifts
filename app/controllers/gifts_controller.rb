class GiftsController < ApplicationController
  expose(:gift, attributes: :gift_params)
  expose(:gifts) { current_user.gifts }
  expose(:user) { current_user }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    gift.users << current_user
    if gift.save
      redirect_to gift, notice: 'Gift was successfully created.'
    else
      render :new
    end
  end

  def update
    if gift.update(gift_params)
      redirect_to gift, notice: 'Gift was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    gift.destroy
    redirect_to gifts_url, notice: 'Gift was successfully destroyed.'
  end

  private

  def gift_params
    params.require(:gift).permit(:name, :price, :description, :user_id)
  end
end
