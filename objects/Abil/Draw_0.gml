if(Control.pause==0){
//Fishing line + ripples + tug indicator (pin 94)
if(pin==94){

	//Cast bar (phase -1) - matches Shining Force bar colors
	if(phase==-1){
		var _bx=Me.x-10
		var _by=Me.y-20
		var _bw=20
		var _bh=3
		var _fill=diddmg/60

		//Background
		draw_set_color(make_color_rgb(30,30,30))
		draw_rectangle(_bx,_by,_bx+_bw,_by+_bh,false)

		//Fill width
		var _fw=floor(_fill*_bw)
		var _green_end=floor(_bw*0.40)
		var _yellow_end=floor(_bw*0.75)

		//When power >= 90% entire bar goes red
		if(_fill>=0.9){
			draw_set_color($5959BB) //REDS_4
			draw_rectangle(_bx,_by,_bx+_fw,_by+_bh,false)
		}else{
			//Section 1: GREENS_4 (0-40%)
			if(_fw>0){
				var _s1=min(_fw,_green_end)
				draw_set_color($72C074) //GREENS_4
				draw_rectangle(_bx,_by,_bx+_s1-1,_by+_bh,false)
			}
			//Section 2: GREENS_7 (40-75%)
			if(_fw>_green_end){
				var _s2=min(_fw,_yellow_end)
				draw_set_color($A1DDE9) //GREENS_7
				draw_rectangle(_bx+_green_end,_by,_bx+_s2-1,_by+_bh,false)
			}
			//Section 3: REDS_4 (75-100%)
			if(_fw>_yellow_end){
				draw_set_color($5959BB) //REDS_4
				draw_rectangle(_bx+_yellow_end,_by,_bx+_fw-1,_by+_bh,false)
			}
		}

		draw_set_color(c_white)
	}

	//Water line at 80% screen height
	var _water_y=Control.camy+floor(Control.camytwo*0.6)
	var _left=Control.camx-Control.camxtwo
	var _right=Control.camx+Control.camxtwo
	var _top_col=make_color_rgb($46,$64,$75)
	var _bot_col=make_color_rgb($5E,$94,$A8)
	var _time=current_time*0.002
	for(var _wx=_left;_wx<=_right;_wx+=1){
		var _wave=sin(_wx*0.15+_time)*1.5+sin(_wx*0.08-_time*0.7)*0.8
		var _wy=_water_y+floor(_wave)
		draw_set_color(_top_col)
		draw_rectangle(_wx,_wy,_wx,_wy,false)
		draw_set_color(_bot_col)
		draw_rectangle(_wx,_wy+1,_wx,_wy+1,false)
	}
	draw_set_color(c_white)

	//Line endpoints: rod tip to bobber
	var _sx=floor(chance)
	var _sy=floor(chancetwo)
	var _ex=floor(x)
	var _ey=floor(y)

	//Distance and sag
	var _dist=point_distance(_sx,_sy,_ex,_ey)
	var _base_sag=4+(_dist/25)
	var _steps=max(12,floor(_dist))

	//Tug wave amplitude
	var _wave_amp=0
	if(phase==2){ _wave_amp=spin }

	//Line colors (matching Shining Force)
	var _col_dark=make_color_rgb(137,96,78)
	var _col_light=make_color_rgb(169,132,99)
	var _col_border=make_color_rgb(85,47,51)

	//Pass 1: Collect curve pixel positions
	var _line_px=[]
	var _line_py=[]
	var _prev_px=-999
	var _prev_py=-999

	for(var _i=0;_i<=_steps;_i+=1){
		var _t=_i/_steps
		var _lx=lerp(_sx,_ex,_t)
		var _ly=lerp(_sy,_ey,_t)

		//Parabolic sag
		_ly+=sin(_t*pi)*_base_sag

		//Tug wave (phase 2)
		if(_wave_amp>0){
			_lx+=sin(_t*10+diddmg*0.3)*_wave_amp
		}

		var _px=floor(_lx)
		var _py=floor(_ly)

		if(_px!=_prev_px||_py!=_prev_py){
			//Fill gaps
			if(_prev_px!=-999){
				var _gx=abs(_px-_prev_px)
				var _gy=abs(_py-_prev_py)
				if(_gx>1||_gy>1){
					var _gs=max(_gx,_gy)
					for(var _s=1;_s<_gs;_s+=1){
						var _ft=_s/_gs
						array_push(_line_px,floor(lerp(_prev_px,_px,_ft)))
						array_push(_line_py,floor(lerp(_prev_py,_py,_ft)))
					}
				}
			}
			array_push(_line_px,_px)
			array_push(_line_py,_py)
			_prev_px=_px
			_prev_py=_py
		}
	}

	var _total=array_length(_line_px)

	//Pass 2: Border pixels (perpendicular to line direction)
	draw_set_color(_col_border)
	for(var _i=0;_i<_total;_i+=1){
		var _cx=_line_px[_i]
		var _cy=_line_py[_i]
		var _pi2=max(0,_i-1)
		var _ni=min(_total-1,_i+1)
		var _ddx=_line_px[_ni]-_line_px[_pi2]
		var _ddy=_line_py[_ni]-_line_py[_pi2]
		var _perp_x=0
		var _perp_y=0
		if(_ddx==0&&_ddy==0){
			_perp_x=1
		}else if(abs(_ddx)>=abs(_ddy)){
			_perp_y=1
		}else{
			_perp_x=1
		}
		draw_rectangle(_cx+_perp_x,_cy+_perp_y,_cx+_perp_x,_cy+_perp_y,false)
		draw_rectangle(_cx-_perp_x,_cy-_perp_y,_cx-_perp_x,_cy-_perp_y,false)
	}

	//Pass 3: Main line pixels (alternating colors every 3 pixels)
	var _pixel_count=0
	for(var _i=0;_i<_total;_i+=1){
		if((_pixel_count div 3) mod 2==0){
			draw_set_color(_col_dark)
		}else{
			draw_set_color(_col_light)
		}
		draw_rectangle(_line_px[_i],_line_py[_i],_line_px[_i],_line_py[_i],false)
		_pixel_count+=1
	}
	draw_set_color(c_white)

	//Draw bobber sprite
	draw_sprite(spr_items,440,x,y)

	//Draw caught fish on bobber (phase 3 - reeling back)
	if(phase==3){
		draw_sprite(spr_items,phasecheck,x,y+4)
	}

	//Draw ripples (phases 1 and 2) - pixel size
	if(phase==1||phase==2){
		var _rw=floor(3+sin(diddmg*0.08)*1.5)
		var _ry=floor(y)+2
		draw_set_color(make_color_rgb($5E,$94,$A8))
		draw_rectangle(floor(x)-_rw,_ry,floor(x)+_rw,_ry,false)
		draw_set_color(make_color_rgb($46,$64,$75))
		draw_rectangle(floor(x)-_rw-1,_ry,floor(x)-_rw-1,_ry,false)
		draw_rectangle(floor(x)+_rw+1,_ry,floor(x)+_rw+1,_ry,false)
		draw_set_color(c_white)
	}

	//Draw tug indicator (phase 2) - flashing "!" above player
	if(phase==2){
		if((diddmg mod 10)<6){
			draw_set_color(c_yellow)
			draw_set_halign(fa_center)
			draw_text(Me.x,Me.y-24,"!")
			draw_set_halign(fa_left)
			draw_set_color(c_white)
		}
	}

}else if(pin==91){
	//Code-drawn Q selector / inventory / upgrade menus
	//Copy UI colors to this instance for ui_panel/ui_button
	ui_border=Control.ui_border
	pathcolor=Control.pathcolor
	colorbrown=Control.colorbrown
	ui_btn_outline=Control.ui_btn_outline
	colorgold=Control.colorgold
	colorgoldmed=Control.colorgoldmed
	colorgoldlight=Control.colorgoldlight
	hurtcolor=Control.hurtcolor

	if(phase==0){
		//Selector diamond - 4 directional buttons
		var _cx=Me.x
		var _cy=Me.y-20
		var _bw=22
		var _bh=8
		var _gap=2
		var _anim_offset=sin(diddmg*0.05)*0.5

		var _labels=["Fish","Mine","Dig","Pack"]
		var _bx=[ _cx-_bw/2, _cx+_gap+2, _cx-_bw/2, _cx-_bw-_gap-2 ]
		var _by=[ _cy-_bh-_gap-2+_anim_offset, _cy-_bh/2, _cy+_gap+2-_anim_offset, _cy-_bh/2 ]

		var _highlight=0
		if(global.con_h_up||global.conp_h_up){ _highlight=1 }
		else if(global.con_h_right||global.conp_h_right){ _highlight=2 }
		else if(global.con_h_down||global.conp_h_down){ _highlight=3 }
		else if(global.con_h_left||global.conp_h_left){ _highlight=4 }

		for(var _d=0;_d<4;_d+=1){
			var _sel=(_highlight==_d+1)
			ui_button(_bx[_d],_by[_d],_bx[_d]+_bw,_by[_d]+_bh,_sel)
			var _tcol=_sel?Control.colorbluelight:Control.colorgold
			var _talpha=_sel?1.0:0.7
			draw_set_alpha(_talpha)
			draw_text_ext_transformed_color(
				_bx[_d]+_bw/2-string_width(_labels[_d])*0.15,
				_by[_d]+2, _labels[_d], -1, 1000, 0.3, 0.3, 0,
				_tcol, _tcol, _tcol, _tcol, _talpha)
			draw_set_alpha(1)
		}

	}else if(phase==3){
		//Inventory panel
		var _px=Me.x-40
		var _py=Me.y-45
		var _pw=80
		var _ph=62
		ui_panel(_px,_py,_px+_pw,_py+_ph)

		//Title
		draw_text_ext_transformed_color(
			_px+_pw/2-string_width("Inventory")*0.225, _py+4, "Inventory", -1, 1000, 0.45, 0.45, 0,
			Control.colorbluelight, Control.colorbluelight, Control.colorbluelight, Control.colorbluelight, 1)

		//Resource display
		var _res_y=_py+16
		var _stone_text="Stone: "+string(Me.goblin_stone)
		var _wood_text="Wood: "+string(Me.goblin_wood)
		draw_text_ext_transformed_color(
			_px+8, _res_y, _stone_text, -1, 1000, 0.3, 0.3, 0,
			Control.colorgold, Control.colorgold, Control.colorgold, Control.colorgold, 0.9)
		draw_text_ext_transformed_color(
			_px+_pw/2+4, _res_y, _wood_text, -1, 1000, 0.3, 0.3, 0,
			Control.colorgold, Control.colorgold, Control.colorgold, Control.colorgold, 0.9)

		//Menu items
		var _inv_items=["Upgrade","Repair","Back"]
		var _menu_y=_py+26
		var _menu_spacing=11
		var _item_pad=6

		for(var _m=0;_m<3;_m+=1){
			var _iy=_menu_y+(_m*_menu_spacing)
			var _ix=_px+_item_pad
			var _iw=_pw-_item_pad*2
			var _ih=9
			ui_button(_ix,_iy,_ix+_iw,_iy+_ih,_m==spin)
			var _mtcol=(_m==spin)?Control.colorbluelight:Control.colorgold
			var _mtalpha=(_m==spin)?1.0:0.7
			draw_text_ext_transformed_color(
				_ix+_iw/2-string_width(_inv_items[_m])*0.175, _iy+2, _inv_items[_m], -1, 1000, 0.35, 0.35, 0,
				_mtcol, _mtcol, _mtcol, _mtcol, _mtalpha)
		}

		//Triangle arrows on selected item
		var _sel_iy=_menu_y+(spin*_menu_spacing)
		var _sel_ix=_px+_item_pad
		var _sel_iw=_pw-_item_pad*2
		var _sel_ih=9
		var _tri_y=_sel_iy+_sel_ih/2
		var _arrow_off=sin(diddmg*0.025)*0.75

		var _tri_x=_sel_ix-5+_arrow_off
		draw_rectangle_color(_tri_x,_tri_y-2,_tri_x,_tri_y+2,Control.ui_border,Control.ui_border,Control.ui_border,Control.ui_border,false)
		draw_rectangle_color(_tri_x+1,_tri_y-1,_tri_x+1,_tri_y+1,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,false)
		draw_rectangle_color(_tri_x+2,_tri_y,_tri_x+2,_tri_y,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,false)

		var _tri_x2=_sel_ix+_sel_iw+5-_arrow_off
		draw_rectangle_color(_tri_x2,_tri_y-2,_tri_x2,_tri_y+2,Control.ui_border,Control.ui_border,Control.ui_border,Control.ui_border,false)
		draw_rectangle_color(_tri_x2-1,_tri_y-1,_tri_x2-1,_tri_y+1,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,false)
		draw_rectangle_color(_tri_x2-2,_tri_y,_tri_x2-2,_tri_y,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,false)

	}else if(phase==4){
		//Upgrade panel
		var _px=Me.x-45
		var _py=Me.y-55
		var _pw=90
		var _ph=82
		ui_panel(_px,_py,_px+_pw,_py+_ph)

		//Title
		draw_text_ext_transformed_color(
			_px+_pw/2-string_width("Upgrade")*0.225, _py+4, "Upgrade", -1, 1000, 0.45, 0.45, 0,
			Control.colorbluelight, Control.colorbluelight, Control.colorbluelight, Control.colorbluelight, 1)

		//Upgrade items with levels
		var _upg_names=["Club","Armor","Tools","Hog","Back"]
		var _upg_levels=[Me.goblin_upgrade_club,Me.goblin_upgrade_armor,Me.goblin_upgrade_tools,Me.goblin_upgrade_hog,0]
		var _menu_y=_py+16
		var _menu_spacing=11
		var _item_pad=6

		for(var _m=0;_m<5;_m+=1){
			var _iy=_menu_y+(_m*_menu_spacing)
			var _ix=_px+_item_pad
			var _iw=_pw-_item_pad*2
			var _ih=9
			ui_button(_ix,_iy,_ix+_iw,_iy+_ih,_m==spin)
			var _mtcol=(_m==spin)?Control.colorbluelight:Control.colorgold
			var _mtalpha=(_m==spin)?1.0:0.7

			var _label=_upg_names[_m]
			if(_m<4){
				_label=_upg_names[_m]+" Lv."+string(_upg_levels[_m])
			}
			draw_text_ext_transformed_color(
				_ix+_iw/2-string_width(_label)*0.15, _iy+2, _label, -1, 1000, 0.3, 0.3, 0,
				_mtcol, _mtcol, _mtcol, _mtcol, _mtalpha)
		}

		//Cost display for selected upgrade
		if(spin<4){
			var _cost=(_upg_levels[spin]+1)*3
			var _cost_text="Cost: "+string(_cost)+" Stone "+string(_cost)+" Wood"
			var _can_afford=(Me.goblin_stone>=_cost&&Me.goblin_wood>=_cost)
			var _cost_col=_can_afford?Control.colorgreen:Control.hurtcolor
			draw_text_ext_transformed_color(
				_px+_pw/2-string_width(_cost_text)*0.125, _py+_ph-10, _cost_text, -1, 1000, 0.25, 0.25, 0,
				_cost_col, _cost_col, _cost_col, _cost_col, 0.9)
		}

		//Triangle arrows on selected item
		var _sel_iy=_menu_y+(spin*_menu_spacing)
		var _sel_ix=_px+_item_pad
		var _sel_iw=_pw-_item_pad*2
		var _sel_ih=9
		var _tri_y=_sel_iy+_sel_ih/2
		var _arrow_off=sin(diddmg*0.025)*0.75

		var _tri_x=_sel_ix-5+_arrow_off
		draw_rectangle_color(_tri_x,_tri_y-2,_tri_x,_tri_y+2,Control.ui_border,Control.ui_border,Control.ui_border,Control.ui_border,false)
		draw_rectangle_color(_tri_x+1,_tri_y-1,_tri_x+1,_tri_y+1,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,false)
		draw_rectangle_color(_tri_x+2,_tri_y,_tri_x+2,_tri_y,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,false)

		var _tri_x2=_sel_ix+_sel_iw+5-_arrow_off
		draw_rectangle_color(_tri_x2,_tri_y-2,_tri_x2,_tri_y+2,Control.ui_border,Control.ui_border,Control.ui_border,Control.ui_border,false)
		draw_rectangle_color(_tri_x2-1,_tri_y-1,_tri_x2-1,_tri_y+1,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,false)
		draw_rectangle_color(_tri_x2-2,_tri_y,_tri_x2-2,_tri_y,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,Control.colorgoldlight,false)

	}else if(phase==5){
		//Upgrade detail/confirm panel
		var _upg_names=["Club","Armor","Tools","Hog"]
		var _upg_levels=[Me.goblin_upgrade_club,Me.goblin_upgrade_armor,Me.goblin_upgrade_tools,Me.goblin_upgrade_hog]
		var _cur_level=_upg_levels[test]
		var _next_level=_cur_level+1
		var _cost=_next_level*3

		//Descriptions of what each upgrade does
		var _desc=""
		var _stat_text=""
		if(test==0){
			//Club
			var _cur_bonus=floor(_cur_level*10)
			var _next_bonus=floor(_next_level*10)
			_desc="Whack damage"
			_stat_text="+"+string(_cur_bonus)+"% > +"+string(_next_bonus)+"%"
		}else if(test==1){
			//Armor
			var _cur_hp=Me.goblin_base_hp+_cur_level
			var _next_hp=Me.goblin_base_hp+_next_level
			_desc="Max HP"
			_stat_text=string(_cur_hp)+" > "+string(_next_hp)
		}else if(test==2){
			//Tools
			var _cur_spd=floor(_cur_level*5)
			var _next_spd=floor(_next_level*5)
			_desc="Mine/dig speed, fish CD"
			_stat_text="+"+string(_cur_spd)+"% > +"+string(_next_spd)+"%"
		}else if(test==3){
			//Hog
			var _cur_dmg=6+_cur_level*2
			var _next_dmg=6+_next_level*2
			_desc="Hog charge damage"
			_stat_text=string(_cur_dmg)+" > "+string(_next_dmg)
		}

		var _px=Me.x-45
		var _py=Me.y-45
		var _pw=90
		var _ph=58
		ui_panel(_px,_py,_px+_pw,_py+_ph)

		//Title: upgrade name + level
		var _title=_upg_names[test]+" Lv."+string(_cur_level)
		draw_text_ext_transformed_color(
			_px+_pw/2-string_width(_title)*0.225, _py+4, _title, -1, 1000, 0.45, 0.45, 0,
			Control.colorbluelight, Control.colorbluelight, Control.colorbluelight, Control.colorbluelight, 1)

		//Description
		draw_text_ext_transformed_color(
			_px+_pw/2-string_width(_desc)*0.15, _py+16, _desc, -1, 1000, 0.3, 0.3, 0,
			Control.colorgold, Control.colorgold, Control.colorgold, Control.colorgold, 0.9)

		//Stat change
		draw_text_ext_transformed_color(
			_px+_pw/2-string_width(_stat_text)*0.15, _py+24, _stat_text, -1, 1000, 0.3, 0.3, 0,
			Control.colorbluelight, Control.colorbluelight, Control.colorbluelight, Control.colorbluelight, 1)

		//Cost
		var _cost_text="Cost: "+string(_cost)+" Stone "+string(_cost)+" Wood"
		var _can_afford=(Me.goblin_stone>=_cost&&Me.goblin_wood>=_cost)
		var _cost_col=_can_afford?Control.colorgreen:Control.hurtcolor
		draw_text_ext_transformed_color(
			_px+_pw/2-string_width(_cost_text)*0.125, _py+34, _cost_text, -1, 1000, 0.25, 0.25, 0,
			_cost_col, _cost_col, _cost_col, _cost_col, 0.9)

		//Confirm button
		var _btn_y=_py+43
		var _btn_text=_can_afford?"Confirm":"Not enough"
		ui_button(_px+6,_btn_y,_px+_pw-6,_btn_y+9,_can_afford)
		var _btn_col=_can_afford?Control.colorbluelight:Control.colorgold
		draw_text_ext_transformed_color(
			_px+_pw/2-string_width(_btn_text)*0.15, _btn_y+2, _btn_text, -1, 1000, 0.3, 0.3, 0,
			_btn_col, _btn_col, _btn_col, _btn_col, _can_afford?1.0:0.5)

		//Hint
		var _hint="SPACE confirm / W back"
		draw_text_ext_transformed_color(
			_px+_pw/2-string_width(_hint)*0.1, _py+_ph-4, _hint, -1, 1000, 0.2, 0.2, 0,
			Control.colorgold, Control.colorgold, Control.colorgold, Control.colorgold, 0.4)
	}

}else{
	//Default Abil draw
	draw_sprite_ext(sprite_index,image_index,x,y,dir,image_yscale,imgangle,c_white,1)
}
}
