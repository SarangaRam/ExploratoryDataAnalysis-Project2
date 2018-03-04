
## This first line will likely take a few seconds.
NEI <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/summarySCC_PM25.rds")
SCC <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

totalsByYr <- aggregate(Emissions ~ year, subset(NEI, fips == "24510"), sum)

png('~/RProjects/GIT/ExploratoryDataAnalysis-Project2/plot2.png')
with(totalsByYr, 
     barplot(height=Emissions, names.arg=year,xlab="Years", 
             ylab="Aggregate PM 2.5 Emissions",
             main="Aggregate PM 2.5 Emissions in Baltimore - 1999-2008") )
dev.off()