require_dependency "rails_time_travel/application_controller"

module RailsTimeTravel
  class ManageController < RailsTimeTravel::ApplicationController
    def index
    end

    def set_datetime
      if params[:type] == "reset"
        Timecop.return
        session.delete(:timecop_date)
      elsif params[:type] == "months"
        session[:timecop_date] = params[:value].to_i.months.ago
      else
        session[:timecop_date] = params[:value].to_i.seconds.ago
      end
      redirect_to action: :index
    end
  end
end
