library(xlsx)
library(sqldf)


orcamento<- read.xlsx("Orcamento.xlsx",
                      sheetIndex = 1)

# altere o nome das variáveis

names(orcamento) <- c("ANO", "GD","UG","UF", "EMPENHADO","LIQUIDADO","RP")

# crie a variável no data frame orcamento EXECUTADO=LIQUIDADO+RP na PF por ano?

orcamento$EXECUTADO <-orcamento$LIQUIDADO+orcamento$RP



### crie um data frame ano16  para as observações de 2016
### e ano17 para as de 2017.

ano16 <- sqldf("select * from orcamento where ANO = 2016")
ano17 <- orcamento[orcamento$ANO == 2017,]


## classifique as variáveis em quantitativas e qualitativas.

## verifique as frequencias das variáveia qualitativas e 
## calculer as estatistias descrivas das variáveis qualitativas.



###AComo se caracterizam?
summary(ano16)
summary(ano17)


###qual o valor total empenhado, liquidado, RP e executado da PF por ano?


x<- "select ANO, SUM(EMPENHADO), 
                 SUM(LIQUIDADO), 
                 SUM(RP), 
                 SUM(EXECUTADO)
from orcamento
group by ANO"
sqldf(x)


###Qual a UG com maior execução por ano? Por que?

x<- "select UG, ANO, MAX(EXECUTADO) as EXECUTADO
from orcamento
group by ANO"
sqldf(x)



###Verifique se o valor empenhado está relacionado com a execução

cor(orcamento$EMPENHADO, orcamento$EXECUTADO)



### Na PF, como está a execução por grupo de Despesa? E por UG?

GD<- "select GD, sum(EXECUTADO)
from orcamento
group by GD"
sqldf(GD)


UG<- "select UG, sum(EXECUTADO)
from orcamento
group by UG"
sqldf(UG)

GD17<- "select GD, sum(LIQUIDADO+RP) as EXECUTADO2017
from ano17
group by GD"
sqldf(GD17)

###Faça um gráfico, por ano, dos valores emp, exec na PF.



x<- "select ANO, SUM(EMPENHADo) as empenhado , 
                SUM(EXECUTADO) as executado
from orcamento
group by ANO"

dados<-sqldf(x)
row.names(dados) <- dados[,1]
dados <- dados[,-1]

barplot(t(as.matrix(dados)),
beside = T , ylim = c(0, 8e+10),
col = c("bisque", "navy"), border= c("bisque", "navy"),
legend.text=c("Empenhado","Executado"),
args.legend=c(x="top", bty = "n", horiz=T)
)



