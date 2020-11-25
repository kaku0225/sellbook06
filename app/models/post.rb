class Post < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def owned_by?(user)
    user == self.user
  end
end
