//**** LEVEL INFO STUFF
// REGIONS (AKA - WORLDS)
enum {
	REGION_NONE = 0, //Do not use this, placeholder for code.
	REGION_MIDWEST, 
	REGION_UK,
	REGION_TROPICS,
	REGION_TOKYO,
	REGION_AREA52,
	REGION_GYM, //Debug only
	
	MAX_REGIONS
};
//LOCATIONS (AKA - LEVELS)
#define MAX_LOCATIONS 3 //All the below locations have this many.
enum { //MIDWEST
  LOCATION_NONE = 0, //Do not use this, placeholder for code.
  LOCATION_FARM,
  LOCATION_CATTLE_RANCH,
  LOCATION_TRAILER_PARK
};
enum { //FRANCE
  LOCATION_CARNIVAL = 1,
  LOCATION_ZOO,
  LOCATION_STREET_FAIR
};
enum { //UK
  LOCATION_CASTLE = 1,
  LOCATION_STONEHENGE,
  LOCATION_HAUNTED_VILLAGE
};
enum { //TROPICS
  LOCATION_BEACH = 1,
  LOCATION_VOLCANO,
  LOCATION_EASTER_ISLAND
};
enum { //TOKYO
  LOCATION_DOWNTOWN = 1,
  LOCATION_FISHING_VILLAGE,
  LOCATION_AIRPORT
};
enum { //AREA52
 LOCATION_DESERT = 1,
 LOCATION_MILITARY,
 LOCATION_DIG_SITE
};
 
