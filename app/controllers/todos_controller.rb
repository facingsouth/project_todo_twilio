class TodosController < ApplicationController
 
 def index 
  @todos = Todo.all.reverse
 end

  def new
   @todo = Todo.new
  end
 
  def create
    @todo = Todo.new(whitelist_params)
    if @todo.save
      flash[:success] = 'You have another item todo.'
      redirect_to todos_path 
    else
      flash[:error] = 'An error has occurred'
      render :new
    end
  end
  
  def whitelist_params
    params.require(:todo).permit(:item)
  end
end

