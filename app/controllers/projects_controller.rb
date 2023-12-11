class ProjectsController < ApplicationController

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
        @project = Project.create(project_params)
        if @project.save
            redirect_to project_path(@project), notice: 'Event successfully created!'
        else
            render :new, status: :unprocessable_entity
        end
    end

    # @event = Event.create(event_params)
    # if @event.save
    #   redirect_to event_path(@event), notice: 'Event successfully created!'
    # else
    #   render :new, status: :unprocessable_entity
    # end

    # def event_params
    #     params.require(:event).permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name, category_ids: [])
    #   end
    private

    def project_params
        params.require(:project).permit(:adress, :date, :video, :drone, :photo, :size)
    end
end
