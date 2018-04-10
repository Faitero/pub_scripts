#!/usr/bin/Rscript
library("ggplot2")


args = commandArgs(trailingOnly=TRUE)

file <- args[1]
barcode5 <- args[2]
barcode3 <- args[3]
path <- args[4]

read_len <- scan(file, what="", sep=" ")

# Remove the last element that is empty
read_len <- read_len[-length(read_len)]
read_len <- as.numeric(read_len)
count <- length(read_len)

plot_name <- paste(path, "/Histogram", barcode5, barcode3, ".pdf", sep="")

ggplot() + aes(read_len)+ geom_histogram(binwidth=2, colour="grey", fill="grey") + theme_bw() +
  labs(title=paste("Histogram", "5' barcode", barcode5, "3' barcode", barcode3, sep=" ")) +
  labs(x="Read lenght", y="Frequency")+
  xlim(c(0, 200)) +
  annotate("text", label = paste("Reads with L3 adapter: ", count, sep="") , x = 30, hjust = 0, y = Inf, vjust = 2, color = "darkred") 
  #annotate("text", label = count , x = 100, hjust = 0, y = Inf, vjust = 2, color = "darkred")


ggsave(plot_name)

# annotate("text", label = "Total:" , x = 0, hjust = 0, y = Inf, vjust = 2, color = "darkred") +
#   annotate("text", label = total , x = 15, hjust = 0, y = Inf, vjust = 2, color = "darkred")
