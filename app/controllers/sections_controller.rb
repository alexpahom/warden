class SectionsController < ApplicationController
  before_action :fetch_suite_for_section, only: %i(new create edit update)
  before_action :fetch_section, only: %i(edit update destroy)

  def new
    @section = Section.new
  end

  def create
    @sections = @suite.sections.order(:created_at)

    @section = @suite.sections.new(section_params)
    respond_to do |format|
      if @section.save
        format.js { flash[:success] = 'Done' }
      else
        format.js { flash[:alert] = @section.errors.full_messages.to_sentence }
      end
    end
  end

  def edit
    respond_to :js
  end

  def update
    respond_to do |format|
      if @section.update_attributes(section_params)
        format.js { flash[:success] = 'Done' }
      else
        format.js { flash[:alert] = @section.errors.full_messages.to_sentence }
      end
    end
  end

  def destroy
    respond_to do |format|
      @section.destroy
      format.js { flash[:success] = 'Deleted' }
    end
  end

  private

  def fetch_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(%i(title description parent_id))
  end

  def fetch_suite_for_section
    @suite = Suite.find(params[:suite_id])
  end
end
