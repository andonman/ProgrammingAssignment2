## First check if MASS package is installed

if (!is.element('MASS', installed.packages()[,1])) 
{
    install.packages('MASS')
}
else
{
    print ("MASS package already installed")
}
library(MASS)

## Below are two functions that are used to create a special object that stores
## a numeric matrix and cache it's inverse

# For example the following code sets matrix c,
# c=rbind(c(1, -1/4), c(-1/4, 1)) 
# And x<-  makeCacheMatrix(c) to init the object list
# After this, the call to solve the matrix, gives 
# the inverse of the original c matrix
# cacheSolve(x) , calculates the inverse matrix of c
# If it is called again, inverse is get from the cache


## The first function, makeCacheMatrix creates a list containing a function to
## - set the values from input matrix
## - get the values of currently stored matrix
## - set the values of the inverse matrix
## - get the values of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setinv <- function(ginv) inverse <<- ginv
    getinv <- function() inverse
    list(set = set, get = get, 
         setinv = setinv,
         getinv = getinv)
    
}


## The following function calculates the inverse of
## the matrix, stored in the list that is created
## with the above function
## However, it first checks to see if the inverse has 
## already been calculated. If so, it gets the inverse 
## from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix
## and sets the value of the inverse in the cache 
## via the setinv function.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    inverse <- x$getinv()
    if (!is.null(inverse)) {
        message("getting cached data")
        return (inverse)
    }
    data <- x$get()
    inverse <- ginv(data, ...)
    x$setinv(inverse)
    inverse
}

