class Report < ActiveRecord::Base
  belongs_to :member, :class_name => "Member"
  belongs_to :issue, :class_name => "Issue"
end
