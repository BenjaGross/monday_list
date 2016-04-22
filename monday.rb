require 'date'

def list_mondays(n, day=Date.today)
  days_in_week = 7
  if day.wday == 1
    map_days(day, n)
  else 
    num = (days_in_week - (day.wday % days_in_week )) + 1
    map_days(day + num, n)
  end
end

def map_days(day, n)
  (0...n).map{ |i| (day + (i * 7)).strftime("%m/%d/%Y") }
end