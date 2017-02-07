class ItemsController < ApplicationController
  def index
    @items = Items.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params.require(:item).permit(:title, :description))
    if item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :description)
end

def find_item
  @item = Item.find(params[:id])
end
end
