class Newsletter < ApplicationRecord
  belongs_to :author
  has_many :assignatures
  
  def author_name
    author.name
  end
end
