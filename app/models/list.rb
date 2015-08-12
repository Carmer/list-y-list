require "csv"

class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1 }

  def self.export_as_a_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |list|
        csv <<list.attributes.values_at(*column_names)
      end
    end
  end

  def export_as_a_csv
    CSV.generate do |csv|
      csv << column_names
      csv << self.attributes.values_at(*column_names)
    end
  end
end
