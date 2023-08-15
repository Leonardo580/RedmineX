class RlogsController < ApplicationController
  helper :rlogs

  def index
    @rlogs = Rlog.all
  end

  def show
    @rlogs = Rlog.where(contract_id: params[:id]).paginate(page: params[:page], per_page: 20)
    @rlogs_tmp =@rlogs.deep_dup
    if params[:issue].present?
      @rlogs=@rlogs.filter { |rlog| rlog.issue.id == params[:issue].to_i }
    end
    puts "dsf#{@rlogs.inspect}"
    if params[:violated].present?
      @rlogs=@rlogs.filter { |rlog| rlog.violated == (params[:violated]=="yes") }
    end
    @rlogs
  end

end
