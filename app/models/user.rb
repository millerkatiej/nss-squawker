class User < ActiveRecord::Base
  include Gravtastic
  has_gravatar
  
  extend FriendlyId
  friendly_id :username

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :squeeks

  def self.find_for_database_authentication(conditions)
    self.where(:username => conditions[:email]).first || self.where(:email => conditions[:email]).first
  end
end
