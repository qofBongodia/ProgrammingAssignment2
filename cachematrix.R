## function to cache the inverse of a matrix.
## 

## below function creates a special "matrix", which returns a list containing a function to 
## 1. set the value of the vector;
## 2. get the value of the vector;
## 3. set the value of the inverse;
## 4. get the value of the inverse;

makeCacheMatrix <- function(x = matrix()) {
  a <- NULL
  set <- function(b) {
    x <<- b
    a <<- NULL
  }
  
  get <- function() x
  
  setsolve <-function(inverse) a <<- inverse
  getsolve <- function() a
 
  list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
  
 
}


## the following function calculates the inverse of the matrix.
## it first checks to see if the inverse has already been calculated.
## if so, it gets the result from the cache and skips the computation.
## otherwise, it calculates the inverse of the data and sets the value of 
## the inverse of the matrix in the cache via the setsolve function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  a <-x$getsolve()
  if(!is.null(a)){
    message("getting cached data")
    return(a)
  }
  data <-x$get()
  a <-solve(data,...)
  x$setsolve(a)
  a
  
}
