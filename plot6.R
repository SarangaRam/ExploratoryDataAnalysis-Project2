
## This first line will likely take a few seconds.
NEI <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/summarySCC_PM25.rds")
SCC <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in 
# motor vehicle emissions?


# Aggregate with subset for Baltimore & LA and type=ON-ROAD
totalsByYr <- aggregate(Emissions ~ year+ fips, subset(NEI, (fips == "24510" | fips == "06037" ) 
                                                    & type =="ON-ROAD"), sum)
totalsByYr$fips[totalsByYr$fips=="24510"]<-"Baltimore"
totalsByYr$fips[totalsByYr$fips=="06037"]<-"Los Angeles"

library(ggplot2)

png('~/RProjects/GIT/ExploratoryDataAnalysis-Project2/plot6.png')
g <- ggplot(totalsByYr, aes(year, Emissions))
g <- g + geom_bar(stat="identity") +
     facet_grid(. ~ fips) + 
     xlab("Year") + 
     ylab("Aggregate PM 2.5 Road Based Emissions") + 
     ggtitle("Comparative Road Based Emissions between Baltimore & LA - 1999-2008")
print(g)
dev.off()