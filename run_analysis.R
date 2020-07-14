xt = read.table('X_test.txt')
xtr= read.table('X_train.txt')
x= rbind(xtr,xt)

yt= read.table('y_test.txt')
ytr=read.table('y_train.txt')
y= rbind(ytr, yt)

f= read.table('features.txt')
f1= t(f[,2])

st= read.table('subject_test.txt')
str= read.table('subject_train.txt')
s= rbind( str, st)

library(dplyr)

v = grep('mean|std',f1)
x= x[,v]
var= f1[v]
names(x)=var

df=cbind(s,y,x)
names(df)[1:2]=c('Subject','Activity')
df=df[order(df$Subject,df$Activity),]

a= read.table('activity_labels.txt', stringsAsFactors = F)

for (i in 1:nrow(a)){
  
  df$Activity[which(df$Activity==a[i,1])]=a[i,2]
   
 }

tidy= aggregate(. ~Subject + Activity, df, mean)
tidy=tidy[order(tidy$Subject,tidy$Activity),]

write.table(tidy, file='tidy.txt',row.names = F,col.names = T)

