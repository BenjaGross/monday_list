require 'spec_helper'
require_relative '../monday'

describe 'Mondays' do 

  not_monday_start = Date.new(2016, 04, 22) 
  monday_start = Date.new(2016, 4, 25) 
  expected_day1 = Date.new(2016, 4, 25).strftime("%m/%d/%Y") 
  expected_day2 = Date.new(2016, 5, 2).strftime("%m/%d/%Y") 
  expected_day3 = Date.new(2016, 5, 9).strftime("%m/%d/%Y") 


  it 'lists the next n upcoming mondays from a given date' do 
    expect(list_mondays(3, not_monday_start)).to eq([expected_day1, expected_day2, expected_day3])
  end


  it 'includes that day if it is a monday' do 
    expect(list_mondays(3, monday_start)).to eq([expected_day1, expected_day2, expected_day3])
  end

  it 'uses the current date if no date is given' do 
    monday_dif = (7 - (Date.today.wday % 7 )) + 1
    monday1 = (Date.today + monday_dif)
    monday2 = (monday1 + 7)
    monday3 = (monday2 + 7)

    expect(list_mondays(3)).to eq([monday1.strftime("%m/%d/%Y"), monday2.strftime("%m/%d/%Y"), monday3.strftime("%m/%d/%Y")])
  end


end