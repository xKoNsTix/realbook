class ProjectsController < ApplicationController

    before_action :require_signin

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.user_id = current_user.id
        if @project.save
            redirect_to project_path(@project), notice: 'Project successfully created!'
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private

    def project_params
        params.require(:project).permit(:adress, :date, :video, :drone, :photo, :size)
    end
end
