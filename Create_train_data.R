sample_data <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")
#n <- nrow(train_data)
summary(sample_data)
n <- 10000
gpa <- rnorm(n,mean(sample_data$gpa),sd(sample_data$gpa))
gpa <- ifelse(gpa>4,4,gpa)
gpa <- ifelse(gpa<0,0,gpa)
summary(gpa)

hist(sample_data$rank)
rank <- rnorm(n, mean(as.numeric(sample_data$rank))-0.5, sd(as.numeric(sample_data$rank)))
summary(rank)
rank <- cut(rank,breaks = c(min(rank),1,2,3,max(rank)),include.lowest = T,right = T)
rank <- as.numeric(rank)
hist(rank)
rank <- as.factor(rank)

hist(sample_data$gre)
gre <- rnorm(n, mean(as.numeric(sample_data$gre)), sd(as.numeric(sample_data$gre)))
gre <- ifelse(gre>800,800,gre)
gre <- ifelse(gre<0,0,gre)
hist(gre)

train_data <- data.frame(gre = gre, gpa = gpa, rank = rank)


#追加情報を作成
train_data$gre_math <- 0.3 * train_data$gre + rnorm(length(train_data$gre),0,10)
train_data$household <- rlnorm(n,meanlog=5,sdlog=0.4)
hist(train_data$household)
hist(log(train_data$household))
train_data$sex <- ifelse(runif(n = n,0,1)<=0.5,1,0)
#data 特性
#summary(train_data)
#ggpairs(train_data)

# 元のデータの関係をそのままに新しいOutcome Yを作る。
# sampleから係数を算出
sample_data$rank <- factor(sample_data$rank)
samplelogit <- glm(admit ~ gre + gpa + rank, data = sample_data, family = "binomial")
coef_vec <- samplelogit$coefficients

# 係数に基づきYを規定
rank_mat <- model.matrix(~1+ rank,data=train_data)[,-1]
model_df <- cbind(train_data[,colnames(train_data) != "rank"],rank_mat)
model_df$sex_gre <- model_df$sex*model_df$gre
model_df$sex_household <- log(model_df$household)*model_df$gre
head(model_df)
#再設定
summary(model_df)
e <- rlogis(n,0,1)
z <- with(data = model_df,coef_vec[2]*gre + coef_vec[3]*gpa + coef_vec[4]*rank2 + coef_vec[5]*rank3 + coef_vec[6]*rank4
          -0.35*log(household)+ 0.002*sex_gre +(-2.53) * sex + e)
y_pred <- 1/(1+exp(-z))
hist(y_pred)

train_data$y <- ifelse(y_pred<0.5,1,0)
summary(train_data)
hist(train_data$y)
#head(train_data)
train_data_stock <- train_data
write.csv(train_data,"train_data.csv")
