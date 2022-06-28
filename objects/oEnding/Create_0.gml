gunsprite = layer_sprite_get_id("TitleAssets","gGun");
BigR = layer_sprite_get_id("TitleAssets","gEndBigR");
Green1 = layer_sprite_get_id("TitleAssets","gEndGreen1");
Green2 = layer_sprite_get_id("TitleAssets","gEndGreen2");
LittleR = layer_sprite_get_id("TitleAssets","gEndLittleR");
if (global.hasgun == true) && (global.kills > 0)
{
		layer_sprite_destroy(LittleR)
		layer_sprite_destroy(BigR)
		layer_sprite_destroy(Green2)
		layer_sprite_destroy(Green1)
		if (global.kills == 2) endtext[0]="I mean, those two dudes had it coming, right?";
		if (global.kills < 10) && (global.kills != 2) endtext[0]="Why would you kill those helmet dudes?\nThey were just defending themselves.";
		if (global.kills == 10) endtext[0]="You have wiped out the entire population of helmet dudes.";
		endtext[1]="Are you proud of yourself?";
		endtext[2]="The End";
}
else
{
	layer_sprite_destroy(gunsprite);
	endtext[0]="You're so peaceful.\nNice.";
	endtext[1]="You should be proud of yourself.";
	endtext[2]="The End";
}

spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text = "";
alarm[0] = 10;