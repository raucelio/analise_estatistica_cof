# comparar peso e altura de um grupo de meninos e meninas
# Arquivo: exp_1.r

peso   <- c(46,40,36,60,36,37,40,36,45,65)
altura <- c(164,158,162,166,154,154,156,158,149,152)
sexo   <- c('F','F','F','F','F','M','M','M','M','M')

imc <- peso/(altura/100)^2

mean(imc)

tapply(imc,sexo,mean)
