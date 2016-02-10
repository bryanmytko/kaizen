class Entry < ActiveRecord::Base
  belongs_to :activity

  validates :activity,
    presence: true

  scope :this_year, -> { where(created_at: (Date.today - 1.year)..Date.today) }
end
