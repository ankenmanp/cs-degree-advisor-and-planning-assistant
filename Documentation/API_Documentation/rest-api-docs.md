FORMAT: 1A

# CS Advisory API
The CS Advisory API is a *curriculum advisory & planning* service.

# Group Courses
Courses related resources of the **CS Advisory API**

## Course [/api/v1/courses/{id}]
A single Course object.
The Course has the following attributes:
- id (number, 1) ... an unique identifier of the Course
- created_at (timestamp, "2015-03-14T22:45:33.099Z") ... an ISO8601 string ("YYYY-MM-DD HH:MM:SS.SSS")
- name (string, "Gumball Dropping") ... the name of the course
- subject (string, "HS") ... a description of the courses' subject matter
- call_number (number, 1050) ... the number defining the course section in a subject
- credit_hours (number, 3) ... the number of credit hours which are earned upon completion of the course
- description (string, "Willy Wonka-esque") ... a description of the course

The state *id* is assigned by the CS Advisory API at the moment of creation.

+ Model (application/json)

    JSON representation of Course Resource.

    + Body

            {
                "course": {
                    "call_number": 1050,
                    "created_at": "2015-04-06T23:55:43.074Z",
                    "credit_hours": 4,
                    "description": "This is the first course in the computer\nscience core sequence. Students will learn a modern programming language and the basic skills needed to analyze problems and construct programs for \ntheir solutions. The emphasis of the course is on the techniques of algorithm development, correctness, and programming style. Students are also \nintroduced to the fundamentals of software engineering and the software-development life cycle.",
                    "id": 1,
                    "name": "Computer Science 1",
                    "subject": "CS"
                }
            }


### Create a Course [POST]
+ Request (application/json)
        
        {
                    "call_number": 1050,
                    "created_at": "2015-04-06T23:55:43.074Z",
                    "credit_hours": 4,
                    "description": "This is the first course in the computer\nscience core sequence. Students will learn a modern programming language and the basic skills needed to analyze problems and construct programs for \ntheir solutions. The emphasis of the course is on the techniques of algorithm development, correctness, and programming style. Students are also \nintroduced to the fundamentals of software engineering and the software-development life cycle.",
                    "id": 1,
                    "name": "Computer Science 1",
                    "subject": "CS"
        }

+ Response 201
    [Course][]
    
+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }
        
### Retrieve a Single Course [GET]
+ Parameters
    + id (string) ... ID of the Course.
    
+ Response 200
    [Course][]

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Edit a Course [PUT]
+ Parameters
    + id (string) ... ID of the Course.
    
+ Request (application/json)

        { "description": "Control Structures through Data Structures" }
        
+ Response 200

        {
            "course": {
                "call_number": 1050,
                "created_at": "2015-04-06T23:55:43.074Z",
                "credit_hours": 4,
                "description": "Control Structures through Data Structures",
                "id": 1,
                "name": "Computer Science 1",
                "subject": "CS"
            }
        }

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Delete a Course [DELETE]
+ Parameters
    + id (string) ... ID of the Course.
    
+ Response 204

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }
        
## Courses Collection [/api/v1/courses]
A collection of all Course objects.
The Course collection resource **embeds** *Course Resources* attributes in the CS Advisory API.

### List all Courses [GET]
+ Response 200 (application/json)
    
            {
                "courses": [
                    {
                        "call_number": 1050,
                        "created_at": "2015-04-06T23:55:43.074Z",
                        "credit_hours": 4,
                        "description": "This is the first course in the computer\nscience core sequence. Students will learn a modern programming language and the basic skills needed to analyze problems and construct programs for \ntheir solutions. The emphasis of the course is on the techniques of algorithm development, correctness, and programming style. Students are also \nintroduced to the fundamentals of software engineering and the software-development life cycle.",
                        "id": 1,
                        "name": "Computer Science 1",
                        "subject": "CS"
                    },
                    {
                        "call_number": 2050,
                        "created_at": "2015-04-06T23:55:43.261Z",
                        "credit_hours": 4,
                        "description": "Description for CS 2050",
                        "id": 2,
                        "name": "Computer Science 2",
                        "subject": "CS"
                    },
                    {
                        "call_number": 4050,
                        "created_at": "2015-04-06T23:55:43.323Z",
                        "credit_hours": 4,
                        "description": "Description for CS 4050",
                        "id": 3,
                        "name": "Principles of Algorithms",
                        "subject": "CS"
                    }
                ]
            }

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }

# Group Course Plans
Course Plans (or Degree Plan) related resources of the **CS Advisory API**

## Course Plan [/api/v1/course_plans/{id}]
A single Course Plan object.
The Course Plan has the following attributes:
- id (number, 1) ... an unique identifier of the course plan
- created_at (timestamp, "2015-03-14T22:45:33.099Z") ... an ISO8601 string ("YYYY-MM-DD HH:MM:SS.SSS")
- student_id (number, 5) ... the id of the student owning this course plan

The state *id* is assigned by the CS Advisory API at the moment of creation.

+ Model (application/json)

    JSON representation of Course Plan Resource.

    + Body

            {
                "course_plan": {
                    "created_at": "2015-03-14T22:45:33.099Z",
                    "id": 5,
                    "student_id": 4
                }
            }


### Create a Course Plan [POST]
+ Request (application/json)
        
        {
                  "student_id": 5
        }

+ Response 201
    [Course Plan][]
    
+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }
        
### Retrieve a Single Course Plan [GET]
+ Parameters
    + id (string) ... ID of the Course Plan.
    
+ Response 200
    [Course Plan][]

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Edit a Course Plan [PUT]
+ Parameters
    + id (string) ... ID of the Course Plan.
    
+ Request (application/json)

        { "student_id": 6 }
        
+ Response 200
    [Course Plan][]

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Delete a Course Plan [DELETE]
+ Parameters
    + id (string) ... ID of the Course Plan.
    
+ Response 204

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }
        
## Course Plans Collection [/api/v1/course_plans]
A collection of all Course Plan objects.
The Course Plan collection resource **embeds** *Course Plan Resources* attributes in the CS Advisory API.

### List all Course Plans [GET]
+ Response 200 (application/json)
    
        {
            "course_plans": [
                {
                    "created_at": "2015-03-14T22:45:33.099Z",
                    "id": 5,
                    "student_id": 4
                },
                {
                    "created_at": "2015-03-23T15:48:20.608Z",
                    "id": 6,
                    "student_id": 4
                },
                {
                    "created_at": "2015-03-23T15:48:27.044Z",
                    "id": 7,
                    "student_id": 3
                }
            ]
        }


+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }
        
# Group Years
Years related resources of the **CS Advisory API**

## Year [/api/v1/years/{id}]
A single Year object.
The Year has the following attributes:
- id (number, 1) ... an unique identifier of the Year
- created_at (timestamp, "2015-03-14T22:45:33.099Z") ... an ISO8601 string ("YYYY-MM-DD HH:MM:SS.SSS")
- course_plan_id (number, 3) ... the id of the course plan which this year is a child of
- year (number, 2015) ... the year

The state *id* is assigned by the CS Advisory API at the moment of creation.

+ Model (application/json)

    JSON representation of Year Resource.

    + Body

            {
                "year": {
                    "course_plan_id": 1,
                    "created_at": "2015-04-14T05:49:52.739Z",
                    "id": 4,
                    "year": 2014
                }
            }


### Create a Year [POST]
+ Request (application/json)
        
        {
            "course_plan_id": 1,
            "created_at": "2015-04-14T05:49:52.739Z",
            "id": 4,
            "year": 2014
        }

+ Response 201
    [Year][]
    
+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }
        
### Retrieve a Single Year [GET]
+ Parameters
    + id (string) ... ID of the Year.
    
+ Response 200
    [Year][]

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Edit a Year [PUT]
+ Parameters
    + id (string) ... ID of the Year.
    
+ Request (application/json)

        { "year": 2015 }
        
+ Response 200

        {
            "year": {
                "course_plan_id": 1,
                "created_at": "2015-04-14T05:49:52.739Z",
                "id": 4,
                "year": 2015
            }
        }

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Delete a Year [DELETE]
+ Parameters
    + id (string) ... ID of the Year.
    
+ Response 204

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }
        
## Years Collection [/api/v1/years]
A collection of all Year objects.
The Year collection resource **embeds** *Year Resources* attributes in the CS Advisory API.

### List all Years [GET]
+ Response 200 (application/json)
    
        {
            "years": [
                {
                    "course_plan_id": 1,
                    "created_at": "2015-04-06T23:55:43.406Z",
                    "id": 1,
                    "year": 2015
                },
                {
                    "course_plan_id": 3,
                    "created_at": "2015-04-13T05:23:37.119Z",
                    "id": 3,
                    "year": 2015
                },
                {
                    "course_plan_id": 1,
                    "created_at": "2015-04-14T05:49:52.739Z",
                    "id": 4,
                    "year": 2014
                }
            ]
        }


+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }

# Group Semesters
Semesters related resources of the **CS Advisory API**

## Semester [/api/v1/semesters/{id}]
A single Semester object.
The Semester has the following attributes:
- id (number, 1) ... an unique identifier of the Semester
- created_at (timestamp, "2015-03-14T22:45:33.099Z") ... an ISO8601 string ("YYYY-MM-DD HH:MM:SS.SSS")
- year_id (number, 5) ... the id of the year owning this semester
- name (string, "Maymester") ... the name of this semester

The state *id* is assigned by the CS Advisory API at the moment of creation.

+ Model (application/json)

    JSON representation of Semester Resource.

    + Body

            {
                "semester": {
                    "created_at": "2015-03-14T22:45:33.099Z",
                    "id": 5,
                    "name": "Fall",
                    "year_id": 4
                }
            }


### Create a Semester [POST]
+ Request (application/json)
        
        {
                  "name": "Fall"
        }

+ Response 201
    [Semester][]
    
+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }
        
### Retrieve a Single Semester [GET]
+ Parameters
    + id (string) ... ID of the Semester.
    
+ Response 200
    [Semester][]

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Edit a Semester [PUT]
+ Parameters
    + id (string) ... ID of the Semester.
    
+ Request (application/json)

        { "name": "Spring" }
        
+ Response 200

        {
            "semester": {
                "created_at": "2015-03-14T22:45:33.099Z",
                "id": 5,
                "name": "Spring",
                "year_id": 4
            }
        }

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Delete a Semester [DELETE]
+ Parameters
    + id (string) ... ID of the Semester.
    
+ Response 204

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }
        
## Semesters Collection [/api/v1/semesters]
A collection of all Semester objects.
The Semester collection resource **embeds** *Semester Resources* attributes in the CS Advisory API.

### List all Semesters [GET]
+ Response 200 (application/json)
    
        {
            "semesters": [
                {
                    "created_at": "2015-03-14T22:45:33.099Z",
                    "id": 5,
                    "name": "Spring",
                    "year_id": 4
                },
                {
                    "created_at": "2015-03-15T12:35:37.099Z",
                    "id": 6,
                    "name": "Summer",
                    "year_id": 4
                },
                {
                    "created_at": "2015-04-11T17:21:32.099Z",
                    "id": 9,
                    "name": "Fall",
                    "year_id": 5
                }
            ]
        }


+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }

# Group Users
Users related resources of the **CS Advisory API**

## User [/api/v1/users/{id}]
A single User object. 
The User resource has the following attributes: 
- id (number, `1`) ... an unique identifier of the user
- first_name (string, `Bruce`) ... the first name of the user
- last_name (string, `Campbel`) ... the last name of the user
- email (string, `bruce.campbell@msudenver.edu`) ... the email of the user
- password (string, `givemesomesugarbaby`) ... the password of the user

The state *id* is assigned by the CS Advisory API at the moment of creation.
    
+ Model (application/json)

    JSON representation of User Resource.

    + Body
    
            {
                "user": {
                    "id": 1,
                    "created_at": "2015-03-14T22:38:33.486Z",
                    "email": "bruce.campbell@msudenver.edu",
                    "first_name": "Bruce",
                    "last_name": "Campbell"
                }
            }

### Create a User [POST]
+ Request (application/json)
        
        { "first_name": "Bruce", "last_name": "Campbell", "email": "bruce.campbell@msudenver.edu", "password": "shopsmart" }

+ Response 201
    [User][]

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Retrieve a Single User [GET]
+ Parameters
    + id (string) ... ID of the User.
    
+ Response 200
    [User][]

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Edit a User [PUT]
+ Parameters
    + id (string) ... ID of the User.
    
+ Request (application/json)


        { "email": "ash.williams@msudenver.edu" }
        
+ Response 200

        {
            "user": {
                "id": 1,
                "created_at": "2015-03-14T22:38:33.486Z",
                "email": "ash.williams@msudenver.edu",
                "first_name": "Bruce",
                "last_name": "Campbell"
            }
        }

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

### Delete a User [DELETE]
+ Parameters
    + id (string) ... ID of the User.
    
+ Response 204

+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 403 (application/json)

        { "error" : "Not found" }

+ Response 500 (application/json)

        { "error" : "Internal server error" }

## Users Collection [/api/v1/users]
A collection of all User objects.
The Users collection resource **embeds** *User Resources* attributes in the CS Advisory API.

### List all Users [GET]
+ Response 200 (application/json)
    
        {
            "users": [
                {
                    "id": 1,
                    "created_at": "2015-03-14T22:38:33.486Z",
                    "email": "bruce.campbell@msudenver.edu",
                    "first_name": "Bruce",
                    "last_name": "Campbell"
                },
                {
                    "created_at": "2015-03-14T22:38:33.486Z",
                    "email": "dark.helmet@msudenver.edu",
                    "first_name": "Dark",
                    "id": 2,
                    "last_name": "Helmet"
                },
                {
                    "created_at": "2015-03-25T14:11:17.682Z",
                    "email": "pres.skroob@msudenver.edu",
                    "first_name": "President",
                    "id": 3,
                    "last_name": "Skroob"
                },
            ]
        }


+ Response 400 (application/json)

        { "error" : "Bad request" }
    
+ Response 500 (application/json)

        { "error" : "Internal server error" }

