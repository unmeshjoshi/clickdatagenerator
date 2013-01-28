insert into click_data (id, date, hour, silo, partner, bucket, locationid, clicks)SELECT robotccs.id, robotccs.date, robotccs.hour, pgp_pub_encrypt(robotccs.silo, keys.pubkey) As silo, pgp_pub_encrypt(robotccs.partner, keys.pubkey) As partner,pgp_pub_encrypt(robotccs.bucket, keys.pubkey) As bucket, robotccs.locationid, pgp_pub_encrypt(robotccs.clicks, keys.pubkey) As clicks  FROM (VALUES ('id','0'),('date','2013-01-22'),('hour','7'),('silo','6848'),('partner','Expedia'),('bucket','2166'),('locationid','33817105'),('clicks','30'),) As robotccs(id, date, hour, silo, partner, bucket, clicks) CROSS JOIN (SELECT dearmor('-----BEGIN PGP PUBLIC KEY BLOCK----- Version: GnuPG v1.4.11 (GNU/Linux)mI0EUQQk0AEEAMV7FI5Kyis+AeBjJZaXu4S6ygfS1nh4hgU+u4Ss6ynQJ+TEltzt
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
=bTib-----END PGP PUBLIC KEY BLOCK-----') As pubkey) As keys;
