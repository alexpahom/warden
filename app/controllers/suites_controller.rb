class SuitesController < ApplicationController
  def index
    @suites = Suite.all
  end

  def new
    @suite = Suite.new
  end
end
