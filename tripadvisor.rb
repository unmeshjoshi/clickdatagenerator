require 'date'

def get_random(array)
  array[rand*array.length]
end

def get_random_number(number)
  ((rand*number).round)
end

def get_random_number_string_up_to(number)
  get_random_number(number).to_s
end

def hour
  get_random_number_string_up_to(24)
end

def solo
  get_random_number_string_up_to(10000)
end

def bucket
  get_random_number_string_up_to(10000)
end

def location_id
  get_random_number_string_up_to(100000000)
end

def no_of_clicks
  get_random_number_string_up_to(100)
end

def date_in_last_month()
  date = DateTime.now - get_random_number(30);
  date.strftime("%Y-%m-%d")
end

def open_file(file_name)
  File.new(file_name, "w")
  file = File.open(file_name, "w")
end

def generate_records(no_of_records)
  partners = %w(Marriott  Hotels  Room77  ORBITZ  Priceline  Booking  Expedia  Tingo)

  file = open_file("tripadvisor.sql")
  $i = 0
  while $i < no_of_records do
    partner = get_random partners
    date_in_last_month = date_in_last_month()
    file.puts("insert into click_data values("+$i.to_s+",'" + date_in_last_month +"',"+
                  hour()+ ",'"+
                  partner+"',"+
                  solo()+"," +
                  bucket()+","+
                  location_id()+","+
                  no_of_clicks() + ");")
    $i +=1
  end
  file.flush
end

def million(num)
  1000000 * num;
end

generate_records(million(3))




