class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :memo, :start_date, :end_date, :all_day))
    if @schedule.save
      flash[:notice] = "予約が完了しました"
      
      redirect_to schedules_path
    else
      render "new"
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :memo, :start_date, :end_date, :all_day))
      flash[:notice] = "スケジュールを更新しました。"
      redirect_to schedules_path
    else
      flash[:alert] = "スケジュールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    
  end
end
