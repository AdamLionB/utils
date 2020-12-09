<#!Up::f("up")
<#!Down::f("down")
<#!Left::f("left")
<#!Right::f("right")

f(p){
	min_dist_x := -1
	min_dist_y := -1
	min_id := 0
	WinGetPos X2, Y2, W2, H2, "A"
	WinGetClientPos X, Y, W, H, "A"
	title := WinGetTitle("A")
	l := WinGetList()
	for this_id in l
	{
		WinGetPos X3, Y3, W3, H3, "ahk_id" this_id
		WinGetClientPos X1, Y1, W1, H1, "ahk_id" this_id
		this_title := WinGetTitle("ahk_id" this_id)
		this_up := WInGetMinMax("ahk_id" this_id)
		if (this_title){
			if (this_title != title){
				if (this_up >= 0) {
					if (p == "up"){
						q := Y1 + H1
						if (y >= q) {
							dist_x := Abs(X2 - X3)
							dist_y := Abs(Y2 - Y3 + H3)
							if (min_dist_x == -1 or (dist_y < min_dist_y)){
								min_dist_x := dist_x
								min_dist_y := dist_y
								min_id := this_id
							}
							if (dist_y == min_dist_y and (min_dist_x == -1 or (dist_x < min_dist_x))){
								min_dist_x := dist_x
								min_dist_y := dist_y
								min_id := this_id
							}
						}
					}
					if (p == "down"){
						q := Y + H
						if (q <= Y1) {
							dist_x := Abs(X2 - X3)
							dist_y := Abs(Y2 + H2 - Y3)
							if (min_dist_x == -1 or (dist_y < min_dist_y)){
								min_dist_x := dist_x
								min_dist_y := dist_y
								min_id := this_id
								
							}
							if (dist_y == min_dist_y and (min_dist_x == -1 or (dist_x < min_dist_x))){
								min_dist_x := dist_x
								min_dist_y := dist_y
								min_id := this_id
							}
						}
					}
					if (p == "left"){
						q := X1 + W1
						if (q <= X) {
							dist_x := Abs(X3+W3 - X2)
							dist_y := Abs(Y2 - Y3)
							if (min_dist_x == -1 or (dist_x < min_dist_x)){
								min_dist_x := dist_x
								min_dist_y := dist_y
								min_id := this_id
							}
							if (dist_x == min_dist_x and (min_dist_y == -1 or (dist_y < min_dist_y))){
								min_dist_x := dist_x
								min_dist_y := dist_y
								min_id := this_id
							}
						}
					}
					if (p == "right"){
						q := X + W
						if (q <= X1) {
							dist_x := Abs(X2 + W2 - X3)
							dist_y := Abs(Y2 - Y3)
							if (min_dist_x == -1 or (dist_x < min_dist_x)){
								min_dist_x := dist_x
								min_dist_y := dist_y
								min_id := this_id
							}
							if (dist_x == min_dist_x and (min_dist_y == -1 or (dist_y < min_dist_y))){
								min_dist_x := dist_x
								min_dist_y := dist_y
								min_id := this_id
							}
						}
					}
				}
			}
		}
	}
	WinActivate("ahk_id" min_id)
}
