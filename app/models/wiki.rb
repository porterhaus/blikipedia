class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, :through => :collaborators

  validates :title, presence: true
  validates :body, presence: true

  scope :visible_to, -> (user) { user ? all : where(private: false) }

  scope :recent, -> { order(created_at: :desc) }
end
