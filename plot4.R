
## This first line will likely take a few seconds.
NEI <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/summarySCC_PM25.rds")
SCC <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# Merge the two data sets on SCC Code
mrgNS <- merge(NEI, SCC, by="SCC")

# Find the Coal types
coalIndex<-grepl("coal", SCC$Short.Name, ignore.case=TRUE)

# filter out records with 'Coal' in Short.Name (SCC) (for coal based emissions) based on Index
subNS <- mrgNS[coalIndex, ]

totalsByEmission <- aggregate(Emissions ~ year, subNS, sum)

library(ggplot2)

png('~/RProjects/GIT/ExploratoryDataAnalysis-Project2/plot4.png')
g <- ggplot(totalsByEmission, aes(year, Emissions))
g <- g + geom_bar(stat="identity") +
     xlab("Year") + 
     ylab("Aggregate PM 2.5 Coal Based Emissions") + 
     ggtitle("Aggregate of Coal Based Emissions in US - 1999-2008")
print(g)
dev.off()