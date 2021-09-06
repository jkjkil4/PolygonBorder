/// @description 步

x += 6 * (keyboard_check(vk_right) - keyboard_check(vk_left));
y += 6 * (keyboard_check(vk_down) - keyboard_check(vk_up));

var isInside = false;
for(var i = 0; i < borderCount; i++) {	//遍历所有框，判断是否出框
	if(borders[i].contains(x, y)) {
		isInside = true;
		break;
	}
}

if(!isInside) {	//如果出框
	var nearestPos, nearestDis = -1;	//最近位置和最近距离
	for(var i = 0; i < borderCount; i++) {	//遍历所有框
		//得到限制位置和距离
		var pos = borders[i].limit(x, y);
		var dis = point_distance(x, y, pos[0], pos[1]);
		
		if(dis < nearestDis || nearestDis == -1) {	//如果比其他更近
			nearestPos = pos;
			nearestDis = dis;
		}
	}
	x = nearestPos[0];
	y = nearestPos[1];
}

//用于演示
t += 4;
t %= 360;
