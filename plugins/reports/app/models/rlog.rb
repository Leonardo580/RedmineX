
class Rlog < ActiveRecord::Base
  belongs_to :contract
  belongs_to :issue
  # include WillPaginate::Sinatra
  include Kaminari::PageScopeMethods
  paginates_per 25
end
