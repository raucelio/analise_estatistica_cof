# h� hiferen�a entre altura de meninos e meninas.

# ajuste a sua area de trabalho para a unidade 5

# Acione o pacote xlsx por meio da fun��o library

# Use a fun��o read.xlsx() para criar o data 
# frame ALTURA, com as variaveis altura e sexo.
# a partir do arquivo Galton.xlsx
# uses os argumentos sheetName e colIndex

ALTURA <- read.xlsx("Galton.xlsx", 
                    sheetName = "Galton", 
                    colIndex = c(4,5))

# Obtenha as seguintes estat�sticas:
# media, mediana, valor m�ximo e m�nimo, 
# 1� quartil e 3� quartil
# variancia e desvio padr�o da variavel altura 

summary (ALTURA)
var(ALTURA$altura)
sd(ALTURA$altura)

# Fa�a um histogra da vari�vel altur
# a e armazene os seus resultados na vari�vels aux 
# use o argumento main para fazer o titulor ser
# "Altuiras observadas" use fun��o axes 
#para eliminar os eixos=F, use 

limites <- seq(56,80,2)

aux <- hist(ALTURA$altura,breaks=limites,main ="Alturas Observadas",
            axes = F,
            xlab="Alturas (polegadas)",
            ylab="", col = "tomato4")
# use a fun��o axis() para criar o eixo x (side=1) com os limites
# definidos pelo histogram que est�o em aux (at=aux$breaks)

axis(side=1,at=aux$breaks)

# fa�a um boxplot das alturas com o 
# titulo alturas observadas, cor tomato4 e pch = 15

boxplot(ALTURA$altura, 
        main="Alturas Observadas",
        col="tomato4", pch=16)

## execute os seguintes comandos

cor_menino <- rgb(red = 0.87, green = 0.83,
             blue = 0.71, alpha = 0.5 )
cor_menina <-  rgb(red = 0.70, green = 0.77,
                blue = 0.30, alpha=0.5)


boxplot(ALTURA$altura ~ ALTURA$sexo, 
        main="Alturas Observadas",
        col=c(cor_menino,cor_menina), pch=16)

## Use o operador colchetes para criar um data frame
## meninos que tenha somente as observa��es dos dos 
## sexo M (ALTURA[ALTURA$sexo == "M",]

menino <- ALTURA[ALTURA$sexo=="M",]

## Crie o data frame meninas, com as observa��e de ALTURA
## do sexo feminino

menina <- ALTURA[ALTURA$sexo=="F",]
#

# crie um histogram como os dados dos meninos, 
# com as seguites especifica��es
# titulo principal "Alturas Observadas";
# Os valores do eixo x deve ser de 56 a 80 (xlim=c(56,80)) 
#O limte das clases deve ser os mesmos dado por 
# breaks=aux$breaks
# apague o titulo do eixo y (ylab)
# o titulo do eixo x deve ser "Alturas (polegadas)"

hist(menino$altura,main ="Alturas Observadas",
            breaks = aux$breaks,
            axes = F,
            xlim=c(56,80),
            xlab="Alturas (polegadas)",
            ylab="", col = cor_menino)
axis(1,at=aux$breaks)

# crie um histogram como os dados dos meninos, 
# com as seguites especifica��es
# titulo principal "Alturas Observadas";
# Os valores do eixo x deve ser de 56 a 80 (xlim=c(56,80)) 
#O limte das clases deve ser os mesmos dado por 
# breaks=aux$breaks
# apague o titulo do eixo y (ylab="")
# o titulo do eixo x deve ser "Alturas (polegadas)
# cor abacate e adicione o argumento add=T"

hist(menina$altura,main ="",
     breaks = aux$breaks,
     axes = F,
     xlim=c(56,80),
     xlab="",
     ylab="", col =cor_menina, add=T)

legend("topright", c("meninos","meninas"), 
       fill=c(cor_menino,cor_menina),bty="n")
