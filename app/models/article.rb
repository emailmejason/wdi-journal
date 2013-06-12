class Article < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, :presence => true
end
