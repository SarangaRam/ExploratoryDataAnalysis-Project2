
## This first line will likely take a few seconds.
NEI <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/summarySCC_PM25.rds")
SCC <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Aggregate with subset for Baltimore and type=ON-ROAD
totalsByYr <- aggregate(Emissions ~ year, subset(NEI, fips == "24510" & type =="ON-ROAD"), sum)

library(ggplot2)

png('~/RProjects/GIT/ExploratoryDataAnalysis-Project2/plot5.png')
g <- ggplot(totalsByYr, aes(year, Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") + 
  ylab("Aggregate PM 2.5 Road Based Emissions") + 
  ggtitle("Aggregate Road Based Emissions in Baltimore - 1999-2008")
print(g)
dev.off()