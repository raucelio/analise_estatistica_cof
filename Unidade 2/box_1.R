## O arquivo GravidezDuracao.csv armazena em sua �nica vari�vel
## ,Duracao , o n�mero de dias em 1000 gesta��es.
## hist_1.R
dados <- read.csv("GravidezDuracao.csv")

#  boxplot basico
jpeg("boxplot1.png")
boxplot(dados$Duracao,
     main = "Dura��o de Gesta��es, em dias.",
     col  = "Orangered")
dev.off()