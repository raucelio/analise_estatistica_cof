## O arquivo INDICIAMENTO.csv armazena informa��es sobre 
## indicimanetos de 4162 inqueritos relatados entre  1/1/2018
##  a 30/3/2018. A vari�vel competencia indica a �rea de atuac�o
##  da DICOR. A categoria OUTRAS indica inqueritos fora da a��o da
##  dessa diretoria. barplot_1.R

dados <- read.csv2("INDICIAMENTO.csv")

freq <- table(dados$competencia)

#  barplot basico
jpeg("barplot1.png")
barplot(sort(freq),
     main = "Inqu�ritos por �rea da DICOR.",
     col  = "Orangered",
     las  = 2,
     cex.axis = 0.7,
     cex.names = 0.7,horiz=T)
dev.off()