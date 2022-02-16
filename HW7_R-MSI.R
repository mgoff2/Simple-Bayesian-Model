library(R2WinBUGS)
library(coda)

setwd("C:/Users/goffm/OneDrive/Documents/Epidemiology/Z-Fall 2021/Bayesian Methods")
#This makes a vector from the data set. 

Y=scan("hw7Data.txt")
N <- length(Y)
data=list("N", "Y")


inits=function(){
  list(mu=0)
}

Q2.sim=bugs(data, inits, model.file="hw7.bug",
              parameters=c("mu"),
              n.chains=1, # n.iter=2000, n.burnin=floor(n.iter/2),
              working.directory=getwd(),
              bugs.directory=("C:/Program Files/winbugs14_full_patched/WinBUGS14/"),
              debug=TRUE) 


#trace plot
par(mfrow=c(1,2))
plot(norm.sim$sims.matrix[,1], xlab=expression(mu), type="l")
plot(norm.sim$sims.matrix[,2], xlab=expression(sigma2), type="l")


#posterior summary
print(Q2.sim)

par(mfrow=c(1,2))
hist(norm.sim$sims.matrix[,1], xlab=expression(mu), main="Histogram", freq=FALSE)
hist(norm.sim$sims.matrix[,2], xlab=expression(sigma^2), main="Histogram", freq=FALSE)
