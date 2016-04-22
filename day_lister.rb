require 'date'

def list_days(n: 3, day: 'Monday', start_date: Date.today)
  day = Date.parse(day).wday
  next_monday = start_date + ((day - start_date.wday) % 7)
  map_days(next_monday, n)

end

def map_days(day, n)
  (0...n).map{ |i| (day + (i * 7)).strftime("%m/%d/%Y") }
end
