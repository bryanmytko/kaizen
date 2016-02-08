module ActivitiesHelper
  DAY_SLICES = 7

  def date_range
    (start_date..end_date)
  end

  private

  def start_date
    Date.today - 1.year
  end

  def end_date
    Date.today
  end
end
