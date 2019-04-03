#devtools::install_github("rich-iannone/stationaRy")

library(stationaRy)
library(dplyr)
library(XLConnect)



grosseto <-stationaRy::get_isd_station_data(station_id = "162060-99999",startyear = 2018,endyear = 2019,select_additional_data = "AA1")
grosseto_df=as.data.frame(grosseto) 
grosseto_data=grosseto_df[,c("time","year","month","day","hour","minute","temp","rh","dew_point","wd","ws","ceil_hgt","atmos_pres","aa1_2" )]
names(grosseto_data)[14]="precip_cum"
XLConnect::writeWorksheetToFile("grosseto_H_data.xls",grosseto_data,"grosseto_orari")
