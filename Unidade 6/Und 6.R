dados<-read.csv2("INDICIAMENTO.csv")

aux <- aggregate(dados["Indiciamentos"],
                 by=dados["uf"]        ,
                 range             ,
                 an.rm=T)

aux <- tapply(dados$Indiciamentos,
                 dados$uf   ,
                 mean              ,
                 an.rm=T)

# aux <- tapply(dados["Indiciamentos"],
#                  dados["uf"]        ,
#                  mean              ,
#                  an.rm=T)

aux <- tapply(dados$Indiciamentos,
              dados$uf   ,
              summary            ,
              an.rm=T)