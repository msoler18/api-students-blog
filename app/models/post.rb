class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 250}
  validates_associated :user

  def self.search(search)
    where("title LIKE? OR content LIKE?","%#{search}%", "%#{search}%")
  end  
end
