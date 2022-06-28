audio_sound_pitch(snEnemyDeath, (1/(size/2)));
audio_play_sound(snEnemyDeath, 10, false);
ScreenShake(6,25)
gamepad_set_vibration(0,1,1);
alarm[0] = 10;