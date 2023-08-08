module RlogsHelper
  include IssuesHelper

  def show_rlog
    tabs = []
    tabs << { :name => l(:label_rlog), :partial => 'rlogs/history', :id => 'rlog' }
  end

  def get_journals(rlog)
    contract = Contract.find(rlog.contract_id)
    issues = contract.project.issues
    issues.reduce([]) { |i1, i2| i1 + i2.journals }

  end
  def get_duration(visible_details)
    duration = []
    visible_details.each do |detail|
      if detail.value == "2"
        j = Journal.find(detail.journal_id)
        duration = (j.created_on.to_i - j.issue.created_on.to_i) / 60
      elsif detail.value == "3"
        j = Journal.find(detail.journal_id)
        j2= Journal.find(detail.journal_id - 1)
        duration = (j.created_on.to_i - j2.created_on.to_i) / 60
      end
    end
    duration
  end
end
