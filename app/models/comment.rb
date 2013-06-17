class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :commentor_name, :content
end
