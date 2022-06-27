//Health Bar Vars
HBXOffset = 64;
HBYOffset = 32;
healthbar_width = hp_max;
healthbar_height = 16;
healthbar_x = (camera_get_view_width(oCamera)) - (camera_get_view_width(oCamera) - HBXOffset);
healthbar_y =  (camera_get_view_height(oCamera)) - (camera_get_view_height(oCamera) - HBYOffset);
//JP Bar Vars
JPBXOffset = 64;
JPBYOffset = 64;
jetbar_width = jet_max;
jetbar_height = 16;
jetbar_x = (camera_get_view_width(oCamera)) - (camera_get_view_width(oCamera) - JPBXOffset);
jetbar_y =  (camera_get_view_height(oCamera)) - (camera_get_view_height(oCamera) - JPBYOffset);
//Batt Bar Vars
BattXOffset = 64;
BattYOffset = 96;
Battbar_width = batt_max;
Battbar_height = 16;
Battbar_x = (camera_get_view_width(oCamera)) - (camera_get_view_width(oCamera) - BattXOffset);
Battbar_y =  (camera_get_view_height(oCamera)) - (camera_get_view_height(oCamera) - BattYOffset);
Debug = false;