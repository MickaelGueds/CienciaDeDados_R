diabetes <- read.csv( file = "C:/Users/Mickael/Downloads/diabetes.csv")
head(diabetes)

#trate os dados

str(diabetes)

colSums(is.na(diabetes))

diabetes$Outcome <- as.factor(diabetes$Outcome)

#funções uteis

boxplot(diabetes)
hist(diabetes$Pregnancies)

#Agora vamos treinar o nosso modelo predativo, primeira fase é a divisão de dados de treino e dados para teste
#install.packages("caTools")
library(caTools)

set.seed(123)
index = sample.split(diabetes$Pregnancies, SplitRatio = .70)

index

train = subset(diabetes,index == TRUE)
test = subset(diabetes,index == FALSE)

dim(diabetes)
dim(train)
dim(test)

library(caret)
library(e1071)

modelo <- train(Outcome ~.,data = train, method = "knn",tuneGrid = expand.grid(k = c(1:30)))

#verificar os melhores valores de k 

modelo$bestTune

plot(modelo)

#avaliando o modelo 

predicoes <- predict(modelo,test)
predicoes

confusionMatrix(predicoes,test$Outcome)
#pronto agora apenas teste com os novos valores e voce tera o que o modelo pensa de acordo com os dados e que tipo de algoritimo lhe foi estabelecido

#Criando o arquivo com os resultados das predições
write.csv(predicoes,'resultado.csv')

#Lendo o arquivo de previsões que foi gerado
resultado.csv <- read.csv('resultado.csv')

#Alterando o nome das colunas do dataframe
names(resultado.csv) <- c('Indice','Valor previsto')

#Visualizando o dataframe
resultado.csv
