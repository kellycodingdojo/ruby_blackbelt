class Group < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :members, through: :joins, source: :user

  validates :title, :description, :user, presence: true

  validates :title, length: { minimum: 5 }

  validates :description, length: { minimum: 10 }

end
