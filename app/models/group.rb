class Group < ApplicationRecord
  has_many :users
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
  validates :title, presence: :true
  validates :public, inclusion: { in: [ true, false ] }
  validates :password, presence: :true, if: -> { public == false }
end
