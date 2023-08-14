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
  def get_duration(visible_details, rlog)
    duration = 0
    visible_details.each do |detail|
      if detail.value == "2"
        j = Journal.find(detail.journal_id)
        duration = (j.created_on.to_i - j.issue.created_on.to_i) / 60
        rlog.violated = violated?(rlog, duration, rlog.issue.priority.to_s)
      elsif detail.value == "3"
        j = Journal.find(detail.journal_id)
        j2=j.journalized.journals.sort {|journal| journal.created_on}[-1]
        puts "444#{j.journalized.journals.inspect}"
        # j2= Journal.find(detail.journal_id - 1)
        duration = (j.created_on.to_i - j2.created_on.to_i) / 60
        rlog.violated = violated?(rlog, duration, rlog.issue.priority.to_s)

      end
      rlog.save
    end
    duration
  end
  def violated?(rlog, duration, status)
    violate=rlog.contract.attributes
    status.downcase!
    violate[status] < duration
  end
  def min_to_hours(min)
    hours=min / 60
    rest=min % 60
    "#{hours}h #{rest}min"
  end

end
