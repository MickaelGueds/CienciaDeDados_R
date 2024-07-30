viagens <- read.csv(
  file = "C:/Users/Mickael/Downloads/2019_Viagem.csv",
  #as duas funções abaixos serve para tratamento correto de dados, sendo dec para o separador de casa decimal, e sep o separador
  sep = ';',
  dec = ',',
  fileEncoding = "latin1"
  
)


head(viagens)

View(viagens)

#vamos criar uma coluna para armazenar o valor da transformação, a coluna original não foi alterada
viagens$data.inicio <- as.Date(viagens$Período...Data.de.início, "%d/%m/%Y")
viagens$data.inicio.formatada <- format(viagens$data.inicio, "%Y-%m")
viagens$data.inicio.formatada


#Explorar os dados
 hist(viagens$Valor.passagens)
 #vemos min, media, e maxima dos valores 
 summary(viagens$Valor.passagens)
 #para visualizar usamos boxplot
 boxplot(viagens$Valor.passagens)
 #e agora vamos calcular o desvio padrão
 sd(viagens$Valor.passagens)
#vamos ver tambem se existe valores vazios
 colSums(is.na(viagens))
 
 #Hora da pratica! -1: Quais orgãos estão gastando mais com passagens aéreas?
 #criando dataFrame com 15 orgãos que mais gastam por exemplo
 install.packages("dplyr")
 library(dplyr)
 p1 <- viagens %>%
   group_by(Nome.do.órgão.superior) %>%
   #aqui somamos o valor gasto por orgão
   summarise(n = sum(Valor.passagens)) %>%
   #agora so basta ordenar e listar os 15
   arrange(desc(n)) %>%
   top_n(15)
 
 names(p1) <- c("orgao","valor")
 
 #agr visualizaremso com grafico de barras 
 library(ggplot2)
 ggplot(p1, aes(x = reorder(orgao, valor), y = valor))+
   geom_bar(stat = "identity")+
   coord_flip()+
   labs(x = "Valor", y = "Órgãos")
 
 p2 <- viagens %>%
   group_by(Destinos) %>%
   summarise(n = sum(Valor.passagens)) %>%
   arrange(desc(n)) %>%
   top_n(15)
 
 names(p2) <- c('destino','valor')
 ggplot(p2, aes(x = reorder(destino, valor), y = valor))+
   geom_bar(stat = "identity", fill = "#0ba791")+
   geom_text(aes(label = valor), vjust = 0.3, size = 3)+
   coord_flip()+
   labs(x = "Valor", y = "Destino")
 
 