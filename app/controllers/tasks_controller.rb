class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks
  end

  def index_uncomplete
    @tasks = current_user.tasks
    @tasks = @tasks.uncompleted

    render 'index'
  end

  def index_nextaction
    @tasks = current_user.tasks
    @tasks = @tasks.uncompleted
    @tasks = @tasks.nextaction

    if @tasks.size == 0 
      redirect_to tasks_uncomplete_path 
      return
    end

    render 'index'
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    current_user.tasks << Task.new(task_params)


    respond_to do |format|
      if current_user
        format.html { redirect_to tasks_uncomplete_path, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def toggle
    render nothing: true
    @task = Task.find(params[:id])
    @task.complete = !@task.complete
    @task.save
  end

  def toggle_star
    render nothing: true
    @task = Task.find(params[:id])
    @task.next_flg = !@task.next_flg
    @task.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :complete, :project_id)
    end
end
