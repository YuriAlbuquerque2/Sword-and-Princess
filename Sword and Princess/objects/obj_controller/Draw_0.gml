/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (game_over) {
	//Pegando algumas informações
	var _x1 = camera_get_view_x(view_camera[0]);
	var _w = camera_get_view_width(view_camera[0]);
	var _x2 = _x1 + _w;
	var _meio_w = _x1 + _w / 2;
	var _y1 = camera_get_view_y(view_camera[0]);
	var _h = camera_get_view_height(view_camera[0]);
	var _y2 = _y1 + _h;
	var _meio_h = _y1 + _h / 2;
	
	var _qtd = _h * .15;
	valor = lerp(valor, 1, .01);
	
	draw_set_color(c_black);
	
	//Escurecendo a tela
	draw_set_alpha(valor - .3);
	draw_rectangle(_x1, _y1, _x2, _y2, false);
	
	//Desenhando o retângulo de cima
	draw_set_alpha(1);
	draw_rectangle(_x1, _y1, _x2, _y1 + _qtd * valor, false);
	
	//Desenhando o retângulo de baixo
	draw_rectangle(_x1, _y2, _x2, _y2 - _qtd * valor, false);
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	//Dando um delay para o game over
	if (valor >= .85) {
		contador = lerp(contador, 1, .01);
	//Escrevendo Game Over
	draw_set_alpha(contador);
	draw_set_font(fnt_gameover);
	draw_set_valign(1);
	draw_set_halign(1);
	
	//Sombra
	draw_set_color(c_red);
	draw_text(_meio_w, _meio_h, "VOCÊ MORREU");
	
	//Texto
	draw_set_color(c_white);
	draw_text(_meio_w, _meio_h, "VOCÊ MORREU");
	draw_set_font(-1);
	draw_set_font(fnt_dialogos);
	draw_text(_meio_w, _meio_h + 40, "Pressione ENTER para reiniciar");
	draw_set_font(-1);
	draw_set_valign(-1);
	draw_set_halign(-1);
	
	draw_set_alpha(1);
	}
	
	
	
}