# File permissions in Linux

### Project description
In this scenario, you must examine and manage the permissions on the files in the **/home/researcher2/projects** directory for the *researcher2* user.

The *researcher2* user is part of the **research_team** group.

You must check the permissions for all files in the directory, including any hidden files, to make sure that permissions align with the authorization that should be given. When it doesn't, you must change the permissions.

Here’s how you’ll do this task: First, you’ll check the user and group permissions for all files in the projects directory. Next, you’ll check whether any files have incorrect permissions and change the permissions as needed. Finally, you’ll check the permissions of the **/home/researcher2/projects/drafts** directory and modify these permissions to remove any unauthorized access.

<small> Note: The lab starts with your user account, called researcher2, already logged in to the Bash shell. This means you can start with the tasks as soon as you click the Start Lab button. </small>

### Check files and directory details
Commands used and output recieved when checking file and directory details, including hidden files and directories.

```
researcher2@e29bab91a89a:~/projects$ ls -a -l

total 32
drwxr-xr-x 3 researcher2 research_team 4096 Feb  7 02:11 .
drwxr-xr-x 3 researcher2 research_team 4096 Feb  7 02:38 ..
-rw--w---- 1 researcher2 research_team   46 Feb  7 02:11 .project_x.txt
drwx--x--- 2 researcher2 research_team 4096 Feb  7 02:11 drafts
-rw-rw-rw- 1 researcher2 research_team   46 Feb  7 02:11 project_k.txt
-rw-r----- 1 researcher2 research_team   46 Feb  7 02:11 project_m.txt
-rw-r--r-x 1 researcher2 research_team   46 Feb  7 02:11 project_r.txt
-rw-rw-r-- 1 researcher2 research_team   46 Feb  7 02:11 project_t.txt
```

### Describe the permissions string
**Project R**'s permission string is as follows:

```
-rw-r--r-x
```
The first character is blank ("-"), therefore it's not a directory: it's a file.
The following 3 characters are "rw-" which means the user (researcher2) has read and write permissions but no executing permission.
The next 3 characters are "r--", which means the group (research_team) only has reading permissions.
The last 3 characters are "r-x" which means that the *other* group has read and execute permissions.

<br>

### Change file permissions
In order to change Project R's permissions so that no one but user *researcher2* has execute permissions and that User and Group can write and read while Other can only read I would use the following command:
```
chmod u=rwx,g+w,o-x project_r.txt
```

<br>

### Change file permissions on a hidden file
In order to change Project X's permissions so that: no one can write on it, the user can read and execute, the group can only read and any other has no permissions:

```
researcher2@e29bab91a89a:~/projects$ chmod u=rx,g=r,o-rwx .project_x.txt
```

**⚠️ WARNING: in order to run this command the file name needs to have a . at the begining**