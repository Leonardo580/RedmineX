# frozen_string_literal: true

class IssueObserver < ActiveRecord::Observer
  observe :issue
  def after_create(issue)
    project= Project.find(issue.project_id)
    contract = Contract.find_by_project_id(project.id)
    puts "Contract: #{contract}"
    Rlog.create(issue: issue, contract: contract)
  end
end
