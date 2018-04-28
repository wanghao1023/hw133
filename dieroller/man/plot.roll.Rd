\name{plot.roll}
\alias{plot.roll}
\title{
plot of object roll
}

\usage{
method{plot}{roll}{x, side=1, ...}
}

\arguments{
  \item{x}{
an object of class die
}
}
\details{
plot the relative frequency of a series of rolls
}

\examples{
die1 = die(
roll50 = roll(die1, 50)
plot(roll50)
)
}
