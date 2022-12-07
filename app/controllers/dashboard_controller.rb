class DashboardController < ApplicationController
  def index
    @articles=Article.all
  end
end
