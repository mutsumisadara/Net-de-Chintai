class HousesController < ApplicationController
  before_action :set_house, only: %i[ show edit update destroy ]
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end

  def edit
    @house = House.find(params[:id])
    # 2.times { @house.stations.build }
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to @house, notice: "登録しました"
    end
  end

  def update
    @house.update(house_params)
    redirect_to @house, notice: "編集しました"
  end

  def destroy
    @house.destroy
    redirect_to houses_path, notice: "削除しました"
  end

  private
    def set_house
      @house = House.find(params[:id])
    end

  def house_params
    params.require(:house).permit(:name, :price, :address, :age, :information)
  end
end