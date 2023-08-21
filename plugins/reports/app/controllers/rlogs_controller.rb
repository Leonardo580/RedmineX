class RlogsController < ApplicationController
  helper :rlogs

  def index
    @rlogs = Rlog.all
  end

  def show
    @rlogs = Rlog.where(contract_id: params[:id]).page params[:page]
    @rlogs_tmp =@rlogs.deep_dup
    if params[:issue].present?
      @rlogs=Rlog.where(contract_id: params[:id], issue_id: params[:issue]).page params[:page]
    end
    puts "dsf#{@rlogs.inspect}"
    if params[:violated].present?
      @rlogs=Rlog.where(contract_id: params[:id], violated: params[:violated]).page params[:page]
    end
    @rlogs
  end

end
