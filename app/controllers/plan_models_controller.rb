class PlanModelsController < ApplicationController
  protect_from_forgery with: :null_session
  #before_action :require_user_logged_in!

  def index
    logger.info Current.user.id
    @plan_model = PlanModel.where(creator:Current.user.id).order("created_at DESC")
    @user = User.all
    #render json: @plan_model.to_json
  end

  def show
    @plan_model = PlanModel.find(params[:id])
    #render json: @plan_model.to_json
  end
  
  def show_json
    @plan_model = PlanModel.find(params[:id])
    render json: {error_code:0,  data:@plan_model}
  end
  
  def new
    @plan_model = PlanModel.new
  end

  def create
    @plan_model = PlanModel.new(plan_model_data)

    if @plan_model.save
      redirect_to edit_page_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def create_json
    @plan_model = PlanModel.new(plan_model_data)
    logger.info @plan_model.data
    if @plan_model.save
      render json: {error_code:0, id:@plan_model.id, data:@plan_model}
    else
      render json: {error_code:1,  data:@plan_model}
    end
  end
  
  def edit_admin
    @plan_model = PlanModel.find(params[:id])
    #render inline: File.read('frontend/Untitled-1.html')
    #render file: 'frontend/Untitled-1.html', layout: false
  end
  
  def edit
    @plan_model = PlanModel.find(params[:id])
    #render inline: File.read('frontend/Untitled-1.html')
    render file: 'frontend/Untitled-1.html', layout: false
  end
  
  def update
    @plan_model = PlanModel.find(params[:id])
    if @plan_model.update(plan_model_data)
      flash[:notice] = "#{@plan_model.name} was successfully updated."
      redirect_to @plan_model
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def update_json
    # user = get_user() param debug = True, user = 1
    # user = 1
    # user = 4
    @plan_model = PlanModel.find(params[:id])
    logger.info params[:plan_model]
    #@plan_model.attributes = params[:plan_model]
    if @plan_model.update(plan_model_data)
      render json: {error_code:0,  data:@plan_model}
    else
      render json: {error_code:1,  data:@plan_model}
    end
  end
  
  def destroy
    @plan_model = PlanModel.find(params[:id])
    @plan_model.destroy
    flash[:notice] = "#{@plan_model.name} was successfully deleted."

    redirect_to edit_page_path, status: :see_other
  end
  
  def destroy_json
    @plan_model = PlanModel.find(params[:id])
    if @plan_model.destroy
      render json: {error_code:0}
    else
      render json: {error_code:1}
    end
  end
  
  private
    def plan_model_data
      if Current.user
        params.require(:plan_model).permit(:name, :data, :editPermission, :viewPermission, :extra1, :extra2, :extra3).merge(creator: Current.user.id)
      else
        params.require(:plan_model).permit(:name, :data, :editPermission, :viewPermission, :extra1, :extra2, :extra3)
      end
    end
end