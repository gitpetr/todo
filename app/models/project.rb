class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates :number, :name, presence: true
end
