mensagem <- "Hello World"
print(mensagem)
 
install.packages("ggplot2")

library(ggplot2)
 ?c

#vetores 
cidade <- c("Brasilia",
            "São Paulo",
            "Rio de janeiro",
            "Porto Alegre")
cidade

temperatura <- c(10,24,22,15)

temperatura[1:3]



pessoa <- list(sexo = "m" , cidade = "Brasília",idade = 20)

#usando factor para acionar os levels,onde vai ter lista ordenada de maneira categorica de dados

grau_Instituição <- factor(c("nivel superio", "fundamental","nivel medio"),levels = c("fundamental","ensino medio","ensino superior"), ordered = TRUE)

grau_Instituição

#agora criando o dataaaFrame

df <- data.frame(cidade,temperatura)
df

#matriz

m2 <- matrix(seq(1:25),
             ncol=5,byrow = TRUE,
             dimnames = list(c(seq(1:5)),
                             c('A','B','C','D','E')))

m2
