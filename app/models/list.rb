class List < ActiveRecord::Base
  has_many :tasks

  validates :title, presence: true, length: { minimum: 1 }
end
