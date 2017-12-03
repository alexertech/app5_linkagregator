# User Profiles

### Goal

- CRUD for users
- A user can login / logout
- A user can be of type 0: admin, 1: hunter or 2: seeker
- Only an admin can edit the jobs and the users
- Non registered can only access the public info and sign up option
- All non-admin users have a simple profile page
- User passwords are encrypted

## Model

**User**
```
name : string
email : string
pass_salt : string
pass_hash : string
usertype : integer (0 admin, 1 hunter, 2 seeker)
```

# Building

Create the users, sessions and loging process. The user type will define the views of the application.

# Work In progress

* Better navigation menu for public / registered / admin users

* Non-admin users can have a profile option

* The profile edit / show options should be separated from the user controller
 
* 