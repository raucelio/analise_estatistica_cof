setwd("E:/cof/Unidade 1")
dados <- read.csv2("INDICIAMENTO.csv")


# ### converter uma string em data
# 
# dados$instauracao <- as.Date(dados$instauracao,"%d/%m/%Y")
# dados$relatorio <- as.Date(dados$relatorio,"%d/%m/%Y")
# dados$duracao <- dados$relatorio - dados$instauracao