class DogsController < ApplicationController
    before_action :find_dogs, only: [ :show, :edit, :update, :destroy]
    
    def index
        @dogs = Dog.all 
    end 

    def show 
        # helper
    end 

    def new 
        @dog = Dog.new()
    end 

    def create
        @dog = Dog.create(dog_params)
        redirect_to dog_path(@dog) 
    end 

    def edit
        # helper
    end 

    def update
        # helper
        @dog.update(dog_params)
        redirect_to dog_path(@dog)
    end 

    def destroy 
        # helper 
        @dog.destroy
        redirect_to dogs_path 
    end 

    private 

    def find_dogs 
        @dog = Dog.find(params[:id])
    end 

    def dog_params
        params.require(:dog).permit(:name, :age, :breed)
    end 


end
