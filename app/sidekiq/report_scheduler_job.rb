
class ReportSchedulerJob
  include Sidekiq::Job

  def perform(*args)


      report = Issue.where("start_date= ? and created_on < ?",Time.now,  (Time.now - 1.hour))

    report.select do |issue|
      issue.start_date=nil
      issue.priority.id =5
    end

      report.each do |r|
        Report.create(issue: r, failed_to_res: 1, failed_to_fix: 0)
      end
      failed_to_fix= Issue.where("closed_on is null and start_date < ? ", Time.now - 1)


    end
  end

