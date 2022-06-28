ScreenShake(7,60);
audio_play_sound(snEnemyDeath, 10, false);
game_set_speed(90,gamespeed_fps);
with (oCamera) follow = other.id;