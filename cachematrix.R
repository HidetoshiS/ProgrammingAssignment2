## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL  # initialization
  set <- function(y) { # Set a matrix and initialoze s. (s:inversion matrix)
    x <<- y
    s <<- NULL
  }
  get <- function() x  # Print a set matrix
  setsolve <- function(solve) s <<- solve  # Set a inversion matrix
  getsolve <- function() s                 # Print a inversion matrix
  list(set = set, get = get,               # Return (List format)
       setsolve = setsolve,
       getsolve = getsolve)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()  # Get the inversion matrix
  if(!is.null(s)) {  # If s is not initial, then print s without calculating
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)  # Calculate a inversion matrix
  x$setsolve(s)          # Set the inversion matrix
  s
}
