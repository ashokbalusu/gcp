
Cloud shell
sudo apt install ncdu

ncdu
[disk utilities, for each directory (win dirs. in windows). Find which file and folders are eatingup all spaces]

Terraform architecture of HDE – 

# Steps for SHARED HDE code upgrade 
##### /Documents/Projects/hde/docs/VPCSC Setup_SecondaryInstance.docx
'''
Word doc prepared with error details during this deployment.
This doc is located at /Documents/Projects/hde/docs/VPCSC Setup_SecondaryInstance.docx
'''

--open GCP cloud shell
```
cd ~
mkdir t1test2_v1.7
cd t1test2_v1.7
```

--clone repository
```
gcloud source repos clone hcahde010 --project=hcahde010-devops
cd hcahde010
```

--checkout SHARED branch
```
git checkout shared
git pull
git log
git status
```

--get HDE new version of code with git remote based on https://cloud.google.com/healthcare-data-engine/docs/upgrade#upgrade_the_shared_environment
--rename "central" to hde-central-upgradev17
sample from above HDE doc link = 
git remote add central https://source.developers.google.com/p/hdc-artifacts/r/hdc-deployment
```
git remote add hde-central-upgradev17 https://source.developers.google.com/p/hdc-artifacts/r/hdc-deployment

git remote -v
git checkout shared
git fetch --tags hde-central-upgradev17
```
if above is not working then try with -f flag to force-update:
```
# git fetch --tags hde-central-upgradev17 -f
```

--check if the latest HDE version code tag available
```
git tag
```

--merge version tag to the SHARED branch
```
git merge v1.7.0 --allow-unrelated-histories
```

--resolve all merge conflicts in Open Terminal
-- -- by adding custom HDE changes
-- -- by adding new HDE Google features

```
git status
rm -rf terraform
```

```
export GIT_ROOT=$PWD 
export ENGINE_CONFIG=$GIT_ROOT/main.hcl 
export OUTPUT_PATH=$GIT_ROOT/terraform/ 
```

```
tfengine --config_path=$ENGINE_CONFIG --output_path=$OUTPUT_PATH
```

```
git status 

git add .
```

### do NOT do below command. (Only for testing merge --continue flag)
    ```
    --git merge --continue
    -- on Mac - Control + X
    ```

    The output is similar to the following: --this is reference from above Google HDE doc upgrade link
    [main 46eb992] Merge tag 'v1.7'

### Continue from here
```
git log
```

### do this ONLY if above merge --continue flag tested. (Only for testing)
    --if this log is not looking good then use below command to rollback last commit
    ```
    git reset HEAD~1
    ```

### In case to rollback PUSH commit on GitHub
    --if the code push to remote GitHub, then use this method to undo server/remote commit on GitHub @ https://stackoverflow.com/questions/22682870/how-can-i-undo-pushed-commits-using-git
    ```
    --In the server, move the cursor back to the last known good commit:
    --git push -f origin <last_known_good_commit>:<branch_name>
    --Locally, do the same:
    --git reset --hard <last_known_good_commit>
    --#         ^^^^^^
    --#         optional

    --See a full example on a branch my_new_branch that I created for this purpose:
    $ git branch
    my_new_branch

    --This is the recent history after adding some stuff to myfile.py:
    --I want to get rid of the last commit, which was already pushed, so I run:
    $ git push -f origin b4zad078237fa48746a4feb6517fa409f6bf238e:my_new_branch
    --Total 0 (delta 0), reused 0 (delta 0)
    --To git@github.com:me/myrepo.git
    -- + 80143bc...b4zad07 b4zad078237fa48746a4feb6517fa409f6bf238e -> my_new_branch (forced update)

    --Nice! Now I see the file that was changed on that commit (myfile.py) shows in "not staged for commit":
    $ git status
    --On branch my_new_branch
    --Your branch is up-to-date with 'origin/my_new_branch'.

    --Since I don't want these changes, I just move the cursor back locally as well:
    $ git reset --hard b4zad078237fa48746a4feb6517fa409f6bf238e
    --HEAD is now at b4zad07 Initial commit

    --So now HEAD is in the previous commit, both in local and remote:
    $ git log

    --git reset HEAD~ Will reset the last commit locally without getting rid of your changes 
    ```



### Continue from here

```
git add .
```

--now add commit message
```
git commit -m "Shared HDE code upgraded with new HDE v1.7 code"
```

--Validate any final changes
```
git push
```



# Steps for Dev HDE code upgrade

--change directory to current hcahde010 folder
```
cd hcahde010
```

--checkout DEV branch
```
git status
git branch

git checkout dev
git pull
git log
git status
```

--now merge dev code with (already merged w/ v1.7) SHARED code
```
git merge shared
```

## Do this if FEATURE branch last commit (of multiple feature commits) required to be merged with MAIN branch
    --squash              create a single commit instead of doing a merge
    ```
    git merge --squash shared

    git merge --squash dev
    git merge --squash synth
    git merge --squash stage
    ```

--resolve all merge conflicts in Open Terminal
-- -- by adding custom HDE changes
-- -- by adding new HDE Google features

```
git status
rm -rf terraform
```

```
export GIT_ROOT=$PWD 
export ENGINE_CONFIG=$GIT_ROOT/main.hcl 
export OUTPUT_PATH=$GIT_ROOT/terraform/ 
```

```
tfengine --config_path=$ENGINE_CONFIG --output_path=$OUTPUT_PATH
```

```
git status 

git add .
```

--now add commit message
```
--DEV
git commit -m "Dev HDE code upgraded with new HDE v1.7 code"

--SYNTH
git commit -m "Synth HDE code upgraded with new HDE v1.7 code"

--STAGE
git commit -m "Stage HDE code upgraded with new HDE v1.7 code"

--PROD
git commit -m "Prod HDE code upgraded with new HDE v1.7 code"
```

--Validate any final changes
```
git push
```







Merging Shared and Dev by sitting in Dev branch
git diff  shared dev
in dev with git status
git merge shared

rm -rf terraform

git status

generate terraform folder

git add terraform
git status
git diff --staged
git commit -m “merging shared to dev to synch branches”
git push

ls -ltr

terraform show google_service_account.jupyter_sa
terraform state show google_service_account.jupyter_sa
terraform apply -target google_service_account.function_runner
terraform apply -target google_service_account.dataflow_runner
terraform apply -target google_service_account.jupyter_sa


------ synth
Git Checkout synth



Terraform apply -target google_service_account.function_runner




Terraform init
Terraform state list
Terraform state show | grep mllp
Terraform state rm module.mllp_cluster.google_container_cluster.primary

Don’t touch all to destroy in data_

