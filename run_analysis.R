xt = read.table('X_test.txt')
xtr= read.table('X_train.txt')

x= rbind(xtr,xt)
x1= x[,1:6]

yt= read.table('y_test.txt')
ytr=read.table('y_train.txt')

y= rbind(ytr, yt)


f= read.table('features.txt')
f1= t(f[,2])
f2= f1[1:6]

st= read.table('subject_test.txt')
str= read.table('subject_train.txt')
s= rbind( str, st)

names(x1)=f2
df=cbind(s,y,x1)
names(df)[1:2]=c('Subject','Activity')

a= read.table('activity_labels.txt', stringsAsFactors = F)

for (i in 1:nrow(a)){
  
  df$Activity[which(df$Activity==a[i,1])]=a[i,2]
   
 }


head(df)

p=c()

for (i in 3:8){
  
  p1=(tapply(df[,i],df[,2],mean))
  p= cbind(p, p1)
  
}

q=c()

for (i in 3:8){
  
  q1=(tapply(df[,i],df[,1],mean))
  q= cbind(q, q1)
  
}

d= data.frame()
d= rbind((p),(q))
d1= as.data.frame(d)
names(d1)= paste('Avg.',names(df)[3:8],sep='')
d1
write.table(d1, file='tidy.txt',row.names = F)

