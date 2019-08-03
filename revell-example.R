
library(ape)
library(nlme)
library(geiger)


datos <- read.csv("Barbetdata.csv", header=TRUE, row.names=1)
arbol <- read.nexus("BarbetTree.nex")


obj <- name.check(arbol, datos)

arbol.cortado <- drop.tip(arbol, obj$tree_not_data)

name.check(arbol.cortado, datos)


bm <- corBrownian(1, arbol.cortado)
pgls.model <- gls(wing~Lnalt, data=datos, correlation=bm)
summary(pgls.model)

###############

wing <- setNames(datos$wing, rownames(datos))
Lnalt <-  setNames(datos$Lnalt, rownames(datos))


pic.wing <- pic(wing, arbol.cortado)
pic.Lnalt <- pic(Lnalt, arbol.cortado)

pic.model <- lm(pic.wing ~ pic.Lnalt + 0)
summary(pic.model)
