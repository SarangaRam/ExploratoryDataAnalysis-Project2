
## This first line will likely take a few seconds.
NEI <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/summarySCC_PM25.rds")
SCC <- readRDS("~/RProjects/GIT/ExploratoryDataAnalysis-Project2/Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

totalsByYr <- aggregate(Emissions ~ year, NEI, sum)

png('~/RProjects/GIT/ExploratoryDataAnalysis-Project2/plot1.png')
with(totalsByYr, 
       barplot(height=Emissions, names.arg=year,xlab="Years", 
               ylab="Aggregate PM 2.5 Emissions",
               main="Aggregate PM 2.5 Emissions From All Counties 1999-2008") )
dev.off()