class RlogsController < ApplicationController
  helper :rlogs
  def index
    @rlogs=Rlog.all
  end
  def show
    @rlogs=Rlog.where(contract_id: params[:id])
  end

end
