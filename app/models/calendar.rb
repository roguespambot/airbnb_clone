class Calendar

  def self.month_name(number)
    (Date.today + number.months).strftime("%B")
  end

  def self.find_start(number)
    start = (Date.today + number.months).at_beginning_of_month.wday
  end

  def self.find_end_day(number)
    end_day = (Date.today + number.months).at_end_of_month.day
  end

  def self.available(integer, property, number)
    check_date = (Date.today + number.months).at_beginning_of_month + integer.days - Calendar.find_start(number).days - 1.day
    if property.check_date(check_date)
      true
    else
      false
    end
  end
end
