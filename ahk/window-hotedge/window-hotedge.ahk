#Requires AutoHotkey v2.0
#SingleInstance Force

; 以管理员权限运行
if !A_IsAdmin
    Run '*RunAs "' A_ScriptFullpath '"'

; --- 1. 基础映射：Ctrl + 侧键 ---
^XButton1::Send "^{Right}"
^XButton2::Send "^{Left}"
; Alt + 滚轮功能
!WheelDown::Send "^{Right}" ; Alt + 滚轮向下 -> Ctrl + 右方向键
!WheelUp::Send "^{Left}"   ; Alt + 滚轮向上 -> Ctrl + 左方向键

; --- 2. 触发角：左下角呼出 Win 菜单 ---
SetTimer(CheckHotCorners, 100)
CheckHotCorners() {
    static lastState := 0
    CoordMode "Mouse", "Screen" 
    MouseGetPos(&x, &y)
    if (x <= 5 && y >= A_ScreenHeight - 5) {
        if (lastState == 0) {
            Send("{LWin}")
            lastState := 1
        }
    } else {
        lastState := 0 
    }
}

; --- 3. 辅助判断函数 ---

; 判断鼠标是否在任务栏上
IsOverTaskbar() {
    try {
        MouseGetPos(,, &hoverWin)
        currClass := WinGetClass(hoverWin)
        return (currClass == "Shell_TrayWnd" || currClass == "NotifyIconOverflowWindow" || currClass == "TaskListThumbnailWnd")
    }
    catch
        return false
}

; 判断是否在任务栏的左侧 3/4 区域
IsTaskbarLeftThreeFourths() {
    if !IsOverTaskbar()
        return false
    MouseGetPos(&x)
    return (x < A_ScreenWidth * 0.75)
}

; 判断是否在任务栏的剩余右侧区域
IsTaskbarRightFourth() {
    if !IsOverTaskbar()
        return false
    MouseGetPos(&x)
    return (x >= A_ScreenWidth * 0.75)
}

IsAtRightEdge() => (MouseGetPos(&x), x >= A_ScreenWidth - 3)
IsAtTopEdge() => (MouseGetPos(,&y), y <= 3)

; --- 4. 功能映射区 ---

; 【任务栏左侧 3/4】：滚动切换虚拟桌面
#HotIf IsTaskbarLeftThreeFourths()
WheelDown::Send "^#{Right}"
WheelUp::Send "^#{Left}"
MButton::Send "#{Tab}" 
#HotIf

; 【任务栏右侧 1/4】：滚动切换 Web 标签页 (Ctrl + Tab)
#HotIf IsTaskbarRightFourth()
WheelDown::Send "^{Tab}"
WheelUp::Send "^+{Tab}"
#HotIf

; 【右边缘下半部】 & 【顶部边缘左半部】：滚动切换标签页
#HotIf (IsAtRightEdge() && (MouseGetPos(,&y), y > A_ScreenHeight / 2)) || (IsAtTopEdge() && (MouseGetPos(&x), x < A_ScreenWidth / 2))
WheelDown::Send "^{Tab}"
WheelUp::Send "^+{Tab}"
#HotIf

; 【右边缘上半部】：滚动调节音量
#HotIf IsAtRightEdge() && (MouseGetPos(,&y), y <= A_ScreenHeight / 2)
WheelDown::Send "{Volume_Down}"
WheelUp::Send "{Volume_Up}"
#HotIf

; 【顶部边缘右半部】：滚动跳转页面首尾
#HotIf IsAtTopEdge() && (MouseGetPos(&x), x >= A_ScreenWidth / 2)
WheelDown::Send "^{End}"
WheelUp::Send "^{Home}"
#HotIf
