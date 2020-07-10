**Second Order Regression Model for Qualitative Analysis**

**Background Information:**

Standard samples with certified/ known concentration are required for calibrations of spectrometer, to build the regression curve of each specified element. The regression model
can be used to analyse samples with unkown concentration qualitatively. 

y is certified concentration.   
x is intensity converted in counts per second.

Difference of y= absolute difference between the calculated concentration from the regression model and the certified concentration of each sample   
***ydif=abs(y-caly)***

Standard error of estimates= square root (summation of differences of y/Degree of freedom)   
***se=sqrt(sum(ydif^2)/(length(y)-2))***

Acceptance criteria = Standard Error * 1.5    
***ac=se * 1.5***

Confidence level=No. of the samples fulfilling the acceptance criteria/ Total no. of samples in the regression model    
***CL=length(y[ydif<ac])/length(y)***

**Requirement of the regression model:**
1. Coefficient of determination (R^2) >= 0.995 AND   
2. Confidence Level (CL) >= 0.85

If the model does not satisfy the above requirement, the following actions can be done:
REMOVING the POINT(S) according to 
1) R-squared OR 
2) ydif

**Steps for modification:**     
Step 1:    
Method 1: Try to delete each sample point to see the R^2 values. Choose the sample point ,which attains the highest R^2 value after deletion, to be deleted.      
Method 2: Delete the sample point with the highest y-dif.

Step 2:     
After removal, develop the NEW regression model, compute caly, se and then CL.

Step 3:     
Check whether the newly-developed model satsify the requirement or not. If not, repeat the above procedures by the modified dataset until the final ones satisfies the requirement.



