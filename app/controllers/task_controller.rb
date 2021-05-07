class TaskController < ApplicationController
  def index
    tasks = Task.all
    render :json => tasks
  end

  def create
    task = Task.new(name: params[:name], description: params[:description])

    if task.valid?
      task.save!
      render :json => task
    else
      render :json => { error: 'Params are incorrect!' }, status: :bad_request
    end    
  end

  def show
    task = Task.find_by id: params[:id]
    render :json => task
  end

  def destroy
    task = Task.find_by id: params[:id]

    if task.nil?
      render :json => { error: 'Task doesn\'t exist'}, status: :not_found
    else 
      task.destroy
      render :json => {id: params[:id]}
    end
  end
end