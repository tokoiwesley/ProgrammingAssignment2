## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This function returns a list containing functions to
# Set a matrix, get the matrix, set the inverse and
# get the inverse.
makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y){
	x <<- y # using "<<-" to assign values to objects in a different
	m <<- NULL # environment from the current one
}
get <- function() x
setmatrix <- function(solve) m <<- solve
getmatrix <- function() m
list(set = set, get = get, setmatrix = setmatrix, getmatrix = getmatrix)
}


## Write a short comment describing this function

# This function returns the inverse of the matrix input
# to makeCacheMatrix()
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		
		m <- x$getmatrix()
		# If the inverse has already been calculated
		if(!is.null(m)){
		# get it from the cache and skip computation.
		message("getting cached data")
		return(m)
		}
	# Else, compute the inverse
	matrix <- x$get()
    m <- solve(matrix, ...)
    x$setmatrix(m)
    m
}

# Example:
#
# x = rbind(c(-2, 3), c(3,-4))
# > m = makeCacheMatrix(x)
# > m$get()
#     [,1] [,2]
# [1,]   -2    3
# [2,]    3   -4
# > cacheSolve(m) ## There's no cache in the first call
#      [,1] [,2]
# [1,]    4    3
# [2,]    3    2
# > cacheSolve(m) ## Retrieving from the cache in the second call
# getting cached data
#      [,1] [,2]
# [1,]    4    3
# [2,]    3    2
# > 
