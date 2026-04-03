
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

}else{
	//Default Abil draw
	draw_sprite_ext(sprite_index,image_index,x,y,dir,image_yscale,imgangle,c_white,1)
}
