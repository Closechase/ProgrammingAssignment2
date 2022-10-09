# calculates the inverse of a matrix object and stores the inverse
cacheSolve <- function(x, ...){  # x is a matrix object which isinput
  inv <- x$getinverse()
  if(!is.null(inv)){
         message("getting cached data")   #prints a message on the console
         return(inv)
    
  }
  data <- x$get()    # get function gets the object initialised by the makeCacheMatrix call and stores it in data           
  inv <- solve(data, ...)  # solve gets the inverse of the data
  x$setinverse(inv)        # after computing the inverse we store it in inv and the matrix object is referenced to put inverse in setinverse function in makeCacheMatrix
  inv
  
}
#contains 4 functions which are later converted into a list which can be accessed
makeCacheMatrix <- function( x = numeric()){  # input is data object
  inv <- NULL   #set inverse inv to null
  set <- function(y){   # set the matrix as input by user, inverse is still null
    x <<- y
    inv <<- NULL
  }
  get <- function() x   # get function prints the value 
  setinverse <- function(inv2) inv <<- inv2 # sets the value of inv after mean is computed by cacheSolve     
  getinverse <- function() inv   # gets the inverse of the matrix
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse
  )
  
}

a<- makeCacheMatrix(matrix(c(-3,4,2,5), nrow =2, byrow = TRUE))

#implementing the functions
#outputs have been table in the Output.md file in this repo
print(a$get())
print(a$getinverse())
print(cacheSolve(a))
print(a$getinverse())
b<- makeCacheMatrix(matrix(c(4, -2, 1, 5, 0, 3, -1, 2, 6), nrow =3, byrow = TRUE))
print(b$get())
print(cacheSolve(a))
print(cacheSolve(b))
print(cacheSolve(b))
print(b$getinverse())
