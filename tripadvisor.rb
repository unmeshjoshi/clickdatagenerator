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
                  ")) As robotccs(id, clickdate, hour, silo, partner, bucket, locationid, clicks)" +
                  " CROSS JOIN (SELECT dearmor('-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.12 (Darwin)

mQENBFEC7kQBCADh/4cNY+zPurURXpXKZdv58mkbTyZuhM4r85wERDBTHQ9xnMSm
oJLU+9k2NB3tWNNoN+cwbdCW97u1B5yVP3yD0lPMxbR32+U0Nttu2qqMiGGD91ag
0H4z6IlkFa2Ezzmw1JOU0vz001r2P9dAgvDG6aarnr954vY2aEYQTktIpgyG2stm
vDDcueK8ct5zW5w6lmko8qNZNxcpgT/n/Wrdd50yJ9vAum/ex8n0tQhSYXfPwW3e
zTCY4na3w/UmTQWALlpWTagzfhJcNQfc9kb7TiiDJmESL1YT5HKXu55U5cIPf+jC
PkTLTnYEsYpOM4IIcB7UdH2Acxzo+LhbSqUhABEBAAG0KUF2aW5hc2ggS3VtYXIg
PGF2aW5hc2hrQHRob3VnaHR3b3Jrcy5jb20+iQE4BBMBAgAiBQJRAu5EAhsDBgsJ
CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRAj4jN2AE6p8ej5B/9eCFXD33chDe0B
ZyuHqACrV0Nxt8iAwxCDtQroKP10IF73QPyi6b+5Yxv0I9XarD6lsW3BLDMImhvo
FBvp/zPMWpsjzaOua8WGi3WaflGFV/Dt508Pmgxwip62OBf/GiK5MEtIHoTntMW3
Wmp9NJEgdYITUbkzfn5Qs7Lszl6LhPeD/+i0G2t/mfZEJZZvrGkVFE6KUJPx/Elx
8453dm5m5fabhxzg4R8Y0y9a+3yKukAcIYLIxB7r6HOl2w10PeP4OeRKQTkvuCcz
ORWkMBX5JYjbGIomK9meVp+LuQ2Y6F+1hwpUlZmmcr7Dc6H9D3UFQVtWJqcOYDnb
Fy7oe7Z6uQENBFEC7kQBCADhyaQcaFinVIwKo3v0JJmCwnxTJ9cfHrwMo0HqueCI
tbO+BAOZNwVWzh5fQPa9f0RueXi6PeP91fgsccjj6hvjgWTKcq3SmYxJdeyR+apK
nRC2oGALO4nK3VTy2poTn4ug0PaXBUKsfe4jIJJHyOF6/NigN6N3z14vpUYBGqv7
hKATZSsnIE742N7pRqW/pxfWJvd84jQoPKkXi/55f553KpBakA8rfr6Gmne+xwvh
OMu7ZUZIxfgEAYPGgeGH6N4xkpw0XCAryD+vmiJS977gJQkpUV5HUyurQHgsWoha
edT/90rz3poWIN//84uHvJZBZN4PEQkDwea9zX8DEmATABEBAAGJAR8EGAECAAkF
AlEC7kQCGwwACgkQI+IzdgBOqfHNrAgAxzPk/zhWAQZvVZmL6Rc1M4j8Ir11h3uB
lbuvQemgon5XUonb2EIfod08dTBS+sLsNh6Q7iLKILGlCClSF/kt2npPA3LtT2TY
U9Wwq8R6wJtCI2mBFbHGrNB2+pIdnoFNcBcMk8HwifQW6iEPmq7ObaEaQ+/LOjCR
Ho4vTzAyXlQoLihxMFpFmWHa8hJEhczGB7y1Mn4YqeEv6bxlMQM3aNvJKO1mz2Pp
GnCOxehnbnXiUJ46y8Veu6aHAv/WVsYU08yt+FXjk1MlLWeCqyM4BgJFTiC2PrQM
R4htwuXlwZTo2O/BYctLOwKNFbpX0je6l/id1ZR2NmsnPT4WWHWgsw==
=lmAL
-----END PGP PUBLIC KEY BLOCK-----') As pubkey) As keys;" )

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

generate_records(million(1))





select_query = "SELECT pgp_pub_decrypt(partner, keys.privkey, 'password') As partnerdecrypt
FROM pageviews
CROSS JOIN
(SELECT dearmor('-----BEGIN PGP PRIVATE KEY BLOCK-----
Version: GnuPG v1.4.12 (Darwin)

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
=nY74
-----END PGP PRIVATE KEY BLOCK-----') As privkey) As keys
where clickdate::date <= '2013-01-12'::date AND  clickdate::date  >= '2013-01-01'::date";
