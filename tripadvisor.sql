insert into pageviews (id, clickdate, hour, silo, partner, bucket, locationid, clicks)SELECT robotccs.id, robotccs.clickdate, robotccs.hour, pgp_pub_encrypt(robotccs.silo, keys.pubkey) As silo, pgp_pub_encrypt(robotccs.partner, keys.pubkey) As partner,pgp_pub_encrypt(robotccs.bucket, keys.pubkey) As bucket, robotccs.locationid, pgp_pub_encrypt(robotccs.clicks, keys.pubkey) As clicks  FROM (VALUES (0,'2013-01-11','10','1548','Marriott','4675','41428213','10')) As robotccs(id, clickdate, hour, silo, partner, bucket, locationid, clicks) CROSS JOIN (SELECT dearmor('-----BEGIN PGP PUBLIC KEY BLOCK----- 
Version: GnuPG v1.4.11 (GNU/Linux) 

mQENBFEGSTUBCAClyR//8WYCfmG1MfBPV1lLsClq3nBQZDlZk/LJY+BBs538j2kL
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
NwrEaw==

=hLlu
-----END PGP PUBLIC KEY BLOCK-----') As pubkey) As keys;
