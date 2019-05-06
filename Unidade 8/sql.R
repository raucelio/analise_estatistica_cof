library(sqldf)
library(xlsx)

cocaina <- read.xlsx("ENTORPECENTES.xlsx",1)
maconha <- read.xlsx("ENTORPECENTES.xlsx",2)

save(maconha,file="maconha.RData")
save(cocaina,file="cocaina.RData")

exp1 <- "select * 
         from maconha"

sqldf(exp1)

exp2 <-  "select UNIDADE 
         from cocaina"

sqldf(exp2)

#### comando where

exp3 <-  "select UNIDADE 
         from cocaina
         where UF = 'SP' "

sqldf(exp3)

exp4 <-  "select UNIDADE, TOTAL  
         from cocaina
where UF = 'SP' AND TOTAL >= 1000 "

sqldf(exp4)

exp5 <-  "select UF, UNIDADE  
         from cocaina
where UF = 'MG' OR UF = 'GO' "

sqldf(exp5)

exp6 <-  "select UF, UNIDADE  
         from cocaina
where (UF = 'MG' OR UF = 'GO') AND TOTAL > 300 "

sqldf(exp6)

###  procura em texto

sqldf("select UF, UNIDADE  
         from cocaina
         where UNIDADE like '%SR%'")

sqldf("select UF, UNIDADE  
         from cocaina
         where UNIDADE like 'DPF%'")

sqldf("select UF, UNIDADE  
         from cocaina
         where UNIDADE like '%DF'")

## upper lower

sqldf("select UF, UNIDADE  
         from cocaina
         where lower(UNIDADE) like '%df'")

## order by

sqldf("select UF, UNIDADE, TOTAL  
         from cocaina
         order by UF, TOTAL DESC ")

## Junção de tabelas

sqldf("select cocaina.UF   , cocaina.UNIDADE,
              cocaina.TOTAL, maconha.TOTAL
         from cocaina, maconha
         where cocaina.unidade = maconha.unidade")

sqldf("select A.UF   , A.UNIDADE,
              A.TOTAL, B.TOTAL
      from cocaina as A, maconha as B
      where A.unidade = B.unidade")

## join

sqldf("select A.UF   , A.UNIDADE, A.TOTAL as 'Total Cocaina', B.TOTAL as 'Total Maconha'
      from cocaina as A
      inner join maconha as B
      on  (A.unidade = B.unidade)")

sqldf("select A.UF   , A.UNIDADE,A.TOTAL as 'Total Cocaina', B.TOTAL as 'Total Maconha'
      from cocaina as A
      join maconha as B
      on  (A.unidade = B.unidade)")

sqldf("select A.UF   , A.UNIDADE, A.TOTAL as 'Total Cocaina', B.TOTAL as 'Total Maconha'
      from cocaina as A
      left outer join maconha as B
      on  (A.unidade = B.unidade)")


sqldf("select A.UF   , A.UNIDADE, A.TOTAL as 'Total Maconha', B.TOTAL as 'Total Cocaina'
      from maconha A
      left outer join cocaina as B
      on  (A.unidade = B.unidade)
      where A.UF = 'SP'")

sqldf("select A.UF   , A.UNIDADE, A.TOTAL as 'Total Maconha', B.TOTAL as 'Total Cocaina'
      from maconha A
      left outer join cocaina as B
      on  (A.unidade = B.unidade)
      where A.UF = 'SP'
      order by A.TOTAL DESC")

### union

x <- data.frame (ano=c(2001,2002,2003),
                 sonho=c("casa","carro","aumento"))
y <- data.frame (ano=c(2001,2002,2003),
                 sonho=c("casa","gato","aprovação"))

sqldf("select * from x
      union
      select * from y")

sqldf("select * from x
      union all
      select * from y")
                 

###

sqldf("select sum(TOTAL)
    from maconha")

sqldf("select max(TOTAL)
    from maconha")

sqldf("select min(TOTAL)
    from maconha")

# agrupamento

sqldf("select UF, sum(TOTAL)
    from maconha
    group by UF")

sqldf("select UF, count(*)
    from maconha
    group by UF")

sqldf("select avg(TOTAL)
    from maconha")

## having

sqldf("select UF, sum(TOTAL),  count(*)
    from maconha
      group by UF
      having count(*) > 2")

sqldf("select UF, sum(TOTAL), count(*)
    from maconha
      where TOTAL > 100
      group by UF
      having count(*) > 2")