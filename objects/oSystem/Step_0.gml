/// @description 切换示例
if(keyboard_check_pressed(vk_space))
	room_goto(room_next(room) == -1 ? room_first : room_next(room))
