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
                  " CROSS JOIN (SELECT dearmor('-----BEGIN PGP PUBLIC KEY BLOCK----- \n" +
                  "Version: GnuPG v1.4.11 (GNU/Linux) \n\n" +

"mQENBFEGSTUBCAClyR//8WYCfmG1MfBPV1lLsClq3nBQZDlZk/LJY+BBs538j2kL
Ew+2YCcn8DwdXepFN5WMSDytLwBB7bKZxzIap7lQAVgqY/KJRB9edjrq89s6JC3a
emj0M2fgE0Qvli1xbgjR+Lf4053L9xrMIuhGDn+v0MtYYSezk8JfLObNIKIDmgrh
9v5wT/0hETjs74cHdCRLqRBVEH8HJOKKIFyOXkVNN8vgRXabXfvpqqn9luLj6hIf
QeRuyTiHS/5lPIztJGp1/0ARBMTxWwHyeJ4bawAvg2RVCA4+epzjKw8ZlKqgN2qf
SB+Zp9jGnPRhUYV+ed1NTAhRMExgL3ank/pDABEBAAG0BWFkbWluiQE4BBMBAgAi
BQJRBkk1AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBqeVh5z0aPlEE5
B/9G8r8mOVdXx0FbdXc1VUZiXHx5NLaK4rIkdHsW/VY0lERYjQd4l+YW9898KXrz
548gi6atuKyC2Dm1Lccc02dBhjrYmWwjO/xMpQLZ2eqp4KmXsP/ZpdrcJZU1IpXI
vIRE4Aga0SaLdj3S3TnVKSdeCxVh+LRHDTLkP1HRhe3X82kGeTEB1uh7cq2yZD6D
2NnrYrDzvbs4JmcQW6I1fT25Rcml7TADuTLDAy0GVRYQgu+sm8SISGNo9FiACloL
UE5SP1+dPyLPiS+ZwYZburkKq2S7F3b9ECR8Wtroosm0XF49JNiwArBB8XNM+MNj
ygoYzn6wk1/Vq3ZreMzIK3p9uQENBFEGSTUBCACmQtsY8C4zwbMGNHlpseZGktOT
dJEgEg1bOxW0MpUxFROcgVJcf+elesbNm4FWHYobO7t6rafeGB6yG1kRnIKLIyt8
AyFn90ssHXR51ryux3VEicftxt+6MZ5kq4suaUbG9AVnPkyKapv2FGel3OY6Q7VD
dp3NcLBWIKr7Xo2GJVq8D6llYHpMGx3nH7ajpaz2GvABM7JH/FC7mNfZew3XFgXa
2nZjD2v4Sf0cfg0Yy22vByJcwA+6/W36h+sByR2kiUAuKvbA6ewfYh2Ezch8CDk/
16X8lKpkwWb2TJjFkfzc2G4iZM/UhLAJYVCMkmW80IntFt7AKdSDby88tVAJABEB
AAGJAR8EGAECAAkFAlEGSTUCGwwACgkQanlYec9Gj5TAXAf/SLJ+PZRyKcBX+z1L
MkUEXAvHhPZztEELW7SZ9HdYQZPu5+RVzFQtG/k/dMC3AyafGSrVjD0V3CQjzi+9
xtVeuPOO7TmsrAuQhhhMWoSgKPLZaNU3TCthDwd3uaqG/NKIAr12mX1pG6j7hZN2
kwHH0VVoyhDZTrGQs4UwJyulrG1JqKpg0j1QdD90L83q/81PsQajt2upPHf3pBds
a9z/BVfb4pwXDN5sOpgjEXdZhzxTHf0CDpNBUsx3Hqo598zPwYZToF/CR6qorlYQ
IFoRMle3aivpwXFYvRIBFohr1UoNvfKtc7RWa3RHTFNMJMk0bbWAbZimGEExlnbH
NwrEaw==\n
=hLlu" +
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





select_query = "SELECT pgp_pub_decrypt(partner, keys.privkey) As partnerdecrypt
FROM pageviews
CROSS JOIN
(SELECT dearmor('Version: GnuPG v1.4.11 (GNU/Linux)

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
=m+E1
-----END PGP PRIVATE KEY BLOCK-----') As privkey) As keys";
