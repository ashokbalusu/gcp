!curl -s -X GET \
-H "Authorization: Bearer $(gcloud auth application-default print-access-token)" \
-H "Content-Type: application/json; charset=utf-8" \
'https://healthcare.googleapis.com/v1/projects/hcahde040-synth-data/locations/us/datasets/healthcare-dataset/hl7V2Stores/synth-source/messages?view=FULL'
