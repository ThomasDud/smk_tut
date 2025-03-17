#!/ssu/gassu/conda_envs/renv_431/bin/Rscript

library(ggplot2)
library(data.table)

args<-commandArgs(trailingOnly=TRUE)

input<-args[1]
output<-args[2]


cmd <- paste0("zgrep ^MQ ", input, " | cut -f 2-")

cmd <- paste0("zgrep ^MQ ", input, " | cut -f 2-")
my_data <- read.table(pipe(cmd), sep="\t", header=TRUE)

plot <- ggplot(my_data, aes(x=MappingQuality, y=Fraction)) +
          geom_line(color="blue", linewidth = 1) +
          labs(title="Mapping quality", x= "mapq", y="fraction of reads") +
          theme_bw()

ggsave(output, plot=plot, width=20, height=10)
print("Done!")
