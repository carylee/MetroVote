class Article < ActiveRecord::Base
  default_scope :order => 'date DESC'

  attr_accessor :candidates

end
