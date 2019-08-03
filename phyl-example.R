
#Libraries
library(ape)
library(phytools)

#Dataset examples
data(bird.orders)

#Set up margins
par(mar = c(2,2,2,2))

#Slightly better than default plot
phylo = plot.phylo(bird.orders, edge.width = 1, label.offset = 1,cex = 0.4, main = "Figure 1 (basic)")

#Dropping a group (tip) altogether
bird.orders_nopass = drop.tip(bird.orders,"Passeriformes")
plot.phylo(bird.orders_nopass, edge.width = 1, label.offset = 1,cex = 0.4, main = "Figure 2 (dropped tip)")

#Dropping many tips
bird.orders.drops =(drop.tip(bird.orders, c(9:12), subtree = TRUE))
bird.orders.drops$tip.label[bird.orders.drops$tip.label=="[4_tips]"] = "clade A (4 tips)"

plot.phylo(bird.orders.drops, edge.width = 1, label.offset = 1,cex = 0.4, main = "Figure 3 (dropped tips)")

#Unrooted tree
plot.phylo(bird.orders,type="unrooted", edge.width = 1, label.offset = 2,cex= 0.4, main = "Figure 4 (unrooted)")


############################################
### The example in Phylip 3.5c (originally from Lynch 1991)
cat("((((Homo:0.21,Pongo:0.21):0.28,",
    "Macaca:0.49):0.13,Ateles:0.62):0.38,Galago:1.00);",
    file = "ex.tre", sep = "\n")
tree.primates <- read.tree("ex.tre")

plot.phylo(tree.primates)

X <- c(4.09434, 3.61092, 2.37024, 2.02815, -1.46968)
Y <- c(4.74493, 3.33220, 3.36730, 2.89037, 2.30259)
names(X) <- names(Y) <- c("Homo", "Pongo", "Macaca", "Ateles", "Galago")
pic.X <- pic(X, tree.primates)
pic.Y <- pic(Y, tree.primates)
cor.test(pic.X, pic.Y)
lm(pic.Y ~ pic.X - 1) # both regressions
lm(pic.X ~ pic.Y - 1) # through the origin
unlink("ex.tre") # delete the file "ex.tre"
