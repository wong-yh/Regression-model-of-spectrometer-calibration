#Certified Concentration
y<-c(0.07000,0.03000,0.07300,0.00200,0.02000,0.01000,0.01100,0.01000,0.03900,0.05400,0.00200)
#Intensity converted in counts (cps), counts per second
x<-c(0.50108,0.32724,0.55314,0.14316,0.23245,0.17051,0.19535,0.17461,0.32372,0.42250,0.09596)


#Regression model modified by the difference between calculated and certified concentration 
ydifmod<-function(x,y){
#Regression model
model<-lm(y~ poly(x,2,raw=TRUE))
summary(model)
caly<-coef(model)[3]*(x^2)+coef(model)[2]*x+coef(model)[1]  #Calculated y
ydif<-abs(y-caly)                    #Difference between certified concentration and model-calculated concentration
se<-sqrt(sum(ydif^2)/(length(y)-2))  #Standard Error of estimates
ac<-se*1.5                           #Acceptance Criteria: SE*1.5
CL<-length(y[ydif<ac])/length(x)     #Confidence Level

if (summary(model)$r.squared>=0.995 && CL>=0.85){        #Conditions
  print("No deletion is required")
  print(summary(model))
  print("Confidence Level:")
  print(CL)
}else{ 
  while(summary(model)$r.squared<0.995 || CL<0.85){
    
    #Removal of the point so that the Difference between the certified & the model is highest  
    delpoint<-c(x[which(ydif==max(ydif))],y[which(ydif==max(ydif))])
    print("The Point deleted:")
    print(delpoint)
    x<-x[-which(ydif==max(ydif))]
    y<-y[-which(ydif==max(ydif))]
    # After removal of the point, substitute into regression model
    model<-lm(y~ poly(x,2,raw=TRUE))
    
    caly<-coef(model)[3]*(x^2)+coef(model)[2]*x+coef(model)[1]  
    ydif<-abs(y-caly)                    
    se<-sqrt(sum(ydif^2)/(length(y)-2))  
    ac<-se*1.5                           
    CL<-length(y[ydif<ac])/length(x)
    
  }
  print(summary(model))
  print("Confidence Level:")
  print(CL)}
}

#Input the data into developed function
ydifmod(x,y)

