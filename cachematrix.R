i## First check if MASS package is installed

if (!is.element('MASS', installed.packages()[,1])) 
{
    install.packages('MASS')
    }
    else
    {
        print ("MASS package already installed")
	}
	library(MASS)


## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
