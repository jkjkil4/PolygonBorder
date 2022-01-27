# PolygonBorder

### 介绍
在GMS2（2.3以上版本）中可用的多边形限制框

### 功能
以下列出了我实现的功能，但是你可以做更多拓展（如[示例4](objects/oDemo4)的圆框）

- **判断点是否在框内**
- **得到点与多边形框最近的位置（用于在出框后限制回框内）**
- **对多边形内部区域进行遮罩（将显示范围限制在框内）**
- **多边形框旋转**
- **多边形框叠加（[示例3](objects/oDemo3)和[示例4](objects/oDemo4)中有涉及）**

### 潜在的问题
由于yoyosb，原先能正常运行的代码，现在yoyo不知道搞什么，  
给oPolygonBorder的Create事件的第79行array_sort报错，并且提示说是camera_create_view参数错误（一点关联都没有），  
解决方法：将原本的array_sort注释掉，自己写一个从小到大排序的算法，  
如以冒泡排序为例（最好写更高效的算法，仅举例）：
```javascript
......

for(var i = 0; i < count - 1; i++) {
    for(var j = 0; j < count - 1 - i; j++) {
        if intersections[j] > intersections[j + 1] {
            var swaptmp = intersections[j + 1];
            intersections[j + 1] = intersections[j];
            intersections[j] = swaptmp;
        }
    }
}
//array_sort(intersections, lb_sort_ascending);	//从小到大对交点横坐标进行排序

......
```

### 使用
- 创建框
    - oPolyBorder是框的对象  
    - 使用 **instance_create_depth**或**instance_create_layer** 创建一个框  
    为了方便描述，后文称该框为 **poly**
- 编辑顶点
    - **poly.listVertex** 为存储多边形的顶点的列表
    - 例如 `ds_list_add(poly.listVertex, [0, 0], [50, 50], [-50, 50])`  
    即可向多边形添加 **(0, 0)**、**(50, 50)**、**(-50, 50)** 三个顶点
    - 其他操作如删除顶点等就不再赘述，对 **listVertex** 进行操作即可
    - *注：添加的顶点坐标都是相对与多边形原点而言的*
- 将点限制在框内
    - 为了将点限制在框内，首先要判断是否出框 
        - 使用 `poly.contains(x, y)` 即可判断点是否在框内
        - `poly.relativeContains(x, y)` 差不多，不过传入的是相对多边形原点的坐标（较少用）
    - 如果出框的话，就需要得到离边框最近的位置
        - 使用 `poly.limit(x, y)` 即可得到 **(x, y)** 离边框最近的位置  
        返回值是一个长度为2的数组，下标**0、1**分别是结果的**x、y**
    - 所以最终的做法就是（如[示例1](objects/oDemo1)）：
        ```javascript
        //步事件(Step Event)
        if(!poly.contains(x, y)) {  //判断是否在内部
            var pos = poly.limit(x, y); //如果不在内部则得到限制结果
            x = pos[0];
            y = pos[1];
        }
        ```
- 对多边形框内部进行遮罩
    - 当你需要用到遮罩时，需要在对顶点进行更改之后  
    调用 `poly.updateDivide()` 来更新多边形的三角剖分
    - 为了使用遮罩，你需要创建一个表面（Surface），一般和屏幕大小一致  
    为了方便描述，后文称该表面为 **surf**
    - 调用 `poly.replaceSurfaceAlpha(surf)` 即可使用遮罩（如[示例1](oDemo1)）：
        ```javascript
        //绘制事件(Draw Event)
        if(!surface_exists(surf))   //当surf凭空消失时重新创建
            surf = surface_create(/* 宽 */, /* 高 */);
        
        surface_set_target(surf);   //设置在surf上绘制
        draw_clear_alpha(c_black, 0);   //清空表面
        /* 
            这里写想要被遮罩的东西 
        */
        surface_reset_target(); //设置在屏幕上绘制
        
        poly.replaceSurfaceAlpha(surf);    //使用遮罩
        drawSurfaceStrokeColor(surf, 0, 0, c_white);	//把遮罩结果和框画出来
        ```
- 多边形框旋转
    - 调整 **poly.rot** 即可调整旋转角度（顺时针）
    - 调整 **poly.rotSpeed** 即可调整旋转的速度  
    如 `poly.rotSpeed = 3;` 就是让框每步旋转3度
- 多边形框叠加
    - 大致思路是：
        - 如果点不在任何多边形框的内部
        - 那么就就将点限制到最近的那个多边形框
    - 请参考[示例3](objects/oDemo3)和[示例4](objects/oDemo4)

### 已知缺点
- 当在拐角移动时，可能穿过拐角（不会出框，原本是要绕过去）
- 只能限制点（对于较小的物体实际上也可以当成一个点）
- 编辑不便
- 使用多个框时，如果两个框有两条边比较近，但是没有合并在一起  
玩家移动时也有可能跨越这两个多边形
