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

  end

  def edit
    
  end
  
  
  def update
    
  end

  def destroy
    
  end
  
  
end
