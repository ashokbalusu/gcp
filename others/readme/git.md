
git reflog
git stash list

--https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/remove-revert-discard-local-uncommitted-changes-Git-how-to

--do some changes to files, then give git stash push command to stash them
git stash push -m “Give a reasonable description about this Stash changes for future reference”

git stash list
--now to pull those changes back, use a reg expression with comment exactly similar to above for example.
git stash apply stash^(/ Give a reasonable description about this Stash changes for future reference)

--other way of getting those stash changes back is by using first “stash list” and then “stash pop #” this number (#) is from stash list index starting with 1 at top to bottom. So if we want to bring 4th stash commit then use stash pop 4

git stash pop 4

----------
Merge vs Rebase

Main Branch    - M1 M2 M3
Feature Branch -       M2 F1 F2

--below command will not commit. It just keeps (before merging) last commit of Feature branch with of F2 will be added to Main branch last commit M3 and then will be ready for last commit.
git merge --squash feature

--to commit this above --squash , then use git commit -m “comment” like
git commit -m “feature and main branch merged”

so above git commit will show like this below with git log, that means all Feature branch commits will be combined with last commit after --squash.
git log

feature and main branch merged
M3
M2
M1

--------------
--https://www.youtube.com/watch?v=AnNWEVCxzUU
--Just to rollback last local commit, then use below command. Be careful with this reset with HARD, since RESET HARD will delete the local changes and also corresponding files related to that reset changes.
git reset --hard HEAD~1

--if it is required to rollback more than one last local commit, then increase last number to that number of rollback
git reset --hard HEAD~2

--if we want to keep changes, but not last commit then use below RESET with hard
git reset HEAD~1


--https://www.youtube.com/watch?v=Q1kHG842HoI
git log --all --graph

----------------



# HDE Tag Creation Steps


Open Jupyter Notebook in dev environment dev-intake project. Open Terminal. Run below commands to create tag in 010 based on 040 tag:

/home/jupyter# cd hcahde040-pipeline-config/
/home/jupyter/hcahde040-pipeline-config# git tag
/home/jupyter/hcahde040-pipeline-config# git checkout main
/home/jupyter/hcahde040-pipeline-config# git pull
/home/jupyter/hcahde040-pipeline-config# git tag hca-hde1.7-v3.1.3
/home/jupyter/hcahde040-pipeline-config# git push origin hca-hde1.7-v3.1.3
/home/jupyter/hcahde040-pipeline-config# git branch
/home/jupyter/hcahde040-pipeline-config# git tag
/home/jupyter/hcahde040-pipeline-config# git status
/home/jupyter/hcahde040-pipeline-config# git checkout hca-hde1.6-v3.1.2
/home/jupyter/hcahde040-pipeline-config# ls
/home/jupyter/hcahde040-pipeline-config# git remote -v
/home/jupyter/hcahde040-pipeline-config# git remote add origin010 https://source.developers.google.com/p/hcahde010-csr/r/hcahde010-pipeline-config
/home/jupyter/hcahde040-pipeline-config# git push origin010 hca-hde1.6-v3.1.2



To delete a tag:
Reference: https://stackoverflow.com/questions/5480258/how-can-i-delete-a-remote-tag
$ git status
root@458f50d9e1a4:/home/jupyter/hcahde040-pipeline-config# git checkout upgrade1_7
$ git branch
$ git tag
root@458f50d9e1a4:/home/jupyter/hcahde040-pipeline-config# git tag --delete hca-hde1.7-v3.1.4
root@458f50d9e1a4:/home/jupyter/hcahde040-pipeline-config# git push --delete origin hca-hde1.7-v3.1.4





cd terraform/synth/data_harmonization
terraform -version
terraform init
terraform state list
terraform state list | grep streaming
terraform state rm <reconciliation pipeline resource>
terraform state rm <source1/harmonization pipeline resource>

After deleting above pipelines, then run tf-plan or tf-apply.


## below from HDE Platform team doc
-- Push New Tag.docx at Team OneDrive > Data Engineering > Runbooks
-- https://hcahealthcare.sharepoint.com/:w:/r/sites/CORP-data-engineering/hdePlatform/_layouts/15/Doc.aspx?sourcedoc=%7B8018AE6D-E6AF-486E-8B0A-FFA18B604AF4%7D&file=Push%20New%20Tag.docx&action=default&mobileredirect=true

Creating a New Tag in CSR Repo 

 

Notebook Location: hcahde040-pipeline-config/testing/notebooks/Synth/Purge_Sync_Replay_commands.ipynb 

 

Confirm with the mapping team that the code on the main branch of the <prefix>-pipeline-config repository is ready to be pushed to the <prefix>-csr project. 

Once the code on the main branch of the <prefix>-pipeline-config repository is ready, push a new git tag. 
Open a DEV notebook in VertexAI in the dev-intake project. 
Open a terminal in JupyterLab 
Change directories into the <prefix>-pipeline-config repository 

git checkout main 

Pull the latest changes 
git pull 

Resolve any git conflicts before continuing 

Create a new tag 
git tag <NEW TAG NAME> 

Push the new tag to CSR 
git push origin <NEW TAG NAME> 

 

 