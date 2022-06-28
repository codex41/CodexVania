image_index = 0;
image_speed = 0;

// Tie wall collision to crate
mywall = instance_create_layer(x,y,layer,oWall);
with (mywall)
{
	mask_index = sCrate;
	image_xscale = other.sprite_width / sprite_width;
	image_yscale = other.sprite_height / sprite_height;
}