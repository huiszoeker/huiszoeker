openssl aes-256-cbc -d -in clientsecret.json.enc -out clientsecret.json -k ${SECRET_KEY}
gcloud auth activate-service-account bq-serviceaccount@funda-195021.iam.gserviceaccount.com --key-file clientsecret.json

bq load --autodetect --source_format=NEWLINE_DELIMITED_JSON funda.test ../funda/koop_utrecht_houses.json