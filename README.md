# Jobs Board

### Goal

- CRUD for jobs and users
- A user can login / logout
- A user can be of type hunter or seeker
- Only a hunter user can create / edit jobs offers
- Only a seeker can apply and send data for a job offer
- Non registered users only can see the job listing.

## Model

**User**
```
name:string
email:string
password:string
usertype:int (0 admin, 1 hunter, 2 seeker)
```

**Jobs**
```
name:string
summary:string
user:references
```

**Applications**
```
jobs:references
user:references
```

# Building

We need first to create the users, sessions and loging process. Then we can create a scaffold for the jobs, using the current_user helper in the application as the reference for saving. Finally when a user is logged as seeker, he can see a link to "Apply for the Offer" which will create the relations between the jobs and the users.

The user type will define the views of the application.


# Next Steps

* Better navigation menu for public / registered / admin users

* Comment the code of the whole auth system

* Allow to a normal user only access the edit option (profile?)