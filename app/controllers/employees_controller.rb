class EmployeesController < ApplicationController
    before_action :find_employee, only: [ :show, :edit, :update, :destroy]
    
    def index
        @employees = Employee.all 
    end 

    def show 
        # helper
    end 

    def new 
        @employee = Employee.new()
        @dogs = Dog.all 
    end 

    def create
        @employee = Employee.new(employee_params) 
        if @employee.valid? 
            @employee.save 
            redirect_to employee_path(@employee) 
        else 
            flash[:errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end 
    end 

    def edit
        # helper
        @dogs = Dog.all 
    end 

    def update
        # helper
        @employee.update(employee_params) 
        if @employee.valid? 
            redirect_to employee_path(@employee) 
        else 
            flash[:errors] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee)
        end 
          

    end 

    def destroy 
        # helper 
        @employee.destroy
        redirect_to employees_path 
    end 

    private 

    def find_employee 
        @employee = Employee.find(params[:id])
    end 

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end 

end
