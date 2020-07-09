require "csv"
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone_numbers(phone_number)
  case phone_number
  when phone_number.length < 10
    nil
  when phone_number.length == 10
    phone_number
  when phone_number.length == 11
    if phone_number.at(0) == '1'
      phone_number[0] = " "; phone_number.strip
    else
      nil
    end
  else
    nil
  end
end

def legislators_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officals
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter
p erb_template
lines = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
numbers = {}

lines.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  p row[:homephone]
  p row[:homephone].match(/^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/)[0]
  p clean_phone_numbers(row[:homephone].strip) #Hash ids to phone nums
=begin
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  save_thank_you_letter(id, form_letter)
=end
end

numbers.each do |k,v|
  p "#{k}, #{v}"
end
