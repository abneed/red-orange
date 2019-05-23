class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }

  # def self.find(id)
  #   StoredProcedureService.select(User, 'user_get_by_id', [id])
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
