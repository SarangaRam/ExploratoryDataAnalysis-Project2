
## This first line will likely take a few seconds.
NEI <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/summarySCC_PM25.rds")
SCC <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make 
# a plot answer this question.

totalsByYrTyp <- with(NEI, aggregate(Emissions ~ year + type, subset(NEI, fips == "24510"), sum))

library(ggplot2)

png('~/RProjects/GIT/ExploratoryDataAnalysis-Project2/plot3.png')

g <- ggplot(totalsByYrTyp, aes(year, Emissions, color = type)) +
     geom_line() + 
     xlab("Year") + 
     ylab("Aggregate PM 2.5 Emissions") + 
     ggtitle("Aggregate PM 2.5 Emissions in Baltimore - 1999-2008")
print(g)
dev.off()