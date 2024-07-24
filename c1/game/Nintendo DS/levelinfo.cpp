//This List is for which level file goes with which region/location/sublevel.
//Open Level Macros.h to see a list of all possible values.
//To add a new leve use ADD_LEVEL INFO(region, location, tornadoSize, level filename, USE_OBJECTIVES (name), dollar amount to win level)
//If you do not have any //Note Objectives must be setup before the level stuff.
//All levels must be contained between the Start and End.
START_LEVEL_INFO
ADD_LEVEL_INFO(REGION_MIDWEST, LOCATION_FARM, SUBLEVEL_SMALL, "FarmSmall.fmsb", USE_OBJECTIVES(ObjListLevel FarmSmall), 100)
ADD_LEVEL_INFO(REGION_MIDWEST, LOCATION_FARM, SUBLEVEL_MEDIUM, "FarmMedium.fmsb", USE_OBJECTIVES (ObjListLevelFarmMedium), 1000)
ADD_LEVEL_INFO(REGION_MIDWEST, LOCATION_FARM, SUBLEVEL_LARGE, "Farmlarge.fmsb", USE OBJECTIVES / (ObjListLevel FarmLarge), 2000)
/*ADD_LEVEL_INFO(REGION_MIDWEST, LOCATION_CATTLE_RANCH, SUBLEVEL_SMALL, "FarmSmall.fmsb", USE OBJECTIVES(ObjListLevelFarmSmall), 100)
ADD_LEVEL_INFO(REGION_MIDWEST, LOCATION_CATTLE_RANCH, SUBLEVEL_MEDIUM. "FarmMedium.fmsb", USE OBJECTIVES(ObjListLevel FarmMedium), 1000) 
ADD LEVEL INFO(REGION MIDWEST, LOCATION CATTLE RANCH, SUBLEVEL LARGE, "FarmLarge.fmab", USE OBJECTIVES(ObjListLevelFarmLarge), 2000)
ADD_LEVEL_INFO(REGION_MIDWEST, LOCATION_TRAILER_PARK, SUBLEVEL_SMALL, "FarmSnaLL.fmsb", USE OBJECTIVES (ObjListLevelFarmSmall), 100)
ADD_LEVEL_INFO(REGION_MIDWEST, LOCATION_TRAILER_PARK, SUBLEVEL_MEDIUM, "FarmMedium.fmsb", USE_OBJECTIVES(ObjListLevelFarmMedium), 1006)
ADD_LEVEL_INFO(REGION_MIDWEST, LOCATION_TRAILER_PARK, SUBLEVEL_LARGE, "FarmLarge, fmsb", USE_OBJECTIVES(ObjListLevelFarmLarge), 2060)
ADD_LEVEL_INFO(REGION_FRANCE, LOCATION_CARNIVAL, SUBLEVEL_SMALL, "FarmSmall.fmsb", USE_OBJECTIVES (ObjListLevelFarmSmall), 100)
ADD_LEVEL_INFO(REGION_FRANCE, LOCATION_CARNIVAL, SUBLEVEL_MEDIUM, "FarmMedium.fmsb", USE_OBJECTIVES(ObjListLevelFarmMedium), 1000)
ADD_LEVEL_INFO(REGION_FRANCE, LOCATION_CARNIVAL, SUBLEVEL LARGE, "FarmLarge,fmab", USE_OBJECTIVES (ObListLevelFarmLarge), 2000)
ADD_LEVEL_INFO(REGION_FRANCE, LOCATION_ZOO, SUBLEVEL_SMALL, "FarmSmall.fmab", USE_OBJECTIVES(ObjListLevelFarmSmall), 100)
ADD_LEVEL_INFO(REGION_FRANCE, LOCATION_ZOO, SUBLEVEL_MEDIUM, "FarmMedium.fmsb", USE_OBJECTIVES(ObjListLevel FarmMedium), 1000)
ADD_LEVEL_INFO(REGION_FRANCE, LOCATION_ZOO, SUBLEVEL_LARGE, "FarmLarge,fmab", USE_OBJECTIVES(ObjListLevel FarmLarge), 2000) 
ADD_LEVEL_INFO(REGION_FRANCE, LOCATION_STREET_FAIR, SUBLEVEL_SMALL, "FarmSmall.fmsb", USE_OBJECTIVES(ObjListLevelFarmSmall), 100)
ADD_LEVEL_INFO(REGION_FRANCE, LOCATION_STREET_FAIR, SUBLEVEL_MEDIUM, "FarmMedium.fmsb", USE_OBJECTIVES(ObjListLevel FarmMedium), 1000)
ADD_LEVEL_INFO(REGION_FRANCE, LOCATION STREET_FAIR, SUBLEVEL_LARGE, "FarmLarge.fmsb", USE_OBJECTIVES (ObjListLevelFarmLarge), 2000)
ADD_LEVEL_INFO(REGION_GYM, LOCATION_FARM, SUBLEVEL_SMALL, "Gym_C.fmsb", USE_OBJECTIVES(DefaultObjectives), 1000000)     */
END_LEVEL_INFO