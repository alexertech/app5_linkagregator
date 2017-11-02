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
type:int (1 hunter, 2 seeker)
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
