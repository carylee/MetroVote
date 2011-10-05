class Position < ActiveRecord::Base
  has_many :candidates
  belongs_to :election
end
