require 'spec_helper'
require_relative '../day_lister'

describe 'Day_lister' do 

  context 'when day to list is Monday' do
    not_monday_start = Date.new(2016, 04, 22) 
    monday_start = Date.new(2016, 4, 25) 
    sunday_start = Date.new(2016, 4, 24)
    expected_day1 = Date.new(2016, 4, 25).strftime("%m/%d/%Y") 
    expected_day2 = Date.new(2016, 5, 2).strftime("%m/%d/%Y") 
    expected_day3 = Date.new(2016, 5, 9).strftime("%m/%d/%Y") 


    it 'lists the next n upcoming mondays from a given date' do 
      expect(list_days(n: 3, start_date: not_monday_start)).to eq([expected_day1, expected_day2, expected_day3])
    end

    it 'lists the next n upcoming mondays when the given date is a Sunday' do 
      expect(list_days(n: 3, start_date:sunday_start)).to eq([expected_day1, expected_day2, expected_day3])
    end


    it 'includes that day if it is a monday' do 
      expect(list_days(n: 3, start_date:monday_start)).to eq([expected_day1, expected_day2, expected_day3])
    end

    it 'uses the current date if no date is given' do 
      monday1 = Date.today + ((1 - Date.today.wday) % 7)
      monday2 = monday1 + 7
      monday3 = monday2 + 7

      expect(list_days(n: 3)).to eq([monday1.strftime("%m/%d/%Y"), monday2.strftime("%m/%d/%Y"), monday3.strftime("%m/%d/%Y")])
    end
  end

  context 'When the day to list is not Monday' do 
    not_monday_start = Date.new(2016, 04, 22) 
    thursday_start = Date.new(2016, 4, 28) 
    expected_day1 = Date.new(2016, 4, 28).strftime("%m/%d/%Y") 
    expected_day2 = Date.new(2016, 5, 5).strftime("%m/%d/%Y") 
    expected_day3 = Date.new(2016, 5, 12).strftime("%m/%d/%Y") 

    it 'lists the next n upcoming Thursdays from a given start date' do 
      expect(list_days(n: 3, day: 'Thursday', start_date: not_monday_start)). to eq([expected_day1, expected_day2, expected_day3])
    end


    it 'uses the current date if no date is given' do 
      thursday1 = Date.today + ((4 - Date.today.wday) % 7)
      thursday2 = thursday1 + 7
      thursday3 = thursday2 + 7

      expect(list_days(n: 3, day: 'Thursday')).to eq([thursday1.strftime("%m/%d/%Y"), thursday2.strftime("%m/%d/%Y"), thursday3.strftime("%m/%d/%Y")])
    end

  end
end