class Activity < ActiveRecord::Base
  has_many :entries,
    dependent: :destroy

  validates :title, :description,
    presence: true

  scope :this_year, -> do
    where(created_at: (Date.today - 1.year)..Date.today)
  end
end
