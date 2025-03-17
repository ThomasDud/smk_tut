#!/ssu/gassu/conda_envs/renv_431/bin/Rscript

args <- commandArgs(trailingOnly = TRUE)

input_file <- args[1]
output_file <- args[2]

library(ggplot2)
library(data.table)


my_data<-fread(input_file, sep="\t", header=F)
my_data<-my_data[V2 != "N/A"]

my_data <- rbind(my_data,my_data)
a<-1
b<-nrow(my_data)/2
c<-nrow(my_data)
my_data$label <- rep(c("group_1","group_2"), each = b)
my_data$V1[(b+1):c] <- my_data$V2[a:b]
my_data$V2 <- NULL
my_data$V1<-as.numeric(my_data$V1)

plot <- ggplot(my_data, aes(x=V3,y=V1)) +
          geom_bar(stat = "identity",linewidth=0.3) +
          labs(title = "Flagstat values", x="Type of info", y="value") +
          theme_bw() +
          facet_grid(label ~ .) +
          theme(axis.text.x = element_text(angle=90,vjust=.5, hjust=1))

ggsave(output_file, plot=plot, width=20, height=20)
print("Done!")
