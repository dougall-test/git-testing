class EmployeesController < ApplicationController

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(params[:employee])
		if @employee.save
			redirect_to @employee
		else
			render 'new'
		end		
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def edit
		@employee = Employee.find(params[:id])
		render 'new'	
	end

	def update
		@employee = Employee.update(params[:employee])
	end
end
