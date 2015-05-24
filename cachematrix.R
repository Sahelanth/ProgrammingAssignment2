##These two functions allow you to cache and retrieve a value for the inverse of a matrix.

## This function lets you cache a value for an inverse matrix and retrieve that value

makeCacheMatrix <- function(x = matrix()) { ##put a matrix in
  m <- NULL
  set <- function(y) {
    x <<- y  	##lets you cache a matrix you feed in
    m <<- NULL
  }
  get <- function() x	##returns the matrix you set
  setsolve <- function(solve) m <<- solve	##lets you cache a value of the inverse matrix
  getsolve <- function() m		##lets you retrieve that value
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function returns a cached value if there is one, and takes the inverse of the matrix if not


cacheSolve <- function(x = matrix(), ...) {
  m <- x$getsolve()
  if(!is.null(m)) {  ##checks whether there's already a cached value for the inverse matrix
    message("getting cached data")
    return(m)	##if so, returns the cached value
  }
  data <- x$get()
  m <- solve(data)	##if not, calculates the inverse of the matrix you feed in
  x$setsolve(m)
  m
}
