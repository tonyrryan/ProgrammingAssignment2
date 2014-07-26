## These functions can create a matrix like object that stores the matrix, 
## stores the inverse matrix, and also has functions to calculate the inverse
## and return the two matrices.

## The makeCacheMatrix function creates a matrix like object and also contains functions to 
## set the matrix contents, return the matrix contents and do the same for the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  InvMat <- NULL                              ## initialize the inverse matrix to NULL
  
  set <- function(y) {                        ## set the matrix contents to new values passed in
    x <<- y
    InvMat <<- NULL                           ## when to matrix values change, reset the inverse matrix to NULL
  }
  
  get <- function() {
    x                                         ## return the contents of the stored matrix
  }
  
  setInverse <- function(mat) {               ## store the inverse matrix, called from cacheSolve function
    InvMat <<- mat
  }
  
  getInverse <- function() {
    InvMat                                    ## return the contents of the inverse matrix
  }
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)  
}


## The cache solve function calls the R function solve() to get the inverse of a matrix

cacheSolve <- function(x, ...) {
  ## If the inverse matrix already exists from a previous call to this function,
  ## return the existing matrix instead of doing the calculations again
  InvMat <- x$getInverse()
  if(!is.null(InvMat)) {
    message("getting inverse matrix")
    return(InvMat)
  }
  
  ## If the inverse matrix does not exist yet, ...
  mat1 <- x$get()                             ## get the stored matrix
  InvMat <- solve(mat1, ...)                  ## call the R fucntion to get the inverse matrix
  x$setInverse(InvMat)                        ## store the inverse matrix
  InvMat                                      ## return the inverse matrix
}
