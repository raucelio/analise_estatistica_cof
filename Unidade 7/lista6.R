setwd("C:/Users/raucelio.CGGPRE91926/Desktop/cof/Unidade 7")

auto <- read.csv("Auto.csv")

table(auto$cylinders)

round(cor(auto[,c(1,2,3,4,5,6)]),2)


tapply(auto$weight,auto$origin, mean)

# runif(1) - retorna uma amostra de de tamanho de  uma
#            população uniforme de valores entre 0 e 1 
# rnorm(x,mena,sd) - retorna uma amostra de tamanho x
#            de uma população normal de media  mean e 
#            desvio padrão sd;
valor <- NA

for (i in 1:1000)
{
  
  aux <- runif(1)
  
  if (aux <= 0.30) 
  {
    
    valor[i]<- rnorm(1, mean=5,sd=2)
    
  } 
  else
  {
    
    valor[i]<- rnorm(1,mean=15,sd=2)  
    
  }
}

hist(valor)

### questão 3

moeda <- c(1,2,1,1,1,2,2)
valor <- c(500,250,300,400,600,100,350)

compras <- data.frame(moeda,valor)
compras$reais <- ifelse(compras$moeda ==1 , 
                        compras$valor * 0.8, 
                        compras$valor * 0.5)


### Questão 4

library(xlsx)
cocaina <- read.xlsx("ENTORPECENTES.xlsx", sheetName = "cocaina"  )
maconha <- read.xlsx("ENTORPECENTES.xlsx", sheetName = "maconha"  )

drogas <- merge(maconha,cocaina, by.x="unidade",by.y="unidade", all=T)

write.xlsx(drogas, "DROGAS.xlsx",row.names = F)
