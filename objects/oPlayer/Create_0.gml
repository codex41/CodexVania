//Health Bar Vars
HBXOffset = RES_W/2 - sprite_width/2;
HBYOffset = RES_H - sprite_height/2 - 16;
healthbar_width = hp_cur*20;
healthbar_height = 32;
healthbar_x = (camera_get_view_width(oCamera)) - (camera_get_view_width(oCamera) - HBXOffset);
healthbar_y = (camera_get_view_height(oCamera)) - (camera_get_view_height(oCamera) - HBYOffset);