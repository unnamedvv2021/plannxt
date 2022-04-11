class PlanModelsController < ApplicationController
  def edit_page
    @plan_model = PlanModel.all
  end
  
  def index
    @plan_model = PlanModel.all
    #render json: @plan_model.to_json
  end

  def show
    @plan_model = PlanModel.find(params[:id])
    #render json: @plan_model.to_json
  end
  
  def new
    @plan_model = PlanModel.new
  end

  def create
    @plan_model = PlanModel.new(plan_model_data)

    if @plan_model.save
      redirect_to @plan_model
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @plan_model = PlanModel.find(params[:id])
  end
  
  def update
    @plan_model = PlanModel.find(params[:id])
    if @plan_model.update(plan_model_data)
      redirect_to @plan_model
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @plan_model = PlanModel.find(params[:id])
    @plan_model.destroy

    redirect_to root_path, status: :see_other
  end
  
  
  private
    def plan_model_data
      params.require(:plan_model).permit(:name, :data, :creator, :editPermission, :viewPermission, :extra1, :extra2, :extra3)
    end
end