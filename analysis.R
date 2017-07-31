data <- read_csv("https://github.com/namratachakrabarty/cloudera_test/blob/master/data.csv")
sumamry(data)
install.packages("Hmisc")
library(Hmisc)
set.seed(123)
smp_size <- floor(0.7 * nrow(data))

train_ind <- sample(seq_len(nrow(data)), size = smp_size)

training <- data[train_ind, ]
validation <- data[-train_ind, ]
install.packages("party")
library(party)
fit <- cforest(as.factor(diagnosis) ~radius_mean+texture_mean+perimeter_mean, data =training)
         
