#Title aux_means
#Description computes the expected mean of a binomial distribution, the value is np
#Input integer trails, double/float prob
#Return the expected mean
aux_mean <- function(trails, prob){
  return(trails * prob)
}


#Title aux_variance
#Description computes the variance of a binomial distribution, the value is np(1-p)
#Input integer trails, double/float prob
#Return the expected variance
aux_variance <- function(trails, prob){
  return(trails * prob * (1 - prob))
}


#Title aux_mode
#Description computes the mode of a binomial distribution, the value is the largest number less than np+p
#Input integer trails, double/float prob
#Return a unique mode if np+p is not an integer, two modes if it np+p is an integer
aux_mode <- function(trails, prob){
  m <- trails * prob + prob
  if (m - as.integer(m) == 0){
    return(c(m, m - 1))
  }
  return(floor(m))
}


#Title aux_skewness
#Description computes the skewness of a binomial distribution, the value is (1-2p)/the standard deviation
#Input integer trails, double/float prob
#Return the skewness value
aux_skewness <- function(trails, prob){
  sd <- sqrt(trails * prob * (1 - prob))
  return((1 - 2 * prob) / sd)
}


#Title aux_kurtosis
#Description computes the kurtosis of a binomial distribution, the value is (1-6p(1-p))/the variance
#Input integer trails, double/float prob
#Return the kurtosis value
aux_kurtosis <- function(trails, prob){
  var <- trails * prob * (1 - prob)
  return((1 - 6 * prob * (1 - prob)) / var)
}
