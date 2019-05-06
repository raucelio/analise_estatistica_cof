## O arquivo GravidezDuracao.csv armazena em sua única variável
## ,Duracao , o número de dias em 1000 gestações.

dados <- read.csv("GravidezDuracao.csv")

#  histogrma basico
jpeg("histogrma1.png")
hist(dados$Duracao,
     main = "Duração de Gestações, em dias.",
     xlab = "Número de dias",
     ylab = "Frequência"    ,
     col  = "Orangered",labels = T)
dev.off()