class ContractsController < ApplicationController

  def index
    @contracts = Contract.all
  end

  def new
    @contracts = Contract.new

  end

  def create
    project = Project.find(params[:project_id])
    @contracts = Contract.new(contract_params)
    @contracts.project = project

    if Contract.find_by(project: project).present?
      respond_to do |format|
        format.html do
          flash[:error] = l(:contract_already_exists)
          redirect_to "/projects"
        end
      end

    elsif @contracts.save
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_create)
          redirect_to "/projects"
        end
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
      end
    end
  end
  def show
    @contracts = Contract.find_by project_id: params[:project_id]
  end

  def edit
    project = Project.find(params[:project_id])
    @contracts = Contract.find_by project: project
  end

  def update
    # project= Project.find(params[:id])
    @contracts = Contract.find(params[:id])
    if @contracts.update(contract_params)
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_update)
          redirect_to "/projects"
        end
      end
    else
      respond_to do |format|
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy

    @contracts = Contract.find(params[:id])
    @contracts.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = l(:notice_successful_delete)
        redirect_to "/projects"
      end
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:low, :normal, :high, :urgent, :immediate, :low_progress, :normal_progress, :high_progress, :urgent_progress, :immediate_progress)
  end
end
