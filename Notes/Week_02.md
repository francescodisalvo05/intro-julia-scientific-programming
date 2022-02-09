## Week 02

#### Managing csv files

##### Read file

```julia
wikiEVDraw = DelimitedFiles.readdlm("../Assets/wikipediaEVDraw.csv", ',') 
```

##### Manipulate dates

First, we convert the data from "25 Nov 2015" to 2015-11-25T00:00:00.

```julia
date_column = wikiEVDraw[:,1]

for idx = 1:length(date_column)
    date_column[idx] = Dates.DateTime(date_column[idx], "d u y")
end
```

After that we convert the date as an incremental variable, starting from the day 0 of the epidemic (22 March 2014 - position 54).

```julia
daysincemar22(x) = Dates.datetime2rata(x) - Dates.datetime2rata(date_column[54])
epidays = Array{Int64}(undef,54)
for idx = 1:length(date_column)
    epidays[idx] = daysincemar22(date_column[idx])
end
```

Finally, we can update the column and store the whole dataset in a new CSV file.

```julia
wikiEVDraw[:,1] = epidays
DelimitedFiles.writedlm("../Assets/WikipediaEVDdatesconverted.csv", wikiEVDraw, ',')
```
#### Plots

In order to plot, we extract the dates (x-axis) and the number of cases (y-axis).

```julia
epidays = EVDdata[:, 1]  
allcases = EVDdata[:, 2] 
```

Then, we start the backend that will manage the plots.

```julia
gr() 
```

Finally we are able to plot the data, defining title, labels, line, marker and so on.

```julia
plot(epidays, allcases,
     title = "West African EVD epidemic", 
     xlabel = "Days since 22 March 2014",
     ylabel = "Total cases to date",
     marker = (:diamond, 8),  
     line = (:path, "gray"),  
     legend = false,
     grid = false)    

savefig("../Assets/EVD.png")
```

<p align="center">
<img src="../Assets/EVD.png">
</p>

> The code is available [here](../JuliaFiles/week_02_convert_dates.jl) and [here](../JuliaFiles/week_02_plots.jl). 