## Put comments here that give an overall description of what your
## functions do
The makeCacheMatrix is a special function storing an invertible matrix, and caches its inverse.
The function 'cachesolve' calculates the inverse of the special matrix created with the 'makeCacheMatrix' function. 
Therefore, whevener the inverse of the same invertible matrix stored in the makeCacheMatrix is required, it is not 
computed again but rather looked up in the cache. This saves time when working with large datasets especially when
the same inverse needs to used often.

## Write a short comment describing this function

The makeCacheMatrix is storing an invertible matrix, x, which is set as the function,y. The inverse, Inv is initially set to NULL, as a 
place holder for the inverse later. Get returns the function x. setsolve the sets the inverse (Inv) of the matrix.And getInv returns this
inverse. The list(set = set, get = get,setsolve = setsolve,getsolve = getsolve) returns the 'special matrix' containing all the defined functions.

makeCacheMatrix <- function(x = matrix()) {
  Inv <- NULL
  set <- function(y) {
    x <<- y
    Inv <<- NULL
  }
  get <- function()x
  setsolve <- function(solve) Inv <<- solve
  getsolve <- function()Inv
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function
When the inverse of the stored matrix x is asked, the cacheSolve function checks to see if it has been calculated.
If its calculated, it returns the cached data, return(Inv), which is the inverse of the matrix (Inv).

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  Inv <- x$getsolve()
  if(!is.null(Inv)) {
    message("getting cached data")
    return(Inv)
    
  }
  data <- x$get()
  Inv <- solve(data, ...)
  x$setsolve(Inv)
  Inv
}
