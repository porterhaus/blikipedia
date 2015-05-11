class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, :through => :collaborators

  validates :title, presence: true
  validates :body, presence: true

  scope :visible_to, -> (user) { user ? all : where(private: false) }

  def collaborator?
    Collaborator.where(user_id: user.id, group_id: group.id)
  end

end
