class User < ActiveRecord::Base
  has_many :donations
  has_many :kids, :through => :donations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :name, presence: true
    validates :phonenumber, presence: true, numericality: { only_integer: true }, length: { is: 10 }
    validates :address, presence: true
       
end
