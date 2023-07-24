install.packages("ElemStatLearn")
# if this install.packages("ElemStatLearn") code does not work, download the zip
# file of package from the following link
# https://cran.r-project.org/src/contrib/Archive/ElemStatLearn/
# then click packages in the right below corner and then click install
# choose install from package archive file and choose the zip file by the browse option
# then click install
install.packages("class")

library(ElemStatLearn)
require(class)
x <- mixture.example$x
g <- mixture.example$y
xnew <- mixture.example$xnew
mod15 <- knn(x, xnew, g, k=15, prob=TRUE)
prob <- attr(mod15, "prob")
prob <- ifelse(mod15=="1", prob, 1-prob) # if class =1 return the prob of 1, if class=0 calculate the prob of class 1
px1 <- mixture.example$px1
px2 <- mixture.example$px2
prob15 <- matrix(prob, length(px1), length(px2)) #matrix(vector, nrows,ncolumns). Take the first "nrows" numbers of elements as the first column.
#haha=c(1:6)
#matrix(haha, 3,2)
#matrix(haha, 2,3)
par(mar=rep(2,4))
contour(px1, px2, prob15, levels=0.5, labels="", xlab="", ylab="", main=
          "15-nearest neighbour", axes=FALSE)
points(x, col=ifelse(g==1, "coral", "cornflowerblue"))
gd <- expand.grid(x=px1, y=px2)
#get smaller grids
points(gd, pch=".", cex=1.2, col=ifelse(prob15>0.5, "coral", "cornflowerblue"))
box()
