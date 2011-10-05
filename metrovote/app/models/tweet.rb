class Tweet < ActiveRecord::Base
  belongs_to :candidate
  default_scope :order => 'created DESC'
end
