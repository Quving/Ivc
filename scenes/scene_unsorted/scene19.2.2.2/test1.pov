//wrap the file with the version
#local Temp_version = version;
#version 3.7;
global_settings {
    //This setting is for alpha transparency to work properly.
    //Increase by a small amount if transparent areas appear dark.
    max_trace_level 15
    adc_bailout 0.01
    assumed_gamma 1
}


#include "../../models/space_wallpaper.inc"
#include "../../models/orion_POV_geom.inc" //Geometry
#include "../../models/StationV_POV_geom.inc" //Geometry
#include "transforms.inc" //cool
      
      
     
      
//CAMERA PoseRayCAMERA     scene 20.1
camera {
    look_at <1,1,-1000>  
    location <0,-6000,0> 
    translate<2000,0,1000> 
    rotate<0,0,50> 
    //translate<-3000*clock,0,0>  

}
   
//Assembled object that is contained in orion_POV_geom.inc with no SSLT components
object {
    orion_
    translate <0,0,-6000>  
    rotate<90,250,0>    
    translate <0,-1500,0>       
    rotate<0,-190*clock,0>
    translate <0,-1000*clock,0>  
    }
   
   
object {
    StationV_     
    
    rotate <90,0,0> //startzustand
    rotate <0,-100*clock,0> // rotation um eigen achse    
   
}

//PoseRay default Light attached to the camera
light_source {
    <3.33066907387547E-16,1.33226762955019E-15,1787.85103658018> //light position
    color rgb <1,1,1>*1.6
    parallel
    point_at <3.33066907387547E-16,1.33226762955019E-15,0>
    rotate <0,0,1.26346700010074> //roll
    rotate <-45.2086195197426,0,0> //elevation
    rotate <0,42.8371672265632,0> //rotation
}

//Background
background { color srgb 0  }




//restore the version used outside this file
#version Temp_version;
//==================================================

