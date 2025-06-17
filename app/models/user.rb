class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:username]

  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  after_update :update_posts_author, if: :saved_change_to_username?

  private

  def update_posts_author
    posts.update_all(author: self.username)
  end
end
