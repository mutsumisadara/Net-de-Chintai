class HousesController < ApplicationController
  before_action :set_house, only: %i[ show edit update destroy ]
  def index
    @houses = House.all
  end

  def show
    @stations = @house.stations
  end

  def new
    @house = House.new
    2.times { @house.stations.build }
  end

  def edit
    @house.stations.build
    # @house = House.find(params[:id])
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to @house, notice: "登録しました"
      # binding.pry
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
    params.require(:house).permit(:name, :price, :address, :age, :information, stations_attributes: [:id, :line, :station, :on_foot])
  end
end