class Activity < ActiveRecord::Base
  has_many :entries

  def self.current_year_entries
  end
end
