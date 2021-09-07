/// @description 辅助销毁实例
// 不知道为什么，gm切换room时不会调用实例的销毁事件
with(all) {
	if(!persistent) {
		instance_destroy();
	}
}
