class PlanModelsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :require_user_logged_in!

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
  
  def fix_params
    if params[:plan_model].blank?
        # parent not provided
        return
    end
    new_paras = plan_model_data
    if params[:plan_model].key?("day1_date")
      new_paras[:extra1] = {"day1_date" => params[:plan_model].delete(:day1_date),
                                      "day1_hour1" => params[:plan_model].delete(:day1_hour1),
                                      "day1_hour2" => params[:plan_model].delete(:day1_hour2),
                                      "day1_hour3" => params[:plan_model].delete(:day1_hour3),
                                      "day1_hour4" => params[:plan_model].delete(:day1_hour4),
                                      "day1_hour5" => params[:plan_model].delete(:day1_hour5),
                                      "day1_hour6" => params[:plan_model].delete(:day1_hour6),
                                      "day2_date" => params[:plan_model].delete(:day2_date),
                                      "day2_hour1" => params[:plan_model].delete(:day2_hour1),
                                      "day2_hour2" => params[:plan_model].delete(:day2_hour2),
                                      "day2_hour3" => params[:plan_model].delete(:day2_hour3),
                                      "day2_hour4" => params[:plan_model].delete(:day2_hour4),
                                      "day2_hour5" => params[:plan_model].delete(:day2_hour5),
                                      "day2_hour6" => params[:plan_model].delete(:day2_hour6),
                                      "day3_date" => params[:plan_model].delete(:day3_date),
                                      "day3_hour1" => params[:plan_model].delete(:day3_hour1),
                                      "day3_hour2" => params[:plan_model].delete(:day3_hour2),
                                      "day3_hour3" => params[:plan_model].delete(:day3_hour3),
                                      "day3_hour4" => params[:plan_model].delete(:day3_hour4),
                                      "day3_hour5" => params[:plan_model].delete(:day3_hour5),
                                      "day3_hour6" => params[:plan_model].delete(:day3_hour6),
                                      "day4_date" => params[:plan_model].delete(:day4_date),
                                      "day4_hour1" => params[:plan_model].delete(:day4_hour1),
                                      "day4_hour2" => params[:plan_model].delete(:day4_hour2),
                                      "day4_hour3" => params[:plan_model].delete(:day4_hour3),
                                      "day4_hour4" => params[:plan_model].delete(:day4_hour4),
                                      "day4_hour5" => params[:plan_model].delete(:day4_hour5),
                                      "day4_hour6" => params[:plan_model].delete(:day4_hour6),
                                      "scale" => params[:plan_model].delete(:scale),
                                      "length" => params[:plan_model].delete(:length),
                                      "width" => params[:plan_model].delete(:width)
                                      
      }
    end

    logger.info "After fix:"
    logger.info new_paras
    return new_paras
  end

  def create
    @plan_model = PlanModel.new(fix_params)
    if @plan_model.save
      redirect_to edit_plan_model_path(@plan_model)
      #redirect_to edit_page_path
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
    render file: 'frontend/drawPanel.html', layout: false
  end
  
  def update
    @plan_model = PlanModel.find(params[:id])
    if @plan_model.update(fix_params)
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