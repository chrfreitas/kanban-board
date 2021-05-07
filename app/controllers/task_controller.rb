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
end