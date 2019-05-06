library(xlsx)

## Leitura de dados

maconha <- read.xlsx("ENTORPECENTES.xlsx","maconha")
names(maconha)[3:4] <- c("qtd_maconha", "vlr_maconha")
cocaina <- read.xlsx("ENTORPECENTES.xlsx","cocaina")
names(cocaina)[3:4] <- c("qtd_cocaina", "vlr_cocaina")

str(maconha)
str(cocaina)

## Unindo os dados

dados <- merge(maconha,cocaina, all=T)

str(dados)

head(dados)

## Armazenando os dados

save(dados, file= "drogas.RData")

## Agregando por UF

consolidado <- aggregate(dados[,-c(1,2)], list(dados$UF),sum, na.rm=T)
names(consolidado)[1] <- "UF"
str(consolidado)
head(consolidado)

## Ordenado por quandidade de cocaina

ordem<-order(consolidado$qtd_cocaina)

## Gr?fico de Barras por UF

barplot(consolidado$qtd_cocaina[ordem],
        names.arg=consolidado$UF[ordem], 
        cex.names=0.7,
        las=2,
        add=T,
        col="steelblue4")

abline(h=mean(consolidado$qtd_cocaina))

## Gr?fico mais Elaborado maconha e cocaina

barplot(t(as.matrix(consolidado[,c(2,4)])),
        names.arg=consolidado$UF, 
        cex.names=0.7           ,
        beside=T                ,
        col=c("steelblue4", "red"),
        legend.text=c("maconha","cocaina"),
        las=2)