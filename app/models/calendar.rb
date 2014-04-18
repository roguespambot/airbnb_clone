class Calendar

  def self.find_start
    start = Date.today.at_beginning_of_month.wday
  end

  def self.find_end_day
    end_day = Date.today.at_end_of_month.day
  end

  def self.available(integer, property)
    check_date = Date.today.at_beginning_of_month + integer.days - Calendar.find_start.days - 1.day
    if property.check_date(check_date)
      true
    else
      false
    end
  end
end
