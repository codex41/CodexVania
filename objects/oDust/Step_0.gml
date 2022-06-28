x+=hsp;
y+=vsp;

hsp*=0.9;
vsp*=0.9;

//allows dust to fall from edges
if (!position_meeting(x+hsp-sprite_width,y,oWall)) 
{
	vsp = 0.3;
}
//stops dust from entering walls
if (position_meeting(x+hsp,y+sprite_height*2,oWall))
{
	hsp = -hsp/4;
	vsp = random_range(-0.5,-0.1);
}