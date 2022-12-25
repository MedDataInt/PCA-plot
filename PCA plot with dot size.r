
## PCA plot 
# the first column is classification 

install.packages("gmodels")
install.packages("ggthemes")
install.packages("ggpubr")

library(gmodels)
library(ggthemes)
library(ggpubr)

head(data2)
data3 <- as.data.frame(t(data2))

pca.info <- fast.prcomp(data3)
head(pca.info$rotation)

pca.data <- data.frame(sample = rownames(pca.info$rotation),
                       Type=c(rep("A",13),rep("B",12),rep("C",3),rep("D",1), rep("E",1)),
                       pca.info$rotation)
class(pca.data)

pca.data$Ratio <- (data2$VeryAhead+data2$Middling+data2$Completed)/(data2$Behind + data2$MoreBehind + data2$VeryBehind + data2$VeryBehind)

pca <- ggscatter(pca.data, x = "PC1", y= "PC2",
          color = "Type",
          ellipse = T,
          label = "sample",
          repel = F,
          palette = colors1,
          size = "Ratio",
          main="PCA Plot",font.label = c(14, "bold"))