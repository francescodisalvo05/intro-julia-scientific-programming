function updateModel(vector)
    s = vector[1];
    i = vector[2];
    r = vector[3];

    updated_s = s - lambda*s*i*dt
    updated_i = i + lambda*s*i*dt - gam*i*dt
    updated_r = r + gam*i*dt

    return [updated_s updated_i updated_r]
end

# initial setup

lambda = 1/20000 # infection rate parameter 
gam = 1/10       # recovery rate parameter  
dt = 0.5         # length of time step in days (two days)
tfinal = 610;    # number of days
s0 = 10000.0     # initial S
i0 = 4.          # initial I 
r0 = 0.          # initial R

nsteps = round(Int64, tfinal/dt)    
resultvals = Array{Float64}(undef, nsteps+1, 3)  
timevec = Array{Float64}(undef, nsteps+1)        
resultvals[1,:] = [s0, i0, r0]  
timevec[1] = 0.     

# loop! 

for step  = 1:nsteps
    resultvals[step+1, :] = updateModel(resultvals[step, :])
    timevec[step+1] = timevec[step] + dt
end

using Plots
gr()

plot(timevec, resultvals,  # we should of course at a minimum provide some labels
title  = "SIR Simulation",
xlabel = "Day",
ylabel = "Population",
label  = ["Susceptibles" "Infecteds" "Removeds"]
)

savefig("Assets/SIR.png")