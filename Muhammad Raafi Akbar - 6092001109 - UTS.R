# Muhammad Raafi Akbar - 6092001109 - UTS

library(readr)
library(readxl)
setwd("F:/Random Gaming Stuff/Non Steam Games/Uitilities/Uni Stuff/Materi Kuliah/Semester 7/2 - MDHI/Mahadata 2023/Exams/Midterm Exam 2")
SHI233575_Data <- read.csv("SHI233575_Data.csv")
data <- SHI233575_Data

data2012 <- subset(data,year==2012)
data2012$IV <- data2012$polity
data2012$DV <- data2012$milex

str(data2012)
class(data2012$IV)
class(data2012$DV)

t_IV <- table(data2012$IV)
t_IV

par(mar=c(5,5,5,5))
bc_IV <- barplot(t_IV,
                 main = "Distribution of States by Polity Score (2012)",
                 ylab="Frequency",
                 xlab="Polity Score",
                 horiz = F,
                 las = 2)

par(mar=c(5,5,5,5))
h_DV <- hist(data2012$DV,
             main = "Distribution of Military Expenditure (2012)",
             xlab = "Thousand USD",
             ylab = "Frequency",
             freq = TRUE,
             col = "grey",
             breaks=20)

par(mar=c(5,5,5,5))
bp_DV <- boxplot(data2012$DV,
                 main = "Distribution of Military Expenditure (2012)",
                 ylab = "Thousand USD",
                 col = "grey")

data2012$DV <- log(data2012$DV)
data2012$DV[data2012$DV == -Inf] <- NA # Preemptive removal of -inf values
data2012 <- subset(data2012,!is.na(DV))
data2012 <- subset(data2012,!is.na(IV)) # NAs of IV is removed for consistency

length(data2012$DV) # Making sure "n" values for DV and IV are the same for LM to work
length(data2012$IV)

par(mar=c(5,5,5,5))
bp_DV <- boxplot(data2012$DV,
                 main = "Distribution of Military Expenditure (2012) (Log)",
                 ylab = "Thousand USD",
                 col = "grey")

mtext(paste("Outliers:",
      paste(round(bp_DV$out,4),
      collapse=",")))

# fix(data2012) # Used to allocate outlier value manually

data2012 <- data2012[-133,] # Manual outlier removal (row 133, United States)

length(data2012$DV) # Checking similar "n" values length for both DV and IV (LM use)
length(data2012$IV)

par(mar=c(5,5,5,5))
bp_DV <- boxplot(data2012$DV,
                 main = "Distribution of Military Expenditure (2012) (Log) (Ex. Out.)",
                 ylab = "Thousand USD",
                 col = "grey")

# Remaking of visualizations for IV and DV after transformation

t_IV <- table(data2012$IV)
t_IV

par(mar=c(5,5,5,5))
bc_IV <- barplot(t_IV,
                 main = "Distribution of States by Polity Score (2012) (Post-Trans.)",
                 ylab="Frequency",
                 xlab="Polity Score",
                 horiz = F,
                 las = 2)

par(mar=c(5,5,5,5))
h_DV <- hist(data2012$DV,
             main = "Distribution of Military Expenditure (2012) (Post-Trans.)",
             xlab = "Thousand USD",
             ylab = "Frequency",
             freq = TRUE,
             col = "grey",
             breaks=20)

par(mar=c(5,5,5,5))
bp_DV <- boxplot(data2012$DV,
                 main = "Distribution of Military Expenditure (2012) (Post-Trans.)",
                 ylab = "Thousand USD",
                 col = "grey")

par(mar=c(8,8,5,5))
plot(data2012$IV, data2012$DV, 
     main = "Relationship of Polity Score and Military Expenditure (2012)",
     xlab="Polity Score (-10 (Authoritarian) to 10 (Democracy))", 
     ylab="Mil. Ex. (Thousand USD)")

lm_model <- lm(data2012$DV~data2012$IV)
lm_model_intercept <- lm_model$coefficients[1] # [1] indicating intercept/alpha
lm_model_slope <- lm_model$coefficients[2] # [2] indicating slope/beta

abline(a=lm_model_intercept,
       b=lm_model_slope,
       lty=1,
       lwd=2,
       col="blue")

summary(lm_model)

data2012_1 <- subset(data2012,
                  IV <= median(IV,)) # Authoritarian-Leaning Group
data2012_2 <- subset(data2012,
                  IV > median(IV,)) # Democratic-Leaning Group

data2012_1$IV
data2012_2$IV

h1 <- hist(data2012_1$DV,
           breaks=20)
h2 <- hist(data2012_2$DV,
           breaks=20)

plot(h1,
     col="red",
     main="Distribution of Polity Score per Mil. Ex. (2012)",
     xlab="Mil. Ex. (Thousand USD)")
plot(h2,
     col="blue",
     add=TRUE)

c1 <- adjustcolor("red",alpha.f=0.4)
c2 <- adjustcolor("blue",alpha.f=0.4)

plot(h1,
     col = c1,
     main = "Distribution of Polity Score per Mil. Ex. (2012)",
     xlab = "Mil. Ex. (Thousand USD)")
plot(h2,
     col = c2,
     add =TRUE)

abline(v=mean(data2012_1$DV,),
       lty=2,
       lwd=2,
       col=c1) 
abline(v=mean(data2012_2$DV,),
       lty=2,
       lwd=2,
       col=c2)

legend("topright", 
       legend=c("Polity < Median (Polity)", 
                  "Polity > Median (Polity)"),
       col=c(c1, 
             c2), 
       lty=2:2, 
       cex=0.8)

# Export data2012 to a CSV file (retest of regression output on Excel, if needed), excel regression output should be very similar (DV v IV)
# write.csv(data2012, file = "data2012_transformed.csv", row.names = FALSE)
