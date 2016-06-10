class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: true
  PRIORITIES = [
    ['не важно', 1],
    ['важно', 2],
    ['срочно', 3]
  ]

  def complete!
    self.completed = true
    save
  end
end
