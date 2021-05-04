class TaskController < ApplicationController
  def index
    tasks = Task.all
    render :json => tasks
  end

  def create
    task = Task.create(name: "test", description: "test description")
    render :json => task
  end
end