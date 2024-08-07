/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao) {
	velv += GRAVIDADE * massa;	
}

switch (estado) {
	case "parado": 
	{
		velh = 0;
		timer_estado++;
		if (sprite_index != spr_inimigo_cobra_idle) {
			image_index = 0;	
		}
		sprite_index = spr_inimigo_cobra_idle;
		
		//Condição de troca de estado
		if (position_meeting(mouse_x, mouse_y, self))
		 {
			if (mouse_check_button_pressed(mb_right)) {
				estado = "hit";	
			}
		 }
		 
		 //Indo para o estado de patrulha
		 if (irandom(timer_estado) > 300) {
			estado = choose("walk", "parado", "walk"); 
			timer_estado = 0;
		 }	
		
		break;
	}
	case "walk":
	{	
		timer_estado++;
		if (sprite_index != spr_inimigo_cobra_walk) {
			image_index = 0;	
			velh = choose(1, -1);
		}
		sprite_index = spr_inimigo_cobra_walk;
		
		//Condição de saída do estado
		if (irandom(timer_estado) > 300) {
			estado = choose("parado", "walk", "parado");
			timer_estado = 0;
		}
		
		break;
	}
	case "hit":
	{
		if (sprite_index != spr_inimigo_cobra_hit) {
			//Iniciando o que for preciso para este estado
			image_index = 0;
		}
		sprite_index = spr_inimigo_cobra_hit;
		
		//Condição para sair do estado
		if (image_index > image_number - 1) {
			//Checando se eu ainda tenho vida
			if (vida_atual > 0) {
				estado = "parado";	
			} else if (vida_atual <= 0) {
				estado = "dead";	
			}
		}
		
		break;
	}
	case "dead":
	{
		if (sprite_index != spr_inimigo_cobra_dead) {
			image_index = 0;	
		}
		sprite_index = spr_inimigo_cobra_dead;
		
		//Morrendo de verdade
		if (image_index > image_number - 1) {
			image_speed = 0;
			image_alpha -= .01;
			
			if (image_alpha <= 0) instance_destroy();	
		}	
		
		break;
	}
	
	default: 
	{
		estado = "parado";	
	}
}