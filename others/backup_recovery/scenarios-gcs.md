# GCS Bucket Backup and Recovery Retension Policy Tests


##### create test bucket for simulating test scenarios

create new bucket "test1-hcahde040-prod-data" and new folders (test1 and test2) on GCP console.

Copy existing test1 and sub folders/files to a new bucket "test2"
```
gsutil cp -r gs://test1-hcahde040-prod-data/test1/* gs://test1-hcahde040-prod-data/test2/ --project=hcahde040-prod-data 
```

List bucket content
```
gsutil ls -r gs://test1-hcahde040-prod-data/

--below command with "-p" runs slow. Use above command without -p option
gsutil ls -p hcahde040-prod-data gs://test1-hcahde040-prod-data/ 
```



##### reference : 2.3 Setting a Retention Policy : 2.3.1 Setting a Retention Policy on a Bucket
https://hcahealthcare.sharepoint.com/:w:/r/sites/CORP-PublicCloudProgram/Shared%20Documents/08%20-%20Google%20Cloud%20Partners%20Data%20Foundations/HDE%20Backup%20and%20Restore/Deliverables/HCA%20HDE%20Backup%20%26%20Recovery%20Runbook.docx?d=w695dbe65191e40b69e10622fc886f0f3&csf=1&web=1&e=KeqLKh&nav=eyJoIjoiMTY5MTg4MDk1OSJ9


Run the following command to set a retention period on a specified Cloud Storage Bucket. 
```
gcloud storage buckets update gs://<BUCKET_NAME> <FLAG> 
```

##### reference: https://cloud.google.com/storage/docs/using-bucket-lock#command-line
FLAG is the desired setting for the bucket's retention period. Use one of the following formats: 
--retention-period and a retention period duration, if you want to add or change a retention policy. For example, --retention-period=1d (This sets the retention period for one day). 
--clear-retention-period, if you want to remove the retention policy on the bucket. 

### To check if a bucket has a retention policy: 
```
gcloud storage buckets describe gs://<BUCKET_NAME> --format="default(retention_policy)" --project=hcahde040-prod-data 
```

example
```
gcloud storage buckets describe gs://test1-hcahde040-prod-data/ --format="default(retention_policy)" --project=hcahde040-prod-data 
gcloud storage buckets describe gs://test-hcahde040-prod-data/ --format="default(retention_policy)" --project=hcahde040-prod-data 
```

## Locking a bucket is an <b>irreversible action</b>. Once bucket lock is enabled: https://cloud.google.com/storage/docs/bucket-lock#retention-periods
You cannot remove the retention policy from the bucket. 
You cannot decrease the retention period for the policy. 

example : sets retention-period to 1 day and half
```
gcloud storage buckets update gs://test1-hcahde040-prod-data/ -retention-period=1d43200s --project=hcahde040-prod-data
gcloud storage buckets update gs://test-hcahde040-prod-data/ --retention-period=1800s --project=hcahde040-prod-data
```
example : sets retention-period to 1800s (which is 30 min) and 1 day respectively
```
gcloud storage buckets update gs://test1-hcahde040-prod-data/ --retention-period=1800s --project=hcahde040-prod-data
gcloud storage buckets update gs://test1-hcahde040-prod-data/ --retention-period=1d --project=hcahde040-prod-data
```

## Lock a bucket
#### reference: https://cloud.google.com/storage/docs/using-bucket-lock#lock-bucket
### Use the gcloud storage buckets update command with the --lock-retention-period flag:
```
gcloud storage buckets update gs://BUCKET_NAME --lock-retention-period --project=hcahde040-prod-data
```

example
```
gcloud storage buckets update gs://test1-hcahde040-prod-data/ --lock-retention-period --project=hcahde040-prod-data
gcloud storage buckets update gs://test-hcahde040-prod-data/ --lock-retention-period --project=hcahde040-prod-data
```

### Use the gcloud storage buckets update command with the --clear-retention-period flag: If bucket is with --lock-retention-period then this --clear-retention-period can't be done until --retention-period met.
```
gcloud storage buckets update gs://BUCKET_NAME --clear-retention-period --project=hcahde040-prod-data
```
example
```
gcloud storage buckets update gs://test1-hcahde040-prod-data/ --clear-retention-period --project=hcahde040-prod-data
gcloud storage buckets update gs://test-hcahde040-prod-data/ --clear-retention-period --project=hcahde040-prod-data
```


================================================================================================================================
# GCS Lifecycle Configuration
#### Set the lifecycle configuration for a bucket = https://cloud.google.com/storage/docs/managing-lifecycles#command-line_1



================================================================================================================================
# GCS Bucket Backup and Recovery Delete Tests

##### reference : 2.7 GCS Buckets Deletion – F21, F23, F25 : 
https://hcahealthcare.sharepoint.com/:w:/r/sites/CORP-PublicCloudProgram/Shared%20Documents/08%20-%20Google%20Cloud%20Partners%20Data%20Foundations/HDE%20Backup%20and%20Restore/Deliverables/HCA%20HDE%20Test%20Plan%20and%20Execution%20Document.docx?d=wf4c8ffb98a394b9888cb4919f9ea59ee&csf=1&web=1&e=s6ufyF&nav=eyJoIjoiMTM5NTI4MjcyMSJ9

### Run the following command to try and delete the bucket.  
```
gcloud storage buckets delete gs://<BUCKET_NAME> --project=hcahde040-prod-data 
```

example 
```
gcloud storage buckets delete gs://test1-hcahde040-prod-data/ --project=hcahde040-prod-data 
gcloud storage buckets delete gs://test-hcahde040-prod-data/ --project=hcahde040-prod-data 
```

### Run the following command to try and delete all files in the bucket  
#### Run the following command to try and recursively delete all files in a bucket 
```
gcloud storage rm –recursive gs://test1-hcahde040-prod-data/ --project=hcahde040-prod-data 
gcloud storage rm –recursive gs://test-hcahde040-prod-data/test2/ --project=hcahde040-prod-data 
```

#### Run the following command to try and delete a specific object. 
```
gcloud storage rm gs://test1-hcahde040-prod-data/test1/ --project=hcahde040-prod-data 
gcloud storage rm –recursive gs://test-hcahde040-prod-data/test/ --project=hcahde040-prod-data 
```

#### Run the following command to try and delete multiple object including sub-folders.
```
gcloud storage rm -r gs://test1-hcahde040-prod-data/test1/ --project=hcahde040-prod-data 
```

