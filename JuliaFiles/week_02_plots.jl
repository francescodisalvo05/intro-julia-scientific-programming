using DelimitedFiles
using Plots

EVDdata = DelimitedFiles.readdlm("../Assets/wikipediaEVDdatesconverted.csv", ',')  # don't forget the delimiter!
epidays = EVDdata[:, 1]  
allcases = EVDdata[:, 2] 

gr() # specify the backend

plot(epidays, allcases,
     title = "West African EVD epidemic", 
     xlabel = "Days since 22 March 2014",
     ylabel = "Total cases to date",
     marker = (:diamond, 8),  
     line = (:path, "gray"),  
     legend = false,
     grid = false)    

savefig("../Assets/EVD.png")