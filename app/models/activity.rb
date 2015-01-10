class Activity < ActiveRecord::Base
  has_many :entry

  def self.current_year_entries
  end
end
