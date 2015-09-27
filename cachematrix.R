## Put comments here that give an overall description of what your
## functions do

## The main purpose of these two functions is to save time on matirx inversion as it is time taking compution for large matrix.
## It is useful if we just store matirx inversion so that we do not calcualte it again and again for same matirx.
## This exmaple is also helpful in understanding how variables are stored in environment. 
## << assignement variable is global asignment varibale. It creates object above the scope of current fuunction at environement level.

## makeCacheMatrix has four functions, set, get, setinverse and getinverse. It has matrix as input argument.
## set function -- it stores input into x and assigns matrix inversion as NULL since the matix has changed.
## get function -- it retuns matrix x 
## setinverse function  -- it assigns/sets inversion of matrix into mat.
## getinverse function --  it returns the stored inversion of matirx in mat.
## list stores all the above function and returns required value when refered like x$get or x$getinverse

makeCacheMatrix <- function(x = matrix()) {

mat <- NULL
      set <- function(y) {
            x <<- y
            mat <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) mat <<- solve
      getinverse <- function() mat
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## cachesolve does matirx inversion of the input matrix, if it has already been done then retrive the inverted matrix if the matirx has not changed.
## If matrix inversion has not been done it calculates inverted matirx stores it via setinverse function and stores in object mat in makeCacheMatrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

 mat <- x$getinverse()
      if(!is.null(mat)) {
            message("getting cached data")
            return(mat)
      }
      data <- x$get()
      mat <- solve(data, ...)
      x$setinverse(mat)
      mat

}
