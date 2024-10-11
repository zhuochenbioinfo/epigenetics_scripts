library(ggplot2)
library(ggseqlogo)

args <- commandArgs(TRUE)
homer_motif <- args[1]

data <- read.delim(homer_motif)

mat <- t(sapply(data[2:nrow(data),1:4], as.numeric, simplify = "matrix"))
rownames(mat) <- c("A","C","G","T")

p.width <- length(mat[1,]) * 0.5
p.height <- 1

p <- ggplot() +
  geom_logo(mat) +
  theme_bw() +
  theme(axis.text=element_blank(),
        axis.ticks=element_blank(),
        panel.grid = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.title=element_blank(),
        strip.background = element_blank(),
        strip.text = element_blank(),
        plot.margin = margin(0,0,0,0,"pt")
  )


pdf(paste(homer_motif,"logo","forward","pdf",sep="."),width=p.width,height=p.height)
print(p)
dev.off()
png(paste(homer_motif,"logo","forward","png",sep="."),width=p.width,height=p.height,units="in",res=600)
print(p)
dev.off()

mat.t <- t(apply(mat,1,rev))
rownames(mat.t) <- c("T","G","C","A")

p <- ggplot() +
  geom_logo(mat.t) +
  theme_bw() +
  theme(axis.text=element_blank(),
        axis.ticks=element_blank(),
        panel.grid = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.title=element_blank(),
        strip.background = element_blank(),
        strip.text = element_blank(),
        plot.margin = margin(0,0,0,0,"pt")
        )

pdf(paste(homer_motif,"logo","reverse","pdf",sep="."),width=p.width,height=p.height)
print(p)
dev.off()
png(paste(homer_motif,"logo","reverse","png",sep="."),width=p.width,height=p.height,units="in",res=600)
print(p)
dev.off()
