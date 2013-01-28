columns = []
File.open("hourly_data_columns.txt", "r").each_line do |line|
 columns << line.strip
end

column_data = {}
File.open("hourly_data.txt", "r").each_line.with_index do |line, index|
  puts line.split.length
  column_data[index] = line.split(' ')
end

dataFile = File.open("data.csv", "w");
dataFile.puts(columns.join(","))

column_data.each_key do |key|
  data = column_data[key]
  dataFile.puts(data.join())
end
