## install the packages that are not yet instaled
setwd("C:\\wamp\\www\\RCA_RRM\\data")
# install.packages('jsonlite')
# install.packages('car')
# install.packages('rgdal')
# install.packages('stringr')
# install.packages('xlsx')

library(jsonlite)
library(car)
library(rgdal)
library(stringr)
library(xlsx)

rm()


alerte<-read.xlsx("ActivityInfo_Export_current.xls",1,encoding="UTF-8",startRow=2)
names(alerte)<-c("RRM-Interventions_-_ALERTES_SiteId",
                            "DateCreated","Date1","Date2","Partner","OCHA_village_v2","Axe","AlerteID_(ORG_XXX_YYYYMMDD)","Date_présumée_du_choc","Nombre_de_localités/villages/sites_afféctés",
                            "Population_affectee_-_total_menages","Population_affectee_-_total_individus","Nature_du_choc_Autre","Nature_du_choc_Catastrophe_naturelle","Nature_du_choc_Violences",
                            "Population_affectee_Deplaces","Population_affectee_Retours","Population_affectee_Communaute_hote","Population_affectee_Autre","Acces_humanitaire_Oui",
                            "Acces_humanitaire_Non_-_logistique","Acces_humanitaire_Non_-_securite","Acces_humanitaire_Non_-_autre","Continue_Investigation_Oui","Continue_Investigation_Non",
                            "Alerte_en_cours_Oui","Alerte_en_cours_Non","Code_Préfecture","Préfecture","Code_Sous-Préfecture","Sous-Préfecture","Code_Commune","Commune",
                            "Code_Arrondissement","Arrondissement","Longitude","Latitude","Comments")

MEX<-read.xlsx("ActivityInfo_Export_current.xls",2,encoding="UTF-8",startRow=2)
names(MEX)<-c("RRM-Interventions - MISSION EXPLORATOIRE_SiteId","DateCreated","Date1","Date2","Partner","OCHA_village_v2","Axe","AlerteID","Nombre de localités/villages/sites afféctés",
              "Nature de la crise  - Description","Population affectee - total menages","Population affectee - total individus","Nature du choc_Violence","Nature du choc_Catastrophe naturelle",
              "Nature du choc_Autre","Type de population_Communaute hote","Type de population_Retours","Type de population_Autre","Type de population_Deplaces","Statut du MEX_Completé",
              "Statut du MEX_Prévu","Statut du MEX_En cours","Statut du MEX_En attente (délais)","Statut du MEX_Annulé","Cause de delais_Sécurité (pas d_accés humanitaire)",
              "Cause de delais_Changement de contexte/ a suivre","Cause de delais_Logistique (pas d_accés)","Cause de delais_Autre","Cause de delais_NA",
              "Cause d_annulation_Conversion en MSA","Cause d_annulation_Autre","Cause d_annulation_NA","Proposition d_action_MSA complete",
              "Proposition d_action_Evaluation sectorielle","Proposition d_action_Monitoring protection","Proposition d_action_Rehabilitation acces logistique",
              "Proposition d_action_Plaidoyer acces securitaire","Proposition d_action_Suivi du retour des déplacés",
              "Proposition d_action_Intervention(s) directe(s)","Proposition d_action_Pas d_action","Proposition d_action_Autre",
              "Code Préfecture","Préfecture","Code Sous-Préfecture","Sous-Préfecture","Code Commune","Commune","Code Arrondissement",
              "Arrondissement","Longitude","Latitude","Comments")

MSA<-read.xlsx("ActivityInfo_Export_current.xls",3,encoding="UTF-8",startRow=2)
names(MSA)<-c("RRM-Interventions_-_MSA_SiteId","DateCreated","Date1","Date2","Partner","OCHA_village_v2","Axe","AlerteID","Nombre_de_localités_villages_sites_afféctés",
              "Menage_déplacés","Individus_déplacés","Menage_retournes","Individus_returnes","Menages_accueil","Individus_accueil","Score_NFI",
              "de_menages_vivant_ds_un_abris_en_dessous_des_standard","des_menages_ayant_acces_a_une_latrine_hygienique",
              "des_menages_avec_un_source_d_eau_potable_amelioree","Taux_diarrhée_chez_les_enfants_de_moins_de_5_ans_au_cours_des_2_dernières_semaines",
              "Score_Consommation_alimentaire","score_de_Consommation_alimentaire_-_Acceptable","score_de_Consommation_alimentaire_-_Limite",
              "score_de_Consommation_alimentaire_-_Pauvre","Score_startegie_de_survie","decole_fonctionnelles","MSAcount","Population_affectees",
              "Statut_du_MSA_Completé","Statut_du_MSA_Prévu","Statut_du_MSA_En_cours","Statut_du_MSA_En_attente_délais_","Statut_du_MSA_Annulé",
              "Cause_de_delais_Sécurité_pas_d_accés_humanitaire_","Cause_de_delais_Changement_de_contexte_a_suivre","Cause_de_delais_Logistique_pas_d_accés_",
              "Cause_de_delais_NA","Cause_d_annulation_Conversion_en_MEX","Cause_d_annulation_Planification_d_une_meme_evaluation_par_une_autre_agence",
              "Cause_d_annulation_Autre","Cause_d_annulation_NA","Recommandation_s_du_MSA_Intervention_Abris_NFI","Recommandation_s_du_MSA_Intervention_WASH",
              "Recommandation_s_du_MSA_Pas_d_intervention","Recommandation_s_du_MSA_Intervention_Santé_Nutrition","Recommandation_s_du_MSA_Securité_Alimentaire",
              "Recommandation_s_du_MSA_Intervention_Protection","Recommandation_s_du_MSA_Intervention_Education","Recommandation_s_du_MSA_Intervention_Logistique",
              "Code_Préfecture","Préfecture","Code_Sous-Préfecture","Sous-Préfecture","Code_Commune","Commune","Code_Arrondissement","Arrondissement","Longitude","Latitude","Comments")

inter<-read.xlsx("ActivityInfo_Export_current.xls",4,encoding="UTF-8",startRow=2)
names(inter)<-c("RRM_Interventions_INTERVENTION_SiteId","DateCreated","Date1","Date2","Partner","OCHA_village_v2","Axe","AlerteID",
                "Nombres_de_localités_villages_sites_afféctés","Individus_bénéficiaires_NFI_total","individus_bénéficiaires_NFI_déplacés",
                "individus_bénéficiaires_NFI_accueil","Ménages_bénéficiaires_NFI_total","ménages_bénéficiaires_NFI_déplacés",
                "ménages_bénéficiaires_NFI_accueil","Kits_NFI_total","KITS_NFI_déplacés","Kits_NFI_accueil","NFI_Savons_total",
                "NFI_savon_déplacés","NFI_savon_accueil","NFI_Couvertures_total","NFI_couvertures_déplacés","NFI_couvertures_accueil",
                "NFI_Nattes_total","NFI_nattes_déplacés","NFI_Nattes_accueil","NFI_bidons","NFI_bidons_déplacés","NFI_bidons_accueil",
                "NFI_Moustiquaires","NFI_Moustiquaires_déplacés","NFI_Moustiquaires_accueil","NFI_Bâches","NFI_Baches_déplacés","NFI_Baches_accueil",
                "NFI_Torche","NFI_torche_déplacés","NFI_torche_accueil","NFI_Seau","NFI_seau_déplacés","NFI_seau_accueil","NFI_Kit_cuisine_total",
                "NFI_Kit_cuisine_déplacés","NFI_Kit_cuisine_accueil","NFI_Vêtements_enfants_total","NFI_Vêtements_enfants_déplacés","NFI_Vêtements_enfants_accueil",
                "NFI_Vêtement_bébé","Kits_VIVRES","Vivres_Huile_2L","Vivres_Plumpy_Sup","Vivres_CSB+_12,5Kg","Vivres_Riz_25kg","Individus_bénéficiaires_WASH_total",
                "individus_bénéficiaires_WASH_déplacés","individus_bénéficiaires_WASH_accueil","Nombres_de_blocs_de_latrines","nombres_de_latrines_installées",
                "réhabilitation_de_forage_ou_source_d_eau","Redynamisation_du_comité_de_gestion_de_la_source_d_eau","Sensibilisation_de_la_communauté_lavage_de_main",
                "Sensibilisation_de_la_communauté_sur_les_bonnes_pratiques_d’hygiène.","Mise_en_place_d_un_comité_de_gestion_des_latrines","Autre_intervention_WASH",
                "Abris","interventioncount","Type_d_intervention_NFI_WASH","Type_d_intervention_NFI","Type_d_intervention_WASH","Statut_de_l_intervention_NFI_Completé",
                "Statut_de_l_intervention_NFI_Prévu","Statut_de_l_intervention_NFI_En_cours","Statut_de_l_intervention_NFI_En_attente_délais_","Statut_de_l_intervention_NFI_Annulé",
                "Statut_de_l_intervention_NFI_NA","Cause_de_délais_NFI_Sécurité_pas_d_accés_humanitaire_","Cause_de_délais_NFI_Changement_de_contexte_a_suivre",
                "Cause_de_délais_NFI_Logistique_pas_d_accés_","Cause_de_délais_NFI_NA","Cause_d_annulation_NFI_Possibilité_d_une_intervention_par_une_autre_agence",
                "Cause_d_annulation_NFI_Sécurité","Cause_d_annulation_NFI_NA","Statut_d_intervention_WASH_Completé","Statut_d_intervention_WASH_Prévu",
                "Statut_d_intervention_WASH_En_cours","Statut_d_intervention_WASH_En_attente_délais_","Statut_d_intervention_WASH_Annulé",
                "Statut_d_intervention_WASH_NA","Cause_de_delais_WASH_Sécurité_pas_d_accés_humanitaire_","Cause_de_delais_WASH_Changement_de_contexte_a_suivre",
                "Cause_de_delais_WASH_Logistique_pas_d_accés_","Cause_de_delais_WASH_NA","Cause_d_annulation_WASH_Possibilité_d_une_intervention_par_une_autre_agence",
                "Cause_d_annulation_WASH_Sécurité","Cause_d_annulation_WASH_NA","Code_Préfecture","Préfecture","Code_Sous_Préfecture","Sous_Préfecture","Code_Commune",
                "Commune","Code_Arrondissement","Arrondissement","Longitude","Latitude","Comments")

PDM<-read.xlsx("ActivityInfo_Export_current.xls",5,encoding="UTF-8",startRow=2)

dsn <-"caf_admbnd3_200k_sigcaf.shp"
#ogrListLayers(dsn)
#ogrInfo(dsn=dsn, layer="sous_pref")
pref<-readOGR(dsn=dsn,layer="caf_admbnd3_200k_sigcaf",encoding="UTF-8")

for (i in 1:4)
#i=1
  {
  if(i==1){db<-alerte}
  if(i==2){db<-MEX}
  if(i==3){db<-MSA}
  if(i==4){db<-inter}
  if(i==5){db<-PDM}
    
  
  db<-as.data.frame(db,stringsAsFactors=FALSE)
  names(db)<-gsub("\\s|-|_()+, ", "_",names(db))
  names(db)<-gsub("__", "_",names(db))
  names(db)<-gsub("__", "_",names(db))
  
  geo<-rep("NA",length(db[,1]))
  
  for (co in 1:length(db[,1]))
  {
    geo[co]<-paste(db$Latitude[co],db$Longitude[co],sep=",")
  }
  
  del<-c(which(names(db)=="Comments")*-1)
  db<-db[,del]
  db<-cbind(db,geo)
  db<-as.data.frame(db)
  
  gpdate<-which(str_detect(names(db), "Date") %in% FALSE)

  for (j in gpdate){
    db[,j]<-recode(db[,j],"TRUE=1;FALSE=0;NA=0")
  }
  
  proj_layer<-CRS("+proj=longlat +datum=WGS84")
  coordinates(db) = ~Longitude+Latitude
  proj4string(db)<-"+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"#cities<-readOGR(RRM,layer="MSA")
  join<-over(db,pref)
  join<-join[,c(4,6,8,10)]
  
  db$Date1<-as.Date(db$Date1,"%Y-%m-%d")
  db$Date1<-as.Date(db$Date2,"%Y-%m-%d")
  month<- format(db$Date1, "%Y-%m")
  year<- format(db$Date1, "%Y")
  db<-cbind(db,month,year,join)
  db<-as.data.frame(db,stringsAsFactors=FALSE)
  
  
  if(i==1){
  
  db$Acces_humanitaire_Oui<-ifelse(db$Acces_humanitaire_Oui==1,"Oui",NA)
  db$Acces_humanitaire_Non_logistique<-ifelse(db$Acces_humanitaire_Non_logistique==1,"Non - logistique",NA)
  db$Acces_humanitaire_Non_autre<-ifelse(db$Acces_humanitaire_Non_autre==1,"Non - autre",NA)
  db$Acces_humanitaire_Non_securite<-ifelse(db$Acces_humanitaire_Non_securite==1,"Non - securité",NA)
  
  db$Continue_Investigation_Oui<-ifelse(db$Continue_Investigation_Oui==1,"Oui",NA)
  db$Continue_Investigation_Non<-ifelse(db$Continue_Investigation_Non==1,"Non",NA)
  
  #db$Alerte_en_cours_Non<-ifelse(db$Alerte_en_cours_Non==1,"Non",NA)
  db$Alerte_en_cours_Oui<-ifelse(db$Alerte_en_cours_Oui==1,"Oui","Non")
  
  db$Nature_du_choc_Catastrophe_naturelle<-ifelse(db$Nature_du_choc_Catastrophe_naturelle,"Castastrophe naturelle",NA)
  db$Nature_du_choc_Violences<-ifelse(db$Nature_du_choc_Violences==1,"Violence",NA)
  #db$Nature_du_choc_Autre<-ifelse(db$Nature_du_choc_Autre==1,"Autre",NA)
  
  db$Population_affectee_Communaute_hote<-ifelse(db$Population_affectee_Communaute_hote==1,"Communautés d'accueil",NA)
  db$Population_affectee_Deplaces<-ifelse(db$Population_affectee_Deplaces==1,"Deplacés",NA)
  db$Population_affectee_Retours<-ifelse(db$Population_affectee_Retours==1,"Retours",NA)
  db$Population_affectee_Autre<-ifelse(db$Population_affectee_Autre==1,"Autre",NA)
  
  acces<-paste(db$Acces_humanitaire_Oui,
               db$Acces_humanitaire_Non_logistique,
               db$Acces_humanitaire_Non_autre,
               db$Acces_humanitaire_Non_securite,sep=" ")
  
  continu<-paste(db$Continue_Investigation_Oui,
                 db$Continue_Investigation_Non,sep=" ")
  
  alerte_cours<-db$Alerte_en_cours_Oui
  
  nature<-paste(
    db$Nature_du_choc_Catastrophe_naturelle,
    db$Nature_du_choc_Violences,sep=" ")
  
  pop_affect<-paste(
    db$Population_affectee_Communaute_hote,
    db$Population_affectee_Deplaces,
    db$Population_affectee_Retours,
    db$Population_affectee_Autre,sep=" ")
  
  
  type_inter<-rep("Alerte",length(db[,1]))
  
  db<-cbind(db,acces,continu,alerte_cours,nature,pop_affect,type_inter)
  
  db<-as.data.frame(sapply(db,gsub,pattern="NA ",replacement=""))
  db<-as.data.frame(sapply(db,gsub,pattern=" NA",replacement=""))
  db<-as.data.frame(sapply(db,gsub,pattern="  ",replacement=" "))
  db<-as.data.frame(sapply(db,str_trim))
  
  write.csv(db,"RRM_incident.csv",row.names=FALSE,fileEncoding = "UTF-8")
  
  
  db$Latitude <- as.numeric(levels(db$Latitude)[db$Latitude])
  db$Longitude <- as.numeric(levels(db$Longitude)[db$Longitude])
  alerte_geo<-SpatialPointsDataFrame(db[,36:37],db)
  
  #Write as geojson
  writeOGR(alerte_geo,"alerte_geo",'alerte_geo2', driver='GeoJSON',delete_dsn=TRUE,overwrite_layer=TRUE) 
  g<-read.table("alerte_geo",header=FALSE,sep="#",stringsAsFactor =FALSE,quote="")
  g[1,]<-paste("var alerte = ",as.character(g[1,]))
  
  write.table(g,"alerte.json",row.names=FALSE,col.names=FALSE,quote=FALSE)
  
  
  
  
  }
  
##################################################################
if(i==2){

db$Proposition_d_action_Plaidoyer_acces_securitaire <-ifelse(db$Proposition_d_action_Plaidoyer_acces_securitaire==1,"Plaidoyer accès sécuritaire",NA)
db$Proposition_d_action_Intervention.s._directe.s. <-ifelse(db$Proposition_d_action_Intervention.s._directe.s.==1,"Intervention directe",NA)
db$Proposition_d_action_MSA_complete <-ifelse(db$Proposition_d_action_MSA_complete==1,"MSA complète",NA)
db$Proposition_d_action_Rehabilitation_acces_logistique  <-ifelse(db$Proposition_d_action_Rehabilitation_acces_logistique==1,"Réhabilitation accès logistique",NA)
db$Proposition_d_action_Evaluation_sectorielle  <-ifelse(db$Proposition_d_action_Evaluation_sectorielle==1,"Evaluation sectorielle",NA)
db$Proposition_d_action_Autre   <-ifelse(db$Proposition_d_action_Autre ==1,"Autre",NA)
db$Proposition_d_action_Monitoring_protection  <-ifelse(db$Proposition_d_action_Monitoring_protection==1,"Suivi protection",NA)
db$Proposition_d_action_Suivi_du_retour_des_déplacés <-ifelse(db$Proposition_d_action_Suivi_du_retour_des_déplacés==1,"Suivi de retour des déplacés",NA)
db$Nature_du_choc_Violence <-ifelse(db$Nature_du_choc_Violence==1,"Violence",NA)
db$Nature_du_choc_Catastrophe_naturelle <-ifelse(db$Nature_du_choc_Catastrophe_naturelle==1,"Catastrophe naturelle",NA)
db$Type_de_population_Deplaces <-ifelse(db$Type_de_population_Deplaces==1,"Deplacés",NA)
db$Type_de_population_Autre <-ifelse(db$Type_de_population_Autre==1,"Autre",NA)
db$Type_de_population_Communaute_hote <-ifelse(db$Type_de_population_Communaute_hote==1,"Communautés d'accueil",NA) 
db$Type_de_population_Retours <-ifelse(db$Type_de_population_Retours ==1,"Retours",NA)

proposition<-paste(db$Proposition_d_action_Plaidoyer_acces_securitaire,db$Proposition_d_action_Intervention.s._directe.s.,
                   db$Proposition_d_action_MSA_complete,db$Proposition_d_action_Rehabilitation_acces_logistique,
                   db$Proposition_d_action_Evaluation_sectorielle,db$Proposition_d_action_Autre,
                   db$Proposition_d_action_Monitoring_protection,db$Proposition_d_action_Suivi_du_retour_des_déplacés,sep=" ")

Nature_choc<-paste(db$Nature_du_choc_Violence,db$Nature_du_choc_Catastrophe_naturelle,sep=" ")
pop_type<-paste(db$Type_de_population_Deplaces,db$Type_de_population_Autre,db$Type_de_population_Communaute_hote,db$Type_de_population_Retours,sep=" ")


type_inter<-rep("MEX",length(db[,1]))

db<-cbind(db,pop_type,proposition,Nature_choc,type_inter)

db<-as.data.frame(sapply(db,gsub,pattern="NA ",replacement=""))
db<-as.data.frame(sapply(db,gsub,pattern=" NA",replacement=""))
db<-as.data.frame(sapply(db,gsub,pattern="  ",replacement=" "))
db<-as.data.frame(sapply(db,str_trim))



write.csv(db,"RRM_MEX.csv",row.names=FALSE,fileEncoding = "UTF-8")

db$Latitude <- as.numeric(levels(db$Latitude)[db$Latitude])
db$Longitude <- as.numeric(levels(db$Longitude)[db$Longitude])
MEX_geo<-SpatialPointsDataFrame(db[,50:51],db)

#Write as geojson
writeOGR(MEX_geo,"MEX_geo",'MEX_geo2', driver='GeoJSON',delete_dsn=TRUE,overwrite_layer=TRUE) 
g<-read.table("MEX_geo",header=FALSE,sep="#",stringsAsFactor =FALSE,quote="")
g[1,]<-paste("var MEX = ",as.character(g[1,]))

write.table(g,"MEX.json",row.names=FALSE,col.names=FALSE,quote=FALSE)





}


if(i==3){
  db$Recommandation_s_du_MSA_Pas_d_intervention<-ifelse(db$Recommandation_s_du_MSA_Pas_d_intervention==1,"Pas d'intervention",NA)
  #db$Recommandation_s_du_MSA_Intervention_WASH<-ifelse(db$Recommandation_s_du_MSA_Intervention_WASH==1,"Intervention_WASH",NA)
  db$Recommandation_s_du_MSA_Intervention_Abris_NFI<-ifelse(db$Recommandation_s_du_MSA_Intervention_Abris_NFI==1,"Intervention abris",NA)
  db$Recommandation_s_du_MSA_Intervention_WASH<-ifelse(db$Recommandation_s_du_MSA_Intervention_WASH==1,"Intervention EHA",NA)
  db$Recommandation_s_du_MSA_Intervention_Santé_Nutrition<-ifelse(db$Recommandation_s_du_MSA_Intervention_Santé_Nutrition==1,"Intervention santé/nutrition",NA)
  db$Recommandation_s_du_MSA_Securité_Alimentaire<-ifelse(db$Recommandation_s_du_MSA_Securité_Alimentaire==1,"Intervention sécurité alimentaire",NA)
  
  recommandation<-paste(db$Recommandation_s_du_MSA_Pas_d_intervention,
                        #db$Recommandation_s_du_MSA_Intervention_WASH,
                        db$Recommandation_s_du_MSA_Intervention_Abris_NFI,
                        db$Recommandation_s_du_MSA_Intervention_WASH,
                        db$Recommandation_s_du_MSA_Intervention_Santé_Nutrition,
                        db$Recommandation_s_du_MSA_Securité_Alimentaire,sep=" ")
  
  db<-cbind(db,recommandation)
  db<-as.data.frame(sapply(db,gsub,pattern="NA ",replacement=""))
  db<-as.data.frame(sapply(db,gsub,pattern=" NA",replacement=""))
  db<-as.data.frame(sapply(db,gsub,pattern="  ",replacement=" "))
  db<-as.data.frame(sapply(db,str_trim))
  
# names(db)<-c("field","id","locationName","partnerName","activity","activityName","startDate","endDate","MSAcount","score_de_Consommation_alimentaire_Pauvre","Individus_IDPs","des_menages_ayant_acces_a_une_latrine_hygienique",
#             "de_menages_vivant_ds_un_abris_en_dessous_des_standard","Menage_retournes","Menages_hote","Score_NFI","Individus_returnes","score_de_Consommation_alimentaire_Limite","score_de_Consommation_alimentaire_Acceptable",
#               "Individus_hote","decole_fonctionnelles","Menage_IDPs","Score_startegie_de_survie","des_menages_avec_un_source_deau_potable_amelioree","Score_Consommation_alimentaire","Taudiarrhee_chez_les_enfants_de_moins_de_5_ans__au_cours_des_2_dernieres_semaines",
#               "Recommandations_du_MSAPas_dintervention","Recommandations_du_MSAIntervention_SanteNutrition","Recommandations_du_MSASecurite_Alimentaire","Recommandations_du_MSAIntervention_AbrisNFI",
#               "Recommandations_du_MSAIntervention_WASH","Recommandations_du_MSA_Intervention_Protection","Recommandations_du_MSA_Intervention_Education","Cause delais","Cause_annulation",
#               "type1","geo","X","Y","month","year","REGION_NOM","PREF_NOM","SPREF_NOM","COM_NOM","recommandation")
  
  db<-as.data.frame(db,stringsAsFactors=FALSE)
  
  score_de_Consommation_alimentaire_PauvreBorder<-as.numeric(levels(db$score_de_Consommation_alimentaire_Pauvre)[db$score_de_Consommation_alimentaire_Pauvre])+
    as.numeric(levels(db$score_de_Consommation_alimentaire_Limite)[db$score_de_Consommation_alimentaire_Limite])
  
  score_de_Consommation_alimentaire_PauvreBorder<-
    ifelse(score_de_Consommation_alimentaire_PauvreBorder<20,"0-20%",
           ifelse(score_de_Consommation_alimentaire_PauvreBorder<40,"20-39%",
                  ifelse(score_de_Consommation_alimentaire_PauvreBorder<60,"40-59%",
                         ifelse(score_de_Consommation_alimentaire_PauvreBorder<80,"60-79%",
                                ifelse(score_de_Consommation_alimentaire_PauvreBorder<=100,"80-100%")))))
  
  db$score_de_Consommation_alimentaire_Pauvre<-
    ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Pauvre)[db$score_de_Consommation_alimentaire_Pauvre])<20,"0-20%",
           ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Pauvre)[db$score_de_Consommation_alimentaire_Pauvre])<40,"20-39%",
                  ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Pauvre)[db$score_de_Consommation_alimentaire_Pauvre])<60,"40-59%",
                         ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Pauvre)[db$score_de_Consommation_alimentaire_Pauvre])<80,"60-79%",
                                ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Pauvre)[db$score_de_Consommation_alimentaire_Pauvre])<=100,"80-100%")))))
  
  db$score_de_Consommation_alimentaire_Limite<-
    ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Limite)[db$score_de_Consommation_alimentaire_Limite])<20,"0-20%",
           ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Limite)[db$score_de_Consommation_alimentaire_Limite])<40,"20-39%",
                  ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Limite)[db$score_de_Consommation_alimentaire_Limite])<60,"40-59%",
                         ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Limite)[db$score_de_Consommation_alimentaire_Limite])<80,"60-79%",
                                ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Limite)[db$score_de_Consommation_alimentaire_Limite])<=100,"80-100%")))))
  
  db$score_de_Consommation_alimentaire_Acceptable<-
    ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Acceptable)[db$score_de_Consommation_alimentaire_Acceptable])<20,"0-20%",
           ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Acceptable)[db$score_de_Consommation_alimentaire_Acceptable])<40,"20-39%",
                  ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Acceptable)[db$score_de_Consommation_alimentaire_Acceptable])<60,"40-59%",
                         ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Acceptable)[db$score_de_Consommation_alimentaire_Acceptable])<80,"60-79%",
                                ifelse(as.numeric(levels(db$score_de_Consommation_alimentaire_Acceptable)[db$score_de_Consommation_alimentaire_Acceptable])<=100,"80-100%")))))
  
  db$des_menages_ayant_acces_a_une_latrine_hygienique<-
    ifelse(as.numeric(levels(db$des_menages_ayant_acces_a_une_latrine_hygienique)[db$des_menages_ayant_acces_a_une_latrine_hygienique])<20,"0-20%",
           ifelse(as.numeric(levels(db$des_menages_ayant_acces_a_une_latrine_hygienique)[db$des_menages_ayant_acces_a_une_latrine_hygienique])<40,"20-39%",
                  ifelse(as.numeric(levels(db$des_menages_ayant_acces_a_une_latrine_hygienique)[db$des_menages_ayant_acces_a_une_latrine_hygienique])<60,"40-59%",
                         ifelse(as.numeric(levels(db$des_menages_ayant_acces_a_une_latrine_hygienique)[db$des_menages_ayant_acces_a_une_latrine_hygienique])<80,"60-79%",
                                ifelse(as.numeric(levels(db$des_menages_ayant_acces_a_une_latrine_hygienique)[db$des_menages_ayant_acces_a_une_latrine_hygienique])<=100,"80-100%")))))
  
  db$de_menages_vivant_ds_un_abris_en_dessous_des_standard<-
    ifelse(as.numeric(levels(db$de_menages_vivant_ds_un_abris_en_dessous_des_standard)[db$de_menages_vivant_ds_un_abris_en_dessous_des_standard])<20,"0-20%",
           ifelse(as.numeric(levels(db$de_menages_vivant_ds_un_abris_en_dessous_des_standard)[db$de_menages_vivant_ds_un_abris_en_dessous_des_standard])<40,"20-39%",
                  ifelse(as.numeric(levels(db$de_menages_vivant_ds_un_abris_en_dessous_des_standard)[db$de_menages_vivant_ds_un_abris_en_dessous_des_standard])<60,"40-59%",
                         ifelse(as.numeric(levels(db$de_menages_vivant_ds_un_abris_en_dessous_des_standard)[db$de_menages_vivant_ds_un_abris_en_dessous_des_standard])<80,"60-79%",
                                ifelse(as.numeric(levels(db$de_menages_vivant_ds_un_abris_en_dessous_des_standard)[db$de_menages_vivant_ds_un_abris_en_dessous_des_standard])<=100,"80-100%")))))
  
  db$decole_fonctionnelles<-
    ifelse(as.numeric(levels(db$decole_fonctionnelles)[db$decole_fonctionnelles])<20,"0-20%",
           ifelse(as.numeric(levels(db$decole_fonctionnelles)[db$decole_fonctionnelles])<40,"20-39%",
                  ifelse(as.numeric(levels(db$decole_fonctionnelles)[db$decole_fonctionnelles])<60,"40-59%",
                         ifelse(as.numeric(levels(db$decole_fonctionnelles)[db$decole_fonctionnelles])<80,"60-79%",
                                ifelse(as.numeric(levels(db$decole_fonctionnelles)[db$decole_fonctionnelles])<=100,"80-100%")))))
  
  db$des_menages_avec_un_source_d_eau_potable_amelioree<-
    ifelse(as.numeric(levels(db$des_menages_avec_un_source_d_eau_potable_amelioree)[db$des_menages_avec_un_source_d_eau_potable_amelioree])<20,"0-20%",
           ifelse(as.numeric(levels(db$des_menages_avec_un_source_d_eau_potable_amelioree)[db$des_menages_avec_un_source_d_eau_potable_amelioree])<40,"20-39%",
                  ifelse(as.numeric(levels(db$des_menages_avec_un_source_d_eau_potable_amelioree)[db$des_menages_avec_un_source_d_eau_potable_amelioree])<60,"40-59%",
                         ifelse(as.numeric(levels(db$des_menages_avec_un_source_d_eau_potable_amelioree)[db$des_menages_avec_un_source_d_eau_potable_amelioree])<80,"60-79%",
                                ifelse(as.numeric(levels(db$des_menages_avec_un_source_d_eau_potable_amelioree)[db$des_menages_avec_un_source_d_eau_potable_amelioree])<=100,"80-100%")))))
  

  type_inter<-rep("MSA",length(db[,1]))
  db<-cbind(db,score_de_Consommation_alimentaire_PauvreBorder,type_inter)

  write.csv(db,"RRM_MSA.csv",row.names=FALSE,fileEncoding = "UTF-8")
  
  db$Latitude <- as.numeric(levels(db$Latitude)[db$Latitude])
  db$Longitude <- as.numeric(levels(db$Longitude)[db$Longitude])
  MSA_geo<-SpatialPointsDataFrame(db[,58:59],db)
  
  #Write as geojson
  writeOGR(MSA_geo,"MSA_geo",'MSA_geo2', driver='GeoJSON',delete_dsn=TRUE,overwrite_layer=TRUE) 
  g<-read.table("MSA_geo",header=FALSE,sep="#",stringsAsFactor =FALSE,quote="")
  g[1,]<-paste("var MSA = ",as.character(g[1,]))
  
  write.table(g,"MSA.json",row.names=FALSE,col.names=FALSE,quote=FALSE)


}

if(i==4)
{
  db$Type_d_intervention_WASH<-ifelse(db$Type_d_intervention_WASH==1,"WASH*",NA)
  db$Type_d_intervention_NFI<-ifelse(db$Type_d_intervention_NFI==1,"NFI**",NA)
  #db$Type_d_intervention_NFI_WASH_Abris<-ifelse(db$Type_d_intervention_NFI_WASH_Abris==1,"NFI/WASH/Abri",NA)
  db$Type_d_intervention_NFI_WASH<-ifelse(db$Type_d_intervention_NFI_WASH==1,"NFI**/WASH*",NA)
  
  intervention_type<-paste(db$Type_d_intervention_WASH,db$Type_d_intervention_NFI,
                           db$Type_d_intervention_NFI_WASH_Abris,db$Type_d_intervention_NFI_WASH,sep=" ")
  type<-rep("1",length(db[,1]))
  type_inter<-rep("Intervention",length(db[,1]))
  db<-cbind(db,intervention_type,type,type_inter)
  
  db<-as.data.frame(sapply(db,gsub,pattern="NA ",replacement=""))
  db<-as.data.frame(sapply(db,gsub,pattern=" NA",replacement=""))
  db<-as.data.frame(sapply(db,gsub,pattern="  ",replacement=" "))
  db<-as.data.frame(sapply(db,str_trim))

  write.csv(db,"RRM_intervention.csv",row.names=FALSE,fileEncoding = "UTF-8")
  
  db$Latitude <- as.numeric(levels(db$Latitude)[db$Latitude])
  db$Longitude <- as.numeric(levels(db$Longitude)[db$Longitude])
  inter_geo<-SpatialPointsDataFrame(db[,105:106],db)
  
  #Write as geojson
  writeOGR(inter_geo,"inter_geo",'inter_geo2', driver='GeoJSON',delete_dsn=TRUE,overwrite_layer=TRUE) 
  g<-read.table("inter_geo",header=FALSE,sep="#",stringsAsFactor =FALSE,quote="")
  g[1,]<-paste("var inter = ",as.character(g[1,]))
  write.table(g,"inter.json",row.names=FALSE,col.names=FALSE,quote=FALSE)
}
}

