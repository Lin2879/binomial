% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bin.R
\name{bin_mode}
\alias{bin_mode}
\title{Calculate mode}
\usage{
bin_mode(trials, prob)
}
\arguments{
\item{trials}{integer the number of trials}

\item{prob}{the probability to success in each trials}
}
\value{
The mode of a binomial distribution
}
\description{
Computes the mode of a binomial distribution
}
\examples{
# Calculate the mode for 10 trials, each trial with
# independent probability 0.5
bin_mode(trials = 10, prob = 0.5)
}
