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

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(whitelist_params)
      flash[:success] = 'You item has been updated.'
      redirect_to todos_path 
    else
      flash[:error] = 'An error has occurred'
      render :edit
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end
  
  def whitelist_params
    params.require(:todo).permit(:item)
  end
end

