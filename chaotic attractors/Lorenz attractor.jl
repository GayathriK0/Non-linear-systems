using DynamicalSystems, Plots, DifferentialEquations

begin
	plotly()
	GC
end

function ls!(du,u,p,t)
  x,y,z=u
  σ,ρ,β=p
  du[1] = σ*(y-x)
  du[2] = (x*(ρ-z))-y
  du[3]=(x*y)-(β*z)
  return
end

begin
	state=[1.5,0.6,1.0]
	σ=10
    ρ=28
	β=8/3
	p=[σ,ρ,β]
	lsl = ContinuousDynamicalSystem(ls!,state,p)
	tr = trajectory(lsl, 2000.0, Ttr = 1000)
end
#Time series
plot(tr[:1][:,1])
#Phase portrait
plot(tr[:1][:,1],tr[:1][:,2])
#3D
plot(tr[:1][:,1],tr[:1][:,2],tr[:1][:,3])
