///@desc Show Indicator
if (point_in_circle(oPlayer.x,oPlayer.y,x,y,128)) && (!instance_exists(oIndicate))
{
	oPlayer.TouchingSign = 1;
	if(!oPlayer.controller)
		{
		with (instance_create_layer(x,y-64,layer,oIndicate))	
		{
			text = "";
			length = string_length(text);
		}
	}
	else
	{
		with (instance_create_layer(x,y-64,layer,oIndicateC))	
		{
			text = "";
			length = string_length(text);
		}
	}
	if (gamepad_button_check_pressed(0,gp_face3))
	{
		with (instance_create_layer(x,y-64,layer,oText))	
		{
			text = other.text;
			length = string_length(text);
		}
		with (oCamera)
		{
			follow = other.id;	
		}
	}
}
if (!point_in_circle(oPlayer.x,oPlayer.y,x,y,128)) or (instance_exists(oText)) && (instance_exists(oIndicate))
{
	instance_destroy(oIndicate,false)	
}
if (!point_in_circle(oPlayer.x,oPlayer.y,x,y,128)) or (instance_exists(oText)) && (instance_exists(oIndicateC))
{
	instance_destroy(oIndicateC,false)	
}