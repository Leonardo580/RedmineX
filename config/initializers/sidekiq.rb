require "sidekiq-cron"

Sidekiq::Cron::Job.create(
  name: "Update reports",
  cron: "*/30 * * * * *",
  class: "ReportSchedulerJob"
)