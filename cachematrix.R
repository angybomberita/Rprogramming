######################################################################
## Put comments here that give an overall description of what your
## functions do

#I used the same structure of the "Vector example" to create a function 
#that creates an inverse matrix. This function is stored in cache
######################################################################




######################################################################
## Write a short comment describing this function

#1. makeCachematrix creates a function that ask for a matrix. 
#2. This function is stored in a global enviroment (y, invert)
#3. Inside the function, the script processes trough get, inverse
makeCacheMatrix <- function(x = matrix()) {
        invert <- NULL
        set <- function(y) {
                x <<- y
                invert <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) invert <<- inverse
        getInverse <- function() invert
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

######################################################################




#####################################################################
## Write a short comment describing this function

#Basically, this script uses makecachematrix to show the solution
cacheSolve <- function(x, ...) {
        invert <- x$getInverse()
        if (!is.null(invert)) {
                return(invert)
        }
        mat <- x$get()
        invert <- solve(mat, ...)
        x$setInverse(invert)
        invert
}



#####################################################################
########################CASE EXAMPLE################################
b<-matrix(c(1,5,7,5,6,7,8,9,2), nrow=3, ncol=3)
b
a<-makeCacheMatrix(b)
a$get()
a$getInverse()
cacheSolve(a)
