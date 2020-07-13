# tidy

Test and train data are extracted for X,y, subject.

Features and subject labels are also read.
test and train data are merged using rbind.
From the merged data of X, values for mean and std are extracted by slicing.
subject, activity and x are merged using cbind.
Activities are labeled using the for loop and using which.

For tidy data, tapply is used to obtain the average for actiivites and subjects.
These data are merged to obtain the final data.
