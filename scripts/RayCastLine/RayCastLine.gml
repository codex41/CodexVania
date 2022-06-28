///@desc scr_cast_ray(x1, y1, len, dir, step);
/// @argument0 x1
/// @argument1 y1
/// @argument2 len
/// @argument3 dir
/// @argument4 step

function RayCastLine()
{
	var x1, y1, len, dir, step;
	x1 = argument[0];
	y1 = argument[1];
	len = argument[2];
	dir = argument[3];
	step = argument[4];

	// Desired ending tile
	var x2 = x1 + lengthdir_x(len, dir);
	var y2 = y1 + lengthdir_y(len, dir);

	var xx = x1;
	var yy = y1;

	var xstep = ((x2 - x1) / max(abs(x2 - x1), abs(y2 - y1)));
	var ystep = ((y2 - y1) / max(abs(x2 - x1), abs(y2 - y1)));

	var xleap = xstep * step;
	var yleap = ystep * step;

	var stop = false;

	while (true) {
	    while (!collision_point(xx + xleap, yy + yleap, oWall, false, true)) {
	        if (abs(xleap) > abs(xstep)) || (abs(yleap) > abs(ystep)) {
	            xleap /= 2;
	            yleap /= 2;
	        } else {
	            stop = true;
	            break;
	        }
	    }
	    xx += xleap;
	    yy += yleap;
	    if (stop == true) { break; }
	}
	len = point_distance(x1, y1, xx, yy);
	draw_sprite_ext(sLaserLine, 0, x1, y1, len / sprite_get_width(sLaserLine), 1, dir, c_white, 1);
}