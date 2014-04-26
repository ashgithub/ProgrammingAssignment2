## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


## The first function, `makeCacheMatrix` creates a special "Matrix", which is
## really a list containing a function to
## 
## 1.  set the value of the Matrix
## 2.  get the value of the Matrix
## 3.  set the value of the inverse
## 4.  get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <-function (y) {
		x <<- y
		i <<- NULL
	}

	get <- function () x

	setinverse <- function (inverse) i <<- inverse

	getinverse <- function () i

	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## Write a short comment describing this function

## The following function calculates the inverse of the special "matrix"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse of
## the data and sets the value of the inverse in the cache via the `setinverse`
## function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    i <- x$getinverse()
    if(!is.null(i)){
    	message("getting the cahced inverse")
    	return(i)
    }

    # inverse is not cached
    i <- solve(x$get())

    #cache it
    x$setinverse(i)

    return(i)
}
