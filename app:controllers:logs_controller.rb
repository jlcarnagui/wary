# app/controllers/logs_controller.rb
class LogsController < ApplicationController
  # POST /entry
  def create
    @log = Log.new(log_params)

    if @log.save
      render json: { message: "#{@log.entry_type} recorded successfully" }, status: :created
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  private

  def log_params
    params.require(:log).permit(:employee_id, :dni_or_license_plate, :entry_type, :client)
  end
end