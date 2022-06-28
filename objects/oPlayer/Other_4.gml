/// @description AutoSave and spawn set

//Overwrite old save
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

//Create new save
var file;
file = file_text_open_write(SAVEFILE);
file_text_write_real(file,room);
file_text_write_real(file,global.kills);
file_text_write_real(file,global.hasgun);
file_text_close(file);

//Read location 
//x = my_xplace; //move the player to the specified x location
//y = my_yplace; //move the player to the specified y location