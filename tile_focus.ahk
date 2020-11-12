<#!Up::f("up")
<#!Down::f("down")
<#!Left::f("left")
<#!Right::f("right")

f(p){
	WinGetClientPos X, Y, W, H, "A"
	l := WinGetList()
	for this_id in l
	{
		WinGetClientPos X1, Y1, W1, H1, "ahk_id" this_id
		this_title := WinGetTitle("ahk_id" this_id)
		this_up := WInGetMinMax("ahk_id" this_id)
		if (this_title){
			if (this_up >= 0) {
				if (p == "up"){
					q := Y1 + H1
					if (y >= q) {
						WinActivate("ahk_id" this_id)
						break
					}
				}
				if (p == "down"){
					q := Y + H
					if (q <= Y1) {
						WinActivate("ahk_id" this_id)
						break
					}
				}
				if (p == "left"){
					q := X1 + W1
					if (X >= q) {
						WinActivate("ahk_id" this_id)
						break
					}
				}
				if (p == "right"){
					q := X + W
					if (q <= x1) {
						WinActivate("ahk_id" this_id)
						break
					}
				}
			}
		}
	}
}
