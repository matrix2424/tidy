# tidy

Test and train data are extracted for X,y, subject.

Features and subject labels are also read.
Test and train data are merged using rbind.
From the merged data of X, values for mean and std are extracted using grep.
Subject, activity and x are merged using cbind.
Activities are labeled using the for loop and using which.

For tidy data, aggreagate function is used to obtain the average for each variable by activites and subjects.
The final data is sorted by subject and activity.
