class Article < ActiveRecord::Base
  default_scope :order => 'date DESC'

  candidates = []

end
