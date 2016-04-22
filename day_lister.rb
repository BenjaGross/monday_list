require 'date'

def list_days(n: 3, day: 'Monday', start_date: Date.today)
  day = Date.parse(day).wday
  if start_date.wday == 1
    map_days(start_date, n)
  else 
    next_monday = start_date + ((day - start_date.wday) % 7)
    map_days(next_monday, n)
  end
end

def map_days(day, n)
  (0...n).map{ |i| (day + (i * 7)).strftime("%m/%d/%Y") }
end




def foo(args={})
  args[:fruit]    ||= 'apple'
  args[:cut]      ||= 'sliced'
  args[:topping]  ||= 'ice cream'
  # some logic here
end
