require 'date'
require 'pry'

def list_mondays(n, day=Date.today)
  if day.wday == 1
    map_days(day, n)
  else 
    next_monday = day + ((1 - day.wday) % 7)
    map_days(next_monday, n)
  end
end

def map_days(day, n)
  (0...n).map{ |i| (day + (i * 7)).strftime("%m/%d/%Y") }
end
