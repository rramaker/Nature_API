library(jsonlite)
item1 = readline(prompt="Enter first search term: ")
item2 = readline(prompt="Enter second search term: ")
maxrecords = readline(prompt="Enter maximum records desired: ")
outputname = readline(prompt= "Enter a unique file output name (example = ~/nature_result.csv): ")
url = paste("http://api.nature.com/content/opensearch/request?queryType=searchTerms&query=", item1, "+", item2, "&maximumRecords=", maxrecords, "&httpAccept=application/json&sortKeys=publicationDate,pam,0", sep="")
jsonData <- fromJSON(url)
Title=jsonData$feed$entry$title
Link=jsonData$feed$entry$link
output = data.frame(Title,Link)
write.csv(output, file=outputname)
print("Your file has been loaded to location specified")
