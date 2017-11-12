# Jobs Board

### Goal

- CRUD for jobs and users
- A user can login / logout
- A user can be of type 0: admin, 1: hunter or 2: seeker
- Only a hunter can create / edit jobs offers
- Only a seeker can apply and send data for a job offer
- Only an admin can edit the jobs and the users
- Non registered users only can see the job listing
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

**Jobs**
```
name : string
summary : string
user : references
```

**Applications**
```
jobs : references
user : references
```

# Building

We need first to create the users, sessions and loging process. Then we can create a scaffold for the jobs, using the current_user helper in the application as the reference for saving. Finally when a user is logged as seeker, he can see a link to "Apply for the Offer" which will create the relations between the jobs and the users.

The user type will define the views of the application.


# Aplication Flow

**Non registered user**
 
 Home > Jobs Listing

**Hunter user**

 Home > Login > Jobs Listing > Create / Edit Job > See applications > Edit Profile 

**Seeker user**
 
 Home > Login > Jobs Listing > Apply for job > Edit profile

# Work In progress

* Better navigation menu for public / registered / admin users

* Non-admin users can have a profile option

* The profile edit / show options should be separated from the user controller
 
* 