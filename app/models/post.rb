class Post < ApplicationRecord
  has_many :likes
  belongs_to :user
  validates :title, :content, presence: true
end
