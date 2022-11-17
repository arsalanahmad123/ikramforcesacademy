class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  has_many :user_answers
  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
    self.role ||= :user
  end

  def admin?
    self.role == "admin"
  end

  def moderator?
    self.role == "moderator"
  end
  
end
