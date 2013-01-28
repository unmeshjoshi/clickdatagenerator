require 'date'

def generate_records(no_of_records)
  partners = %w(Marriott  Hotels  Room77  ORBITZ  Priceline  Booking  Expedia  Tingo)

  file = open_file("tripadvisor.sql")
  $i = 0
  while $i < no_of_records do
    partner = get_random partners
    date_in_last_month = date_in_last_month()
    file.puts("insert into pageviews (id, clickdate, hour, silo, partner, bucket, locationid, clicks)" +
                  "SELECT robotccs.id, robotccs.clickdate, robotccs.hour, pgp_pub_encrypt(robotccs.silo, keys.pubkey) As silo," +
                  " pgp_pub_encrypt(robotccs.partner, keys.pubkey) As partner," +
                 "pgp_pub_encrypt(robotccs.bucket, keys.pubkey) As bucket, robotccs.locationid, pgp_pub_encrypt(robotccs.clicks, keys.pubkey) As clicks " +
                " FROM (VALUES (" + $i.to_s + "," + "'" + date_in_last_month + "'," + "'" + hour + "','" + solo + "'," +
                  "'" + partner + "'," +
                  "'" + bucket + "'," +
                  "'" + location_id + "'," +
                  "'" + no_of_clicks + "'" +
                  ") As robotccs(id, clickdate, hour, silo, partner, bucket, locationid, clicks)" +
                  " CROSS JOIN (SELECT dearmor('-----BEGIN PGP PUBLIC KEY BLOCK----- \n" +
                  "Version: GnuPG v1.4.11 (GNU/Linux) \n" +

"mI0EUQQk0AEEAMV7FI5Kyis+AeBjJZaXu4S6ygfS1nh4hgU+u4Ss6ynQJ+TEltzt
+dt0pPCcVOJg94gIRhiaQrf0dR4ffXQU5tihNs38xo6UCd9U4MLSKjQHUwasw622
u+AGPou+8YVe/XM3DB0KwPJMrddcZOEfCMOh+bqqY/jn3EybVmpVzCyDABEBAAG0
BWFkbWluiLgEEwECACIFAlEEJNACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheA
AAoJEFImWgW/ZBF0ttsD/3L1bmGu46jSDUFEWpI7lCLg6tRKD3kC0ziy9jYJbDf2
aPZKLCEvaAGDH0bS776/PrvYu92zO4xK5Tc+rjHsCa5ji2t4mIgVRYeO5j7kA8SJ
JiXcwk4RfL3Qzi3G0aBYDo1CSXDz3S7mTgMnq7rLlzqHfFj8a/vIf6IIaCltvQJ7
uI0EUQQk0AEEAMOEzhaPsI6zH1hEvRq1+D/hF96l3mlllFYh2PmGp2XbQ2cHFo72
sli5PexRYhrFxyyjOYxFW0BzCUYWdUzZMo/tgK4koEMQCzJZ67lKVDReX63pI748
YkrrWUA/TrJaekleaApUUJ8s9J8jmLIsvQAUpt3Xj7NqFAHQfShsnPpdABEBAAGI
nwQYAQIACQUCUQQk0AIbDAAKCRBSJloFv2QRdKLCA/0crZkKfercjKwI7rJCeShP
gaEF+I+3nFmV4grR/unEmDr2xWwHbP1oq/5jR6Fr3t6oZVuk4ngDxLTHwf4la9I0
CQdgnq4W88bSA/zeqYXu7nPhVvqPOTwp24/cdJrI23DnYP7WOqXz253OPY+ZmPeb
H4m1LxWRbNkPRWLe2kv3cw==
=bTib" +
          "\n-----END PGP PUBLIC KEY BLOCK-----') As pubkey) As keys;" )

    $i +=1
  end
  file.flush
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


def get_random(array)
  array[rand*array.length]
end

def get_random_number(number)
  ((rand*number).round)
end

def get_random_number_string_up_to(number)
  get_random_number(number).to_s
end

def million(num)
  1000000 * num;
end

generate_records(1)




