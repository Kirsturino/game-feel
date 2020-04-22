/// @description Draw grass
time += 0.05;
randomSway = scrWave(8, 2, 6, 1);

shader_set(shdGrass);
shader_set_uniform_f(uTime, time);
shader_set_uniform_f(playerX, oPlayer.x);
shader_set_uniform_f(playerY, oPlayer.y);
shader_set_uniform_f(playerGround, oPlayer.nearGround);
shader_set_uniform_f(rng, randomSway);
shader_set_uniform_f(windDir, dir);
vertex_submit(vbuff, pr_trianglelist, -1);
shader_reset();