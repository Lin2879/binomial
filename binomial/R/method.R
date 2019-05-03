#'@export
plot.bindis <- function(obj, ...){
  barplot(height = obj$probability,
          names.arg = obj$success,
          xlab = 'successes',
          ylab = 'probability')
}



#'@export
plot.bincum <- function(obj, ...){
  plot(x = obj$success,
       y = obj$cumulative,
       type = 'b',
       xlab = 'successes',
       ylab = 'probability')
}



#'@export
print.binvar <- function(obj, ...){
  print('Binomial variable')
  print('')
  print('Parameters')
  print(paste0('- number of trials: ', obj$trials))
  print(paste0('- prob of success : ', obj$prob))
}



#'@export
summary.binvar <- function(obj, ...){
  trial <- obj$trials
  prob <- obj$prob
  mean <- aux_mean(trial, prob)
  variance <- aux_variance(trial, prob)
  mode <- aux_mode(trial, prob)
  skewness <- aux_skewness(trial, prob)
  kurtosis <- aux_kurtosis(trial, prob)
  return(structure(list(trials = trial,
              prob = prob,
              mean = mean,
              variance = variance,
              mode = mode,
              skewness = skewness,
              kurtosis = kurtosis), class = 'summary.binvar'))
}



#'@export
print.summary.binvar <- function(obj, ...){
  print('Summary Binomial')
  print('')
  print('Parameters')
  print(paste0('- number of trials: ', obj$trial))
  print(paste0('- prob of success : ', obj$prob))
  print('')
  print('Measures')
  print(paste0('- mean    : ', obj$mean))
  print(paste0('- variance: ', obj$variance))
  print(paste0('- mode    : ', obj$mode))
  print(paste0('- skewness: ', obj$skewness))
  print(paste0('- kurtosis: ', obj$kurtosis))
}
