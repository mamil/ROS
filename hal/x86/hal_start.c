/**********************************************************
        开始入口文件hal_start.c
**********************************************************/
#include "rostypes.h"
#include "rosmctrl.h"

void hal_start()
{
    //第一步：初始化hal层
    init_hal();
    //第二步：初始化内核层
    init_krl();
    for(;;);
    return;
}
