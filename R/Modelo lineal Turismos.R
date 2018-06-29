library(dplyr)

turismos=read.csv2("data/turismos.csv")

summary(turismos)

turismos$Año=as.factor(turismos$Año)

modeloturismos=lm(Turismos ~ PIB, data = turismos)
summary(modeloturismos)

plot(turismos$PIB, turismos$Turismos, xlab = "PIB", ylab = "Turismos")
abline(modeloturismos)

hist(modeloturismos$residuals)
qqnorm(modeloturismos$residuals); qqline(modeloturismos$residuals,col=2)

confint(modeloturismos,level=0.95)

#ANDALUCIA
        
modeloandalucia=lm(Turismos~PIB,data=Andalucia)

summary(modeloandalucia)
Andalucia = turismos[turismos$Comunidad=="ANDALUCÍA",]
Andalucia$Predict = predict(modeloandalucia, type = 'response')

plot(Andalucia$PIB, Andalucia$Turismos, xlab = "PIB", ylab = "Turismos")
abline(modeloandalucia)

Andalucia = cbind(Andalucia,predict(modeloandalucia, Andalucia, interval = 'prediction', level = 0.90))

#MADRID

Madrid = turismos[turismos$Comunidad=="MADRID, COMUNIDAD DE",]
modelomadrid=lm(Turismos~PIB,data=Madrid)
summary(modelomadrid)

plot(Madrid$PIB, Madrid$Turismos, xlab = "PIB", ylab = "Turismos")
abline(modelomadrid)

Madrid$Predict = predict(modelomadrid, type = 'response')

Madrid = cbind(Madrid, predict(modelomadrid, Madrid, interval = 'prediction', level = 0.95))

#ESTIMACIONES PIB

estimaciones = read.csv2("data/estimacionpib.csv")

turismos2017 = turismos[turismos$Año == '2017', c(1,3)]

estimaciones2018 = left_join(estimaciones,turismos2017,by=c("Comunidad"="Comunidad"))

estimaciones2018$PIB = estimaciones2018$PIB * ((estimaciones2018$var/100)+1)

#PREDICCIÓN MADRID

prediccionmadrid = estimaciones2018[estimaciones2018$Comunidad == 'MADRID, COMUNIDAD DE',c(1,3)]

predict(modelomadrid, prediccionmadrid) #455111.7
intervalo = predict(modelomadrid, prediccionmadrid,interval = "prediction", level = 0.90)

confint(modelomadrid, level = 0.95)

prediccionmadrid$predict = predict(modelomadrid, prediccionmadrid)

prediccionmadrid = cbind(prediccionmadrid, intervalo)

#PREDICCIÓN ANDALUCIA

prediccionandalucia = estimaciones2018[estimaciones2018$Comunidad == 'ANDALUCÍA',c(1,3)]

predict(modeloandalucia, prediccionandalucia)  #207719.7
predict(modeloandalucia, prediccionandalucia, interval = 'prediction', level = 0.9)

prediccionandalucia$predict = predict(modeloandalucia, prediccionandalucia)


