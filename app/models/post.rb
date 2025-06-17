class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  before_create :set_author_name

  private

  def set_author_name
    self.author = user.username if self.author.blank?
  end
end
