#'@title Calculate combinations
#'@description Calculates the number of combinatons in which k successes can occur in n trials
#'@param n integer the number of trials
#'@param k integer(s) the number of successes
#'@return The number of combinatons in which k successes can occur in n trials
#'@export
#'@examples
#'# Calculate 5 choose 3
#'bin_choose(n = 3, k = 5)
#'
#'# Calculate 10 choose 0
#'bin_choose(n = 0, k = 10)
bin_choose <- function(n, k){
  det <- (k <= n)
  if (sum(as.integer(det)) - length(det) != 0){
    stop('k\'s value(s) should be less than or equal to n')
  }
  return(factorial(n) / (factorial(k) * factorial(n - k)))
}



#'@title Calculate choose probability
#'@description Calculates the probability of getting k successes in k trials
#'@param success integer(s) the number of successes
#'@param trials integer the number of trials
#'@param prob the probability to success in each trials
#'@return The probability of getting k successes in k trials
#'@export
#'@examples
#'# Calculate the probability of getting 3 success out of 5 trials, each trial with
#'# independent probability 0.5
#'bin_probability(success = 3, trials = 5, prob = 0.5)
#'
#'# Calculate the probability of getting 10 success out of 10 trials, each trial with
#'# independent probability 0.9
#'bin_probability(success = 10, trials = 10, prob = 0.9)
bin_probability <- function(success, trials, prob){
  check_prob(prob)
  check_trials(trials)
  check_success(success, trials)
  return(bin_choose(trials, success) * (prob ^ success) * ((1 - prob) ^ (trials - success)))
}



#'@title Calculate probability distribution
#'@description Calculates the distribution of the probability of getting possible number of success(es) in k trials
#'@param trials integer the number of trials
#'@param prob the probability to success in each trials
#'@return The probability of getting every possible number of success(es) in k trials
#'@export
#'@examples
#'# Calculate the probability of getting 0, 1, 2, 3 success out of 3 trials, each trial with
#'# independent probability 0.5
#'bin_distribution(trials = 3, prob = 0.5)
bin_distribution <- function(trials, prob){
  bin_probs <- bin_probability(0:trials, trials, prob)
  dat <- data.frame(success = 0:trials, probability = bin_probs)
  return(structure(dat, class = c('bindis', 'data.frame')))
}



#'@title Calculate cumulative probability distribution
#'@description Calculates the cumulative distribution of the probability of getting possible number of success(es) in k trials
#'@param trials integer the number of trials
#'@param prob the probability to success in each trials
#'@return The cummulative probability of getting every possible number of success(es) in k trials
#'@export
#'@examples
#'# Calculate the cumulative probability of getting 0, 1, 2, 3 success out of 3 trials, each trial with
#'# independent probability 0.5
#'bin_cumulative(trials = 3, prob = 0.5)
bin_cumulative <- function(trials, prob){
  bin_probs <- bin_probability(0:trials, trials, prob)
  cum <- c()
  for (i in 1:length(bin_probs)){
    cum <- c(cum, sum(bin_probs[1:i]))
  }
  dat <- data.frame(success = 0:trials, probability = bin_probs, cumulative = cum)
  return(structure(dat, class = c('bincum', 'data.frame')))
}



#'@title Create a binomial variable
#'@description Creates an object of class \code{'binvar'}
#'@param trials integer the number of trials
#'@param prob the probability to success in each trials
#'@return an object of class \code{'binvar'}
#'@export
#'@examples
#'# A bin variable with 10 trials and success rate 0.5
#'bin_variable(trials = 10, prob = 0.5)
bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(structure(list(trials = trials, prob = prob), class = 'binvar'))
}



#'@title Calculate mean
#'@description Computes the expected mean of a binomial distribution
#'@param trials integer the number of trials
#'@param prob the probability to success in each trials
#'@return The expected mean of the binomial distribution
#'@export
#'@examples
#'# Calculate the expected mean for 10 trials, each trial with
#'# independent probability 0.5
#'bin_mean(trials = 10, prob = 0.5)
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}



#'@title Calculate variance
#'@description Computes the variance of a binomial distribution
#'@param trials integer the number of trials
#'@param prob the probability to success in each trials
#'@return The variance of the binomial distribution
#'@export
#'@examples
#'# Calculate the variance for 10 trials, each trial with
#'# independent probability 0.5
#'bin_variance(trials = 10, prob = 0.5)
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}



#'@title Calculate mode
#'@description Computes the mode of a binomial distribution
#'@param trials integer the number of trials
#'@param prob the probability to success in each trials
#'@return The mode of a binomial distribution
#'@export
#'@examples
#'# Calculate the mode for 10 trials, each trial with
#'# independent probability 0.5
#'bin_mode(trials = 10, prob = 0.5)
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}



#'@title Calculate skewness
#'@description Computes the skewness of a binomial distribution
#'@param trials integer the number of trials
#'@param prob the probability to success in each trials
#'@return The skewness of a binomial distribution
#'@export
#'@examples
#'# Calculate the skewness for 10 trials, each trial with
#'# independent probability 0.5
#'bin_skewness(trials = 10, prob = 0.5)
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}



#'@title Calculate kurtosis
#'@description Computes the kurtosis of a binomial distribution
#'@param trials integer the number of trials
#'@param prob the probability to success in each trials
#'@return The kurtosis of a binomial distribution
#'@export
#'@examples
#'# Calculate the kurtosis for 10 trials, each trial with
#'# independent probability 0.5
#'bin_kurtosis(trials = 10, prob = 0.5)
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
