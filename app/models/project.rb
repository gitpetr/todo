class Project < ActiveRecord::Base
  has_many :tasks
  validates :number, :name, presence: true
end
