\name{die}
\alias{die}
\title{generating die }
\description{creating a die with given name of sides and given probability of each side. The default sides are 1,2,3,4,5,6 and probabilities
}
\usage{die(sides = c(1, 2, 3, 4, 5, 6), prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6))}
\arguments{
  \item{sides}{vector of die sides}
  \item{prob}{vector of probability of each sides
}

}
\examples{
default=die()
die1=die(sides=c(1,2,3,4,a,b), prob=c(0.2,0.1,0.2,0.2,0.1,0.2))
die2=die(sides=c(i,ii,iii,iv,v,vi), prob=c(0.3,0,0.3,0,0.3,0.1))
}
