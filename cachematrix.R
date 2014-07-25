## Put comments here that give an overall description of what your
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  InvMat <- NULL
  set <- function(y) {
    x <<- y
    InvMat <<- NULL
  }
  get <- function() x
  setInverse <- function(mat) InvMat <<- mat
  getInverse <- function() InvMat
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  InvMat <- x$getInverse()
  if(!is.null(InvMat)) {
    message("getting inverse matrix")
    return(InvMat)
  }
  mat1 <- x$get()
  InvMat <- solve(mat1, ...)
  x$setInverse(InvMat)
  InvMat
}
