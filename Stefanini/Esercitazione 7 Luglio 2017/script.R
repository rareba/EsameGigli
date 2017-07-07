load("~/Visual Studio 2017/Projects/MABIDA2017/Stefanini/Esercitazione 7 Luglio 2017/otoluidineCS.RData")

# Prendo le osservazioni con doseN = 1000
df = subset(workDF, workDF$doseN == 1000)

# Calcolo media, varianza e varianza ML
lambdadot = mean(df$count)
var(df$count)
var(df$count) * 9 / 10

modPoisson = glm(count ~ 1, data = df, family = "poisson")
coefficients(modPoisson)

xgrid = 0:7
ygrid = dpois(xgrid, lambdadot)
barplot(ygrid, names.arg = paste(xgrid))


require(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

mydata = list()
mydata$Yobs = df$count
mydata$N = length(mydata$Yobs)
names(mydata)

modello = 
'

data{

    int<lower=1> N;
    int<lower=0> Yobs[N];

}

transformed data{}

parameters{

    real < lower = 0 > lambda;
}

transformed parameters{}

model{
    
    for(osser in 1:N)
    {

        Yobs[osser] ~    poisson(lambda);

    }

    lambda ~ uniform(0,35);

}

'

inizializza = function() {

    list(lambda = 7+runif(1,-6,6))

}

iniTime = date()

fit = stan(
           model_code = modello,
           data = mydata,
           iter = 15000,
           chains = 3,
           warmup = 5000,
           thin = 5,
           init = inizializza()
           )

endTime <- date();
c(iniTime = iniTime, endTime = endTime)

pairs(fit)
summary(fit)
plot(fit)
traceplot(fit)

require(ggmcmc)
ggs_traceplot(outSim)