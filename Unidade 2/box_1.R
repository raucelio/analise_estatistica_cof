## O arquivo GravidezDuracao.csv armazena em sua única variável
## ,Duracao , o número de dias em 1000 gestações.
## hist_1.R
dados <- read.csv("GravidezDuracao.csv")

#  boxplot basico
jpeg("boxplot1.png")
boxplot(dados$Duracao,
     main = "Duração de Gestações, em dias.",
     col  = "Orangered")
dev.off()