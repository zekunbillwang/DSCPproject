rm(list=ls())
args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 2){
    filepath = args[1]
    X_mean = as.numeric(args[2])
} else {
cat('usage: Rscript singleR.R <RpackagesDir>\n', file=stderr())
stop()
}
X = scan(file=args[1])
X = as.numeric(X)
X = X - X_mean # mean(X) 
n = length(X)
output = numeric(length(X))
for (i in 0:(length(X)-1)) {
    output[i+1] = sum(X[1:(n-i)] * X[(i+1):n]) / (n-i)
    # print(sum(X[1:(n-i)] * X[(i+1):n]))
}
write(output, paste(filepath, ".txt", sep=""), sep="\n")