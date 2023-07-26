class ReportsController < ApplicationController

  def index
    @reports= Report.all
  end

  def notif

  end
end
