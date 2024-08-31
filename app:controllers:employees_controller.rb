# app/controllers/employees_controller.rb
class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update]

  # POST /login
  def login
    @employee = Employee.find_by(username: params[:username])
    
    if @employee && @employee.authenticate(params[:password])
      # Geolocalización
      location = { lat: params[:location][:lat], long: params[:location][:long] }
      clients = [
        { name: 'Barrio A', location: [ -34.60, -58.38 ] }, 
        { name: 'Barrio B', location: [ -34.55, -58.40 ] }
      ]
      
      closest_client = clients.min_by { |client| Geocoder::Calculations.distance_between(location, client[:location]) }
      @employee.update(current_client: closest_client[:name], shift_start: Time.now, location: location)
      
      render json: { message: 'Login successful', current_client: closest_client[:name] }, status: :ok
    else
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end
end