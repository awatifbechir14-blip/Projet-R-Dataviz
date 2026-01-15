###lecture de la base###
library(readxl)
Base<-read_excel("données.xlsx")
View(Base)
is.na(Base) ##verification de la présence des variables manquantes

############ DONNÉES, DATAVIZ ET ANALYSE DES DONNÉES##############

###Présentation du jeu de donné 
ncol(Base) #nombre de variables
nrow(Base) #nombre d'observations
summary(Base$activity_year) #période de couverture 
length(unique(Base$county_code)) # nombre de comté different 
## variable rece_black
##Création de la variable dummy race_black qui prend 1 si l'individu est noir et 0 sinon
Base$race_black<- ifelse(Base$race == "Black", 1, 0)


summary(Base) #résumé statistique des variables####
sd(Base$num_applications, na.rm = TRUE) # ecart-type de la variable sur le nombre de demande de prêt
sd(Base$num_financial_institutions) # ecart-type de la variable du nombre d'institution financière solicité
sd(Base$denial_reason_collateral, na.rm = TRUE) # ecart-type de la variable refus de pret pour garantie insuffisante 
sd(Base$denial_reason_insuff_cash, na.rm = TRUE) # ecart-type de la variable refus de pret pour manque de liquidité
sd(Base$denial_reason_debt_income, na.rm = TRUE) # ecart-type de la variable refus de pret pour ratio dette/revenu élevé
sd(Base$lag_sp_population, na.rm = TRUE) #ecarty-type de la variable sur la taille de la population
sd(Base$lag_sp_unemployment, na.rm = TRUE) #ecarty-type de la variable sur le taux de chomage
sd(Base$lag_sp_medianhhincome, na.rm = TRUE) #ecarty-type de la variable sur le revenu médian 
sd(Base$income, na.rm = TRUE) #ecartype de revenu individuel des emprunteurs

##### statistiques descriptives des variables binaires et qualitatives
table(Base$climate_hazard)
prop.table(table(Base$climate_hazard))*100
table(Base$race)
prop.table(table(Base$race))*100
prop.table(table(Base$race_black))*100


length(unique(Base$county_code))
Base$county_code<-as.factor(Base$county_code)
summary(Base$county_code)
is.na(Base)
is.na(Base$denial_reason_collateral)
