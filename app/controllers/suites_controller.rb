class SuitesController < ApplicationController
  before_action :fetch_suite, only: %i(show edit)

  def index
    @suites = Suite.all
  end

  def new
    @suite = Suite.new
  end

  def show; end

  def edit; end

  private

  def fetch_suite
    @suite = Suite.find(params[:id])
  end
end
