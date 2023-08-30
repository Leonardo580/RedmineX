class RlogsController < ApplicationController
  helper :rlogs

  def index
    @rlogs = Rlog.all
  end

  def show
    @rlogs = Rlog.where(contract_id: params[:id])
    @rlogs_tmp = @rlogs.deep_dup

    filter_tab = { contract_id: params[:id] }

    filter_tab[:issue_id] = params[:issue] if params[:issue].present?
    # filter_tab[:violated] = (params[:violated] == "yes") if params[:violated].present?

    @rlogs = Rlog.where(filter_tab).page(params[:page])
    puts "sfs #{ Rlog.where(filter_tab).to_sql}"
  end

end
