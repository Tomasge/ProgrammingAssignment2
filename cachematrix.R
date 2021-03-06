#  
# PROGRAMMING ASSIGNMENT 2: LEXICAL SCOPING
# Created by TG May 2, 2017
# Last edited March 8, 2017
#######################################################################


# This function creates an R object that stores a Matrix and its inverse
makeCacheMatrix <- function(x = numeric()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setsolve <- function(solve) m <<- solve
      getsolve <- function() m
      list(set = set, get = get,
           setsolve =  setsolve,
           getsolve = getsolve)
}


# This function uses the argument returned from makeCacheMatrix to retrieve thr inverse matrix from the cached value 
cacheSolve <- function(x, ...) {
      m <- x$getsolve()
      if(!is.null(m)) {
            mesage("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setsolve(m)
      m
}

############ TO VERIFY USE THE CODE BELOW ##############
M <- matrix(1:4, nrow = 2, ncol = 2) # Creates an invertible matrix M. If using another matrix, make sure it's inevrtible
aMatrix <- makeCacheMatrix(M) # Input M to makeCacheMatrix function
aMatrix$get() # Retrieve the value of matrix
cacheSolve(aMatrix) # Get the inverse of M
invM <- aMatrix$getsolve() # Create inverse matrix of M from its CACHED value
M %*% invM # Multiply M by its inverse to get identity (note %*% is the operator to multiply matrices)


