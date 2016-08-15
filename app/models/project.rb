class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :number, :name, presence: true
  validates :number, numericality: { only_integer: true, message: "Вас же попросили ввести цифры!" }
end
