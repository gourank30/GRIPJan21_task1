#Ankit Gour
#Prediction using Supervised ML
#Predict the percentage of an student based on the no. of study hours
#What will be predicted score if a student studies for 9.25 hrs/ day?
#Required Packages
install.packages("ggplot2")
install.packages("tidyverse")
library(ggplot2)
#loading the Data
df_data <- read.csv('https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv')
#Data View
View(df_data)
str(df_data)
#Formatting the data using lm
fit_1 <- lm(Scores ~ Hours, data = df_data)
#Using summary to obtain information on the models performance and coefficients
summary(fit_1)

#plotting graph using Residual
ggplot(data=df_data, aes(fit_1$residuals)) +
  geom_histogram(binwidth = 1, color = "black") +
  ggtitle("Histogram for Model Residuals")

# Plotting graph when linear model fitted to data
ggplot(data =df_data, aes(x = Hours, y = Scores))+
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)+
  ggtitle("Linear Model Fitted to Data")
# Prediction
predict(fit_1, data.frame(Hours = 9.25))
