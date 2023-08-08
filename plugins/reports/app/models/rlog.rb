class Rlog < ActiveRecord::Base
  belongs_to :contract
  belongs_to :journal
end
