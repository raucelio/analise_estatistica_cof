## O arquivo GravidezDuracao.csv armazena em sua �nica vari�vel
## ,Duracao , o n�mero de dias em 1000 gesta��es.

dados <- read.csv("GravidezDuracao.csv")

#  histogrma basico
jpeg("histogrma1.png")
hist(dados$Duracao,
     main = "Dura��o de Gesta��es, em dias.",
     xlab = "N�mero de dias",
     ylab = "Frequ�ncia"    ,
     col  = "Orangered",labels = T)
dev.off()