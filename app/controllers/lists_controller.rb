require 'open-uri'
class ListsController < ApplicationController

  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if params[:list][:image_url]
      downloaded_image = URI.parse(params[:list]['image_url']).open
      @list.image.attach(io: downloaded_image, filename: "#{params[:list][:name]}")
    end
    if @list.save
      redirect_to list_path(@list[:id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :image)
  end
end
