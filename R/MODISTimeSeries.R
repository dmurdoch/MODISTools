MODISTimeSeries <-
function(Dir, Band)
{
  # Look in Dir, find all ASCII files containing timeseries data for Band and concatenate them into a 
  # matrix, each column representing a new location (file) and each row a new date in the timseries.
  if(!file.exists(Dir)){
    stop("Character string input for Dir argument does not resemble an existing file path.")
  }
  
  file.set <- list.files(Dir, ".asc")
  file.set <- fileset[grepl(file.set, Band)]
  if(length(file.set) < 1){
    stop("No downloaded files found in the requested directory for the requested data band.")
  }
  
  data.collector <- list(length=length(file.set))
  nrow.recorder <- ncol.recorder <- numeric(length=length(file.set))
  for(i in 1:length(file.set)){
    data.file <- read.csv(file.set[i])
    # Check the timeseries length matches those already entered into the matrix.
    if((ncol(data.file) - 1) != nrow(res)){
      stop("Not all timeseries match in length")
    }
    data.collector[[i]] <- data.file[ ,2:ncol(data.file)]
    nrow.recorder[i] <- nrow(data.file[ ,2:ncol(data.file)])
    ncol.recorder[i] <- ncol(data.file[ ,2:ncol(data.file)])
  }
  
  res <- matrix(nrow=max(nrow.recorder), ncol=sum(ncol.recorder))
  for(j in 1:length(data.collector)){
    res[1:nrow(data.collector[[i]]),1:ncol(data.collector[[i]])] <- data.collector[[i]]
  }
  return(res)
}