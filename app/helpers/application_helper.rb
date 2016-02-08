module ApplicationHelper
  def start_date
    Date.today - 1.year
  end

  def end_date
    Date.today
  end
end
