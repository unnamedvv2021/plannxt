class PlanModelsController < ApplicationController
  def index
    @plan_model = PlanModel.all
    render json: @plan_model.to_json
  end

  def show
    @plan_model = PlanModel.find(params[:id])
    render json: @plan_model.to_json
  end
  
  def new
    @plan_model = PlanModel.new
  end

  def create
    @plan_model = PlanModel.new(name: "...")

    if @plan_model.save
      redirect_to @plan_model
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    @plan_model = PlanModel.find(params[:id])

    if @plan_model.update(plan_model_data)
      redirect_to @plan_model
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
    def plan_model_data
      params.require(:plan_model_data).permit(:id, :data)
    end
end