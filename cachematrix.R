## This function creates a "matrix" object that can cache its inverse.

## The function, makeCacheMatrix creates a list containing a function to:
## -set the value of the matrix
## -get the value of the matrix
## -set the value of the inverse
## -get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m<- NULL
  set <- function(y){
    x<<- y
    m<<- NULL
    
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse 
  getinverse <- function() m
  list(set=set, get= get,
       setinverse = setinverse,
       getinverse = getinverse
       )
  

}

## The function calculates the inverse of the "matrix"
## which created with the makeCacheMatrix function above.
## However, if the inverse has already been calculated,
## it should gets the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)){
          message("getting cached data")
          return(m)
  }
  data <- x$get()
  m<- solve(data, ...)
  x$setinverse(m)
  m
}
