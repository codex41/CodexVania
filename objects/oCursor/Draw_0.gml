//if (instance_exists(oGun))
//{
//	var Gx = oGun.x;
//	var Gy = oGun.y;
//	var Gw = oGun.sprite_width;
//	var dsIa = dsin(image_angle);
//	var dcIa = dcos(image_angle);
//	var mx = mouse_x;
//	var my = mouse_y;
//	if(global.hasgun) && (!oPlayer.key_crouch) && (oGun.image_speed = 0)
//	{
//		if mx > Gx
//		{
//			LasYO = -7; 
//			LasXO = Gw/2;
//		}
//		else
//		{
//			LasYO = 7;
//			LasXO = Gw/2;
//		}
//		image_angle = oGun.image_angle;

//		laserlength = point_distance(Gx,Gy,mx,my)/3-sprite_width/2;
//		draw_sprite_ext(sLaserLine,0,(Gx+(LasXO*dcIa)+(LasYO*dsIa)),(Gy-(LasXO*dsIa)+(LasYO*dcIa))+sprite_height/2,laserlength,3,image_angle,c_white,0.5)
//		draw_sprite(sMouse,0,mx,my)
//	}
	
//}