using DelimitedFiles
using Dates

wikiEVDraw = DelimitedFiles.readdlm("../Assets/wikipediaEVDraw.csv", ',') 

# we have to convert the whole date column
# from "25 Nov 2015" to 2015-11-25T00:00:00
# Dates.DateTime(wikiEVDraw[1,1], "d u y")

date_column = wikiEVDraw[:,1]

for idx = 1:length(date_column)
    date_column[idx] = Dates.DateTime(date_column[idx], "d u y")
end

# convert it in an incremental "day", 
# starting from epidemic day 0 (22 March 2014)
# that is the 54 element

daysincemar22(x) = Dates.datetime2rata(x) - Dates.datetime2rata(date_column[54])
epidays = Array{Int64}(undef,54)
for idx = 1:length(date_column)
    epidays[idx] = daysincemar22(date_column[idx])
end

# update the whole column
wikiEVDraw[:,1] = epidays

# write the new CSV file
DelimitedFiles.writedlm("../Assets/WikipediaEVDdatesconverted.csv", wikiEVDraw, ',')