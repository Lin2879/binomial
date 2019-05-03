#Function check_prob
#Usage checks if a given prob is a valid value
#Input double/float prob
#Output TRUE if prob is between 0 and 1, error message if not
check_prob <- function(prob){
  if (length(prob) != 1){
    stop('invalid prob value, prob should not be a vector')
  }
  if (prob >= 0 & prob <= 1){
    return(TRUE)
  }
  stop('invalid prob value, prob should be a number between 0 and 1')
}


#Function check_trials
#Usage checks if a given trials' number is a valid value
#Input integer trials
#Output TRUE if trials is a non-negative integer, error message if
#trials is not an integer or negative
check_trials <- function(trials){
  if (trials >= 0 & trials - as.integer(trials) == 0){
    return(TRUE)
  }
  else if (trials - as.integer(trials) != 0){
    stop('invaild trials value, trials should be a non-negative integer')
  }
  stop('invalid trials value, trials should be non-negative')
}


#Function check_success
#Usage checks if a given vector success is vaild for the given trials' number
#Input integer(s) success, integer trials
#Output TRUE if success is(are) non-negative integer(s), error message
#if success is not an integer or negative, or its length exceeds trials
check_success <- function(success, trials){
  for (i in 1:length(success)){
    if (success[i] - as.integer(success[i]) != 0){
      stop('invalid success value, success should be non-negative integer(s)')
    }
    else if (success[i] > trials){
      stop('invalid success value, the number of values in success should be less than or equal to trials')
    }
    else if (success[i] < 0){
      stop('invalid success value, success should be non-negative')
    }
  }
  return(TRUE)
}


