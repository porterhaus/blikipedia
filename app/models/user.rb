class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :collaborators
  has_many :wikis, :through => :collaborators

  validates_presence_of :name

  before_create :init

  def init
    self.role = 'standard'
  end

  def collaborator?
    
  end
end
