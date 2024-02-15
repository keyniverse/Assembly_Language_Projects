INCLUDE Irvine32.inc
INCLUDE Macros.inc
main          EQU start@0

.data

Delay_FPS DWORD    70	;遊戲畫面更新速度
ageUP_FPS DWORD 1500	;變胖後等待時間
Start_Delay DWORD 300
AnimateFlag BYTE 0


BCol BYTE 125			; 螢幕寬度
BRow SBYTE 30			; 螢幕高度


;標題字串
START0 BYTE   "                                                                          ",0         
START1 BYTE   "                                                                          ",0
START2 BYTE   "        _____    _____    _____    _____  __     __                       ",0
START3 BYTE   "       |  __ \  |_   _|  / ____|  / ____| \ \   / /                       ",0
START4 BYTE   "       | |__) |   | |   | |  __  | |  __   \ \_/ /                        ",0
START5 BYTE   "       |  ___/    | |   | | |_ | | | |_ |   \   /      |           |      ",0
START6 BYTE   "       | |       _| |_  | |__| | | |__| |    | |       |  _______  |      ",0
START7 BYTE   "	     |_|      |_____|  \_____|  \_____|    |_|        V         V        ",0

;標題字串更新1
START3a BYTE  "       |  __ \  |_   _|  / ____|  / ____| \ \   / /       |* O *|         ",0
START4a BYTE  "       | |__) |   | |   | |  __  | |  __   \ \_/ /      --\_____/--       ",0
START5a BYTE  "       |  ___/    | |   | | |_ | | | |_ |   \   /      |  V     V  |      ",0

;標題字串更新2
START0b BYTE  "	                                                                         ",0               
START1b BYTE  "	                                                         _^_^_           ",0            
START2b BYTE  "	      _____    _____    _____    _____  __     __       /     \          ",0

;標題字串更新3
START0c BYTE  "                                                                          ",0            
START1c BYTE  "	                                                         _^_^_           ",0           
START2c BYTE  "	      _____    _____    _____    _____  __     __       /     \          ",0
START3c BYTE  "       |  __ \  |_   _|  / ____|  / ____| \ \   / /       |* O *|         ",0
START4c BYTE  "       | |__) |   | |   | |  __  | |  __   \ \_/ /      --\_____/--       ",0
START5c BYTE  "       |  ___/    | |   | | |_ | | | |_ |   \   /      |  V     V  |      ",0

;規則標題
rule_Title0 BYTE " -------  --    --  --       ------- ",0
rule_Title1 BYTE "|   _   \|  |  |  ||  |     |   ____|",0
rule_Title2 BYTE "|  |_|  ||  |  |  ||  |     |  |____ ",0
rule_Title3 BYTE "|      _/|  |  |  ||  |     |   ____|",0
rule_Title4 BYTE "|  |\  \ |  |__|  ||  |____ |  |____ ",0
rule_Title5 BYTE "|__| \__\\________/|_______||_______|",0

;規則
rule0 BYTE "Rule1:Use LEFT and RIGHT to control the Piggy.                   ",0
rule1 BYTE "Rule2:CTRL + LEFT/RIGHT can move faster.                         ",0
rule2 BYTE "Rule3:Eating a carrot adds 50 points to kgs.                     ",0
rule3 BYTE "Rule4:Touching a knife minuses one life.                         ",0
rule4 BYTE "Rule5:Getting eoungh kgs can move on to next age.                ",0
rule5 BYTE "HINT:YOUR GOAL IS TO MAKE PIGGY BE SOLD OUT.                     ",0


;標題字串
PressToStart1 BYTE "__  __  ___  __  __   __ __   _    __ ___  ___  _    __ ___  _   __  ___",0
PressToStart2 BYTE "|_) |_) |_  (_  (_   (_  |_) /_\  /   |__   |  / \  (_   |  /_\  |_)  | ",0
PressToStart3 BYTE "|   | \ |__ __) __)  __) |   |  \ \__ |__   |  \_/  __)  |  |  \ | \  | ",0
PressToStart4 BYTE "                  Press SPACE to start!!!",0

;age1
age1_a BYTE	"           ____                    ______________        ____________              _____             ",0
age1_b BYTE	"          /___ \                  /_____________/|      /___________/|            /____/|            ",0
age1_c BYTE	"         /    \ \                /              ||      |           ||           /     ||            ",0
age1_d BYTE	"        /      \ \              /    ___________|/      |     ______|/          /      ||            ",0
age1_e BYTE	"       /   /\   \ \            /    / /                 |   ||______           /       ||            ",0
age1_f BYTE	"      /   /  \   \ \          /    / /    _______       |   |/______/|        /___/|   ||            ",0
age1_g BYTE	"     /   /    \   \ \        |    / /    /______/|      |           ||             |   ||            ",0
age1_h BYTE	"    /   /______\   \ \        \    \ \   |_____| |      |     ______|/             |   ||            ",0
age1_i BYTE	"   /   /        \   \ \        \    \ \________| |      |   ||______           ____|   ||____        ",0
age1_j BYTE	"  /   /          \   \ \        \    \/________| |      |   |/______/|        /____|   |/___/|       ",0
age1_k BYTE	" /   /            \   \ \        \             | /      |           ||        |             ||       ",0
age1_l BYTE	"/___/              \___\/         \____________|/       |___________|/        |_____________|/       ",0

;age2
age2_a BYTE	"           ____                    ______________        ____________             _______            ",0
age2_b BYTE	"          /___ \                  /_____________/|      /___________/|           /______/\           ",0
age2_c BYTE	"         /    \ \                /              ||      |           ||          /        \\          ",0
age2_d BYTE	"        /      \ \              /    ___________|/      |     ______|/         /   ___    \\         ",0
age2_e BYTE	"       /   /\   \ \            /    / /                 |   ||______          /   //  \   ||         ",0
age2_f BYTE	"      /   /  \   \ \          /    / /    _______       |   |/______/|        \   \\  /   //         ",0
age2_g BYTE	"     /   /    \   \ \        |    / /    /______/|      |           ||         \___\\/   //          ",0
age2_h BYTE	"    /   /______\   \ \        \    \ \   |_____| |      |     ______|/              /   //           ",0
age2_i BYTE	"   /   /        \   \ \        \    \ \________| |      |   ||______               /   //___         ",0
age2_j BYTE	"  /   /          \   \ \        \    \/________| |      |   |/______/|            /   /_____/|       ",0
age2_k BYTE	" /   /            \   \ \        \             | /      |           ||           /          ||       ",0
age2_l BYTE	"/___/              \___\/         \____________|/       |___________|/          /___________|/       ",0

;age3
age3_a BYTE	"           ____                    ______________        ____________             ___________        ",0
age3_b BYTE	"          /___ \                  /_____________/|      /___________/|           /__________/|       ",0
age3_c BYTE	"         /    \ \                /              ||      |           ||          /           \\       ",0
age3_d BYTE	"        /      \ \              /    ___________|/      |     ______|/          |_______    ||       ",0
age3_e BYTE	"       /   /\   \ \            /    / /                 |   ||______              ______|   ||       ",0
age3_f BYTE	"      /   /  \   \ \          /    / /    _______       |   |/______/|           /______|   ||       ",0
age3_g BYTE	"     /   /    \   \ \        |    / /    /______/|      |           ||          /           //       ",0
age3_h BYTE	"    /   /______\   \ \        \    \ \   |_____| |      |     ______|/          \_______    \\       ",0
age3_i BYTE	"   /   /        \   \ \        \    \ \________| |      |   ||______             _______|   ||       ",0
age3_j BYTE	"  /   /          \   \ \        \    \/________| |      |   |/______/|          /_______|   ||       ",0
age3_k BYTE	" /   /            \   \ \        \             | /      |           ||          |           ||       ",0
age3_l BYTE	"/___/              \___\/         \____________|/       |___________|/          \___________//       ",0


;小豬第一關
pig_mid_1_1 BYTE "  _^_^_  ",0
pig_mid_1_2 BYTE " /     \ ",0
pig_mid_1_3 BYTE " |* O *| ",0
pig_mid_1_4 BYTE " \_____/ ",0
pig_mid_1_5 BYTE "| _____ |",0
pig_mid_1_6 BYTE " V     V ",0

pig_right_1_1 BYTE "  _^_^_ ",0
pig_right_1_2 BYTE " /     \",0
pig_right_1_3 BYTE " |* O *|",0
pig_right_1_4 BYTE " \_____/",0
pig_right_1_5 BYTE "/ ____ /",0
pig_right_1_6 BYTE " V    V ",0

pig_left_1_1 BYTE " _^_^_  ",0 
pig_left_1_2 BYTE "/     \ ",0
pig_left_1_3 BYTE "|* O *| ",0
pig_left_1_4 BYTE "\_____/ ",0
pig_left_1_5 BYTE "\ _____\",0
pig_left_1_6 BYTE " V     V",0

;小豬-第二關
pig_mid_2_1 BYTE "           ",0
pig_mid_2_2 BYTE "   _^_^_   ",0
pig_mid_2_3 BYTE "  /     \  ",0
pig_mid_2_4 BYTE "  |* O *|  ",0
pig_mid_2_5 BYTE " -\_____/- ",0
pig_mid_2_6 BYTE "|  V   V  |",0
pig_mid_2_7 BYTE "|  _____  |",0
pig_mid_2_8 BYTE " V       V ",0

pig_right_2_1 BYTE "            ",0
pig_right_2_2 BYTE "    _^_^_   ",0
pig_right_2_3 BYTE "   /     \  ",0
pig_right_2_4 BYTE "   |* O *|  ",0
pig_right_2_5 BYTE "  -\_____/- ",0
pig_right_2_6 BYTE " /  >  >  / ",0
pig_right_2_7 BYTE "/ _____  /  ",0
pig_right_2_8 BYTE " V     V    ",0

pig_left_2_1 BYTE ".          ",0
pig_left_2_2 BYTE "  _^_^_    ",0
pig_left_2_3 BYTE " /     \   ",0
pig_left_2_4 BYTE " |* O *|   ",0
pig_left_2_5 BYTE "-\_____/-  ",0
pig_left_2_6 BYTE "\  <  <  \ ",0
pig_left_2_7 BYTE " \  _____ \",0
pig_left_2_8 BYTE "   V     V ",0

;小豬-第三關
pig_mid_3_1  BYTE "    _^_^_    ",0
pig_mid_3_2  BYTE "   /     \   ",0
pig_mid_3_3  BYTE "   |* O *|   ",0
pig_mid_3_4  BYTE " --\_____/-- ",0
pig_mid_3_5  BYTE "|  V     V  |",0
pig_mid_3_6  BYTE "|           |",0
pig_mid_3_7  BYTE "|  _______  |",0
pig_mid_3_8  BYTE " V         V ",0

pig_right_3_1 BYTE "      _^_^_   ",0
pig_right_3_2 BYTE "     /     \  ",0
pig_right_3_3 BYTE "     |* O *|  ",0
pig_right_3_4 BYTE "   --\_____/--",0
pig_right_3_5 BYTE "  /   >   >  /",0
pig_right_3_6 BYTE " /          / ",0
pig_right_3_7 BYTE "/ _______  /  ",0
pig_right_3_8 BYTE " V       V    ",0

pig_left_3_1  BYTE "   _^_^_      ",0
pig_left_3_2  BYTE "  /     \     ",0
pig_left_3_3  BYTE "  |* O *|	   ",0
pig_left_3_4  BYTE "--\_____/--   ",0
pig_left_3_5  BYTE "\  <   <   \  ",0
pig_left_3_6  BYTE " \          \ ",0
pig_left_3_7  BYTE "  \  _______ \",0
pig_left_3_8  BYTE "    V       V ",0

;胡蘿蔔
sun0 BYTE "    ",0
sun1 BYTE "\|/ ",0
sun2 BYTE "| | ",0
sun3 BYTE "|_| ",0

;刀子
rain0 BYTE "    ",0
rain1 BYTE " __ ",0
rain2 BYTE "|__|",0
rain3 BYTE " \/ ",0

;you
you1 BYTE	"            ---    ---  .--------.   --    --    	 ",0
you2 BYTE	"            \  \  /  /  |  .--.  |  |  |  |  |    	 ",0
you3 BYTE	"             \  \/  /   |  |  |  |  |  |  |  |    	 ",0
you4 BYTE	"              \    /    |  |  |  |  |  |  |  |    	 ",0
you5 BYTE	"               |  |     |  |__|  |  |  |__|  |    	 ",0
you6 BYTE	"               |__|     |________|  \________/    	 ",0

;die
die1 BYTE	"          .------.      __     --------     --   --  ",0
die2 BYTE	"          |  --.  \    |  |   |   _____|   |  | |  | ",0
die3 BYTE	"          | |   \  |   |  |   |  |_____    |  | |  | ",0
die4 BYTE   "          | |    | |   |  |   |   _____|   |__| |__| ",0
die5 BYTE   "          | |__./  |   |  |   |  |_____     __   __  ",0
die6 BYTE	"          |______./    |__|   |________|   |__| |__| ",0

;sold
sold1 BYTE	"      .--------. .--------.  --       .------.     --  ",0
sold2 BYTE	"      |  ______| |  .--.  | |  |      |  --.  \   |  | ",0
sold3 BYTE	"      |  |_____. |  |  |  | |  |      | |   \  |  |  | ",0
sold4 BYTE  "      |______. | |  |  |  | |  |      | |    | |  |__| ",0
sold5 BYTE  "      .______| | |  |__|  | |  |____. | |__./  |   __  ",0
sold6 BYTE	"      |________| |________| |_______| |______./   |__| ",0

;小豬碰撞座標
pigCollisionX1 BYTE ?
pigCollisionX2 BYTE ?
pigCollisionY1 BYTE 29
pigCollisionY2 BYTE 33
pig_height BYTE 4
pig_width BYTE 7

;小豬扣血flag
pigLoseLive BYTE 0

;小豬位置
pigCoordinateX BYTE 10
pigCoordinateY BYTE 29

;掉落物位置 RockCoordinateX/RockCoordinateY
FallCoordX BYTE 51,11,31,61,21,41
FallCoordY SBYTE 0,-11,-22,-33,-44,-55

;障礙物碰撞座標
FallCollisionX1 BYTE ?,?,?,?,?,?
FallCollisionX2 BYTE ?,?,?,?,?,?
FallCollisionY1 BYTE 29,29,29,29,29,29
FallCollisionY2 BYTE 33,33,33,33,33,33
Fall_height BYTE 3
Fall_width BYTE 3
Hitflag BYTE 0

;螢幕清除字串
ClearStr BYTE "                                                                                                                                ",0
Clearkg BYTE "            "

;紀錄掉落物總數
Count_Fall Byte 2

;隨機變數-掉落物(0-蘿蔔，1-刀)
randVal BYTE 0,1,0,1,0,1

;關卡
age BYTE 1
;ageTitle BYTE " age : ",0
;ageCoordX BYTE 60
;ageCoordY SBYTE 15

;分數
kg DWORD 0
kgTitle BYTE "kgs : ",0
kgCoordX BYTE 130
kgCoordY SBYTE 3

;血量
Live BYTE "ω",0
LiveCount BYTE 3
LiveTitle BYTE "Live : ",0
LiveCoordX BYTE 130
LiveCoordY SBYTE 7
LiveShine BYTE 0

;顏色
color_white  DWORD white+(black*16)
color_green  DWORD green+(black*16)
color_brown  DWORD brown+(black*16)
color_yellow DWORD yellow+(black*16)
color_lightgray   DWORD lightgray+(black*16)
color_red DWORD red+(black*16)

;豬顏色
color_pink DWORD lightmagenta
color_pink_pig DWORD lightmagenta

.code
;在指定位置列印字串_____________________________________________________________
Form_String PROC USES eax ebx ecx edx,
	pStr: PTR BYTE,	;字串的pointer
	Xcoord: BYTE,	;座標X
	Ycoord: SBYTE,	;座標Y
	color: DWORD	;顏色

	mov dl,Xcoord
	mov dh,Ycoord
	call Gotoxy
	mov eax,color
	call SetTextColor
	mov edx,pStr
	call WriteString
	
	ret
Form_String ENDP

;在指定位置列印整數_____________________________________________________________
Form_Integer PROC USES eax ebx ecx edx,
    	column: BYTE,	;座標x
    	row: BYTE,	;座標y
	number: DWORD

    	mov  dl,column
    	mov  dh,row
    	call Gotoxy
	mov eax, white+(black*16)
    	call SetTextColor
	mov eax,number
	call WriteDec
    	ret
Form_Integer ENDP

;印出開始畫面_____________________________________________________________
pig_Start PROC USES eax ebx ecx edx
	INVOKE Form_String ,OFFSET START0,30,6,color_pink
	INVOKE Form_String ,OFFSET START1,30,7,color_pink
	INVOKE Form_String ,OFFSET START2,30,8,color_pink
	INVOKE Form_String ,OFFSET START3,30,9,color_pink
	INVOKE Form_String ,OFFSET START4,30,10,color_pink
	INVOKE Form_String ,OFFSET START5,30,11,color_pink
	INVOKE Form_String ,OFFSET START6,30,12,color_pink
	INVOKE Form_String ,OFFSET START7,30,13,color_pink
	INVOKE Form_String ,OFFSET START0,30,14,color_pink
	INVOKE Form_String ,OFFSET PressToStart1,32,20,color_white
	INVOKE Form_String ,OFFSET PressToStart2,32,21,color_white
	INVOKE Form_String ,OFFSET PressToStart3,32,22,color_white
	
keycheck:
        	call Readkey
        	.IF dx ==20h ;if space is pressed
            		call Clrscr
            		ret
        	.ENDIF
        	mov ecx , 4
	mov eax, Start_Delay	;螢幕更新速率
	call delay
	call start_Animate		;更新螢幕動畫
	loop keycheck
	ret
pig_Start ENDP

;顯示開頭動畫_____________________________________________________________
start_Animate PROC
	mov bl,AnimateFlag
	.IF bl == 0	
		INVOKE Form_String ,OFFSET START0,30,6,color_pink
        INVOKE Form_String ,OFFSET START1,30,7,color_pink
       	INVOKE Form_String ,OFFSET START2,30,8,color_pink
        INVOKE Form_String ,OFFSET START3,30,9,color_pink
        INVOKE Form_String ,OFFSET START4,30,10,color_pink
		INVOKE Form_String ,OFFSET START5,30,11,color_pink
		INVOKE Form_String ,OFFSET START6,30,12,color_pink
		INVOKE Form_String ,OFFSET START7,30,13,color_pink
		INVOKE Form_String ,OFFSET START0,30,14,color_pink
		INVOKE Form_String ,OFFSET PressToStart1,32,20,color_white
		INVOKE Form_String ,OFFSET PressToStart2,32,21,color_white
		INVOKE Form_String ,OFFSET PressToStart3,32,22,color_white
		mov bl,1
	.ELSEIF bl == 1
		INVOKE Form_String ,OFFSET START0,30,6,color_pink
		INVOKE Form_String ,OFFSET START1,30,7,color_pink
        INVOKE Form_String ,OFFSET START2,30,8,color_pink
        INVOKE Form_String ,OFFSET START3a,30,9,color_pink
        INVOKE Form_String ,OFFSET START4a,30,10,color_pink
		INVOKE Form_String ,OFFSET START5a,30,11,color_pink
		INVOKE Form_String ,OFFSET START6,30,12,color_pink
		INVOKE Form_String ,OFFSET START7,30,13,color_pink
		INVOKE Form_String ,OFFSET START0,30,14,color_pink
		INVOKE Form_String ,OFFSET START0,32,20,color_white
		INVOKE Form_String ,OFFSET START0,32,21,color_white
		INVOKE Form_String ,OFFSET START0,32,22,color_white
		mov bl,2
	.ELSEIF bl == 2
		INVOKE Form_String ,OFFSET START0b,30,6,color_pink
		INVOKE Form_String ,OFFSET START1b,30,7,color_pink
        INVOKE Form_String ,OFFSET START2b,30,8,color_pink
        INVOKE Form_String ,OFFSET START3a,30,9,color_pink
        INVOKE Form_String ,OFFSET START4a,30,10,color_pink
		INVOKE Form_String ,OFFSET START5a,30,11,color_pink
		INVOKE Form_String ,OFFSET START6,30,12,color_pink
		INVOKE Form_String ,OFFSET START7,30,13,color_pink
		INVOKE Form_String ,OFFSET START0,30,14,color_pink
		INVOKE Form_String ,OFFSET PressToStart1,32,20,color_white
		INVOKE Form_String ,OFFSET PressToStart2,32,21,color_white
		INVOKE Form_String ,OFFSET PressToStart3,32,22,color_white
		mov bl,3
	.ELSEIF bl == 3
		INVOKE Form_String ,OFFSET START0c,30,6,color_pink
		INVOKE Form_String ,OFFSET START1c,30,7,color_pink
        INVOKE Form_String ,OFFSET START2c,30,8,color_pink
        INVOKE Form_String ,OFFSET START3c,30,9,color_pink
        INVOKE Form_String ,OFFSET START4c,30,10,color_pink
		INVOKE Form_String ,OFFSET START5c,30,11,color_pink
		INVOKE Form_String ,OFFSET START6,30,12,color_pink
		INVOKE Form_String ,OFFSET START7,30,13,color_pink
		INVOKE Form_String ,OFFSET START0,30,14,color_pink
		INVOKE Form_String ,OFFSET START0,32,20,color_white
		INVOKE Form_String ,OFFSET START0,32,21,color_white
		INVOKE Form_String ,OFFSET START0,32,22,color_white
		mov bl,0
	.ENDIF
	mov AnimateFlag,bl
	ret
start_Animate ENDP

;印出規則畫面_____________________________________________________________
pig_Rule PROC USES eax ebx ecx edx
	INVOKE Form_String ,OFFSET rule_Title0,50,4,color_white
	INVOKE Form_String ,OFFSET rule_Title1,50,5,color_white
    INVOKE Form_String ,OFFSET rule_Title2,50,6,color_white
    INVOKE Form_String ,OFFSET rule_Title3,50,7,color_white
    INVOKE Form_String ,OFFSET rule_Title4,50,8,color_white
	INVOKE Form_String ,OFFSET rule_Title5,50,9,color_white

	
	INVOKE Form_String ,OFFSET rule0,45,15,color_yellow
	INVOKE Form_String ,OFFSET rule1,45,17,color_yellow
	INVOKE Form_String ,OFFSET rule2,45,19,color_yellow
	INVOKE Form_String ,OFFSET rule3,45,21,color_yellow
	INVOKE Form_String ,OFFSET rule4,45,23,color_yellow
	INVOKE Form_String ,OFFSET rule5,46,26,color_red
	INVOKE Form_String ,OFFSET PressToStart4,37,28,color_red
	
	
keycheck:
        	call Readkey
        	.IF dx ==20h ;if space is pressed
            		call Clrscr
            		ret
        	.ENDIF
        	mov ecx , 4
	mov eax, Start_Delay	;螢幕更新速率
	call delay
	loop keycheck
	ret
pig_Rule ENDP

;印出換關畫面_____________________________________________________________
ageUP1 PROC USES eax ebx ecx edx
	INVOKE Form_String ,OFFSET age1_a,30,10,color_white
	INVOKE Form_String ,OFFSET age1_b,30,11,color_white
	INVOKE Form_String ,OFFSET age1_c,30,12,color_white
	INVOKE Form_String ,OFFSET age1_d,30,13,color_white
	INVOKE Form_String ,OFFSET age1_e,30,14,color_white
	INVOKE Form_String ,OFFSET age1_f,30,15,color_white
	INVOKE Form_String ,OFFSET age1_g,30,16,color_white
	INVOKE Form_String ,OFFSET age1_h,30,17,color_white
	INVOKE Form_String ,OFFSET age1_i,30,18,color_white
	INVOKE Form_String ,OFFSET age1_j,30,19,color_white
	INVOKE Form_String ,OFFSET age1_k,30,20,color_white
	INVOKE Form_String ,OFFSET age1_l,30,21,color_white
	ret
ageUP1 ENDP

ageUP2 PROC USES eax ebx ecx edx
	INVOKE Form_String ,OFFSET age2_a,30,10,color_white
	INVOKE Form_String ,OFFSET age2_b,30,11,color_white
	INVOKE Form_String ,OFFSET age2_c,30,12,color_white
	INVOKE Form_String ,OFFSET age2_d,30,13,color_white
	INVOKE Form_String ,OFFSET age2_e,30,14,color_white
	INVOKE Form_String ,OFFSET age2_f,30,15,color_white
	INVOKE Form_String ,OFFSET age2_g,30,16,color_white
	INVOKE Form_String ,OFFSET age2_h,30,17,color_white
	INVOKE Form_String ,OFFSET age2_i,30,18,color_white
	INVOKE Form_String ,OFFSET age2_j,30,19,color_white
	INVOKE Form_String ,OFFSET age2_k,30,20,color_white
	INVOKE Form_String ,OFFSET age2_l,30,21,color_white
	ret
ageUP2 ENDP

ageUP3 PROC USES eax ebx ecx edx
	INVOKE Form_String ,OFFSET age3_a,30,10,color_white
	INVOKE Form_String ,OFFSET age3_b,30,11,color_white
	INVOKE Form_String ,OFFSET age3_c,30,12,color_white
	INVOKE Form_String ,OFFSET age3_d,30,13,color_white
	INVOKE Form_String ,OFFSET age3_e,30,14,color_white
	INVOKE Form_String ,OFFSET age3_f,30,15,color_white
	INVOKE Form_String ,OFFSET age3_g,30,16,color_white
	INVOKE Form_String ,OFFSET age3_h,30,17,color_white
	INVOKE Form_String ,OFFSET age3_i,30,18,color_white
	INVOKE Form_String ,OFFSET age3_j,30,19,color_white
	INVOKE Form_String ,OFFSET age3_k,30,20,color_white
	INVOKE Form_String ,OFFSET age3_l,30,21,color_white
	ret
ageUP3 ENDP

win PROC USES eax ebx ecx edx
	INVOKE Form_String ,OFFSET you1,40,10,color_white
	INVOKE Form_String ,OFFSET you2,40,11,color_white
	INVOKE Form_String ,OFFSET you3,40,12,color_white
	INVOKE Form_String ,OFFSET you4,40,13,color_white
	INVOKE Form_String ,OFFSET you5,40,14,color_white
	INVOKE Form_String ,OFFSET you6,40,15,color_white
	INVOKE Form_String ,OFFSET sold1,40,16,color_white
	INVOKE Form_String ,OFFSET sold2,40,17,color_white
	INVOKE Form_String ,OFFSET sold3,40,18,color_white
	INVOKE Form_String ,OFFSET sold4,40,19,color_white
	INVOKE Form_String ,OFFSET sold5,40,20,color_white
	INVOKE Form_String ,OFFSET sold6,40,21,color_white
	ret
win ENDP

Lose PROC USES eax ebx ecx edx
	INVOKE Form_String ,OFFSET you1,40,10,color_white
	INVOKE Form_String ,OFFSET you2,40,11,color_white
	INVOKE Form_String ,OFFSET you3,40,12,color_white
	INVOKE Form_String ,OFFSET you4,40,13,color_white
	INVOKE Form_String ,OFFSET you5,40,14,color_white
	INVOKE Form_String ,OFFSET you6,40,15,color_white
	INVOKE Form_String ,OFFSET die1,40,16,color_white
	INVOKE Form_String ,OFFSET die2,40,17,color_white
	INVOKE Form_String ,OFFSET die3,40,18,color_white
	INVOKE Form_String ,OFFSET die4,40,19,color_white
	INVOKE Form_String ,OFFSET die5,40,20,color_white
	INVOKE Form_String ,OFFSET die6,40,21,color_white
	ret
Lose ENDP


;生成掉落物_____________________________________________________________
CreateFalling PROC USES eax ebx ecx edx
	movzx ecx,Count_Fall
	mov edi,0
create_start:
	mov bl,FallCoordY[edi]
	cmp bl,0
	jl not_create
	.IF randVal[edi]==0
		INVOKE Form_String ,OFFSET sun0,FallCoordX[edi],bl,color_green
		inc bl
		INVOKE Form_String ,OFFSET sun1,FallCoordX[edi],bl,color_green
		inc bl
		INVOKE Form_String ,OFFSET sun2,FallCoordX[edi],bl,color_red
		inc bl
		INVOKE Form_String ,OFFSET sun3,FallCoordX[edi],bl,color_red
	.ELSE
		INVOKE Form_String ,OFFSET rain0,FallCoordX[edi],bl,color_lightgray
		inc bl
		INVOKE Form_String ,OFFSET rain1,FallCoordX[edi],bl,color_lightgray
		inc bl
		INVOKE Form_String ,OFFSET rain2,FallCoordX[edi],bl,color_lightgray
		inc bl
		INVOKE Form_String ,OFFSET rain3,FallCoordX[edi],bl,color_lightgray
	.ENDIF
not_create:
	inc edi
	dec ecx
	jne create_start
	ret
CreateFalling ENDP

;清空底部畫面(for掉落物)_____________________________________________________________
ClearGround PROC USES eax ebx ecx edx
	INVOKE Form_String,OFFSET ClearStr,0,24,color_white
	INVOKE Form_String,OFFSET ClearStr,0,25,color_white
	INVOKE Form_String,OFFSET ClearStr,0,26,color_white
	INVOKE Form_String,OFFSET ClearStr,0,27,color_white
	INVOKE Form_String,OFFSET ClearStr,0,28,color_white
	INVOKE Form_String,OFFSET ClearStr,0,29,color_white
	INVOKE Form_String,OFFSET ClearStr,0,30,color_white	
	INVOKE Form_String,OFFSET ClearStr,0,31,color_white
	INVOKE Form_String,OFFSET ClearStr,0,32,color_white
	INVOKE Form_String,OFFSET ClearStr,0,33,color_white
	ret
ClearGround ENDP

;清掉足跡(for小豬)_____________________________________________________________
ClearBottom PROC USES eax ebx ecx edx
	INVOKE Form_String,OFFSET ClearStr,0,27,color_white
	INVOKE Form_String,OFFSET ClearStr,0,28,color_white	
	INVOKE Form_String,OFFSET ClearStr,0,29,color_white
	INVOKE Form_String,OFFSET ClearStr,0,30,color_white
	INVOKE Form_String,OFFSET ClearStr,0,31,color_white
	INVOKE Form_String,OFFSET ClearStr,0,32,color_white
	INVOKE Form_String,OFFSET ClearStr,0,33,color_white
	INVOKE Form_String,OFFSET ClearStr,0,34,color_white
	ret
ClearBottom ENDP

;顯示分數_____________________________________________________________
WriteKg PROC USES eax ebx ecx edx
	INVOKE Form_String ,OFFSET kgTitle,kgCoordX,kgCoordY,color_white
	mov dl,kgCoordY
	add dl,2
	INVOKE Form_String ,OFFSET Clearkg,kgCoordX,dl,color_white
	INVOKE Form_Integer ,kgCoordX,dl,kg
	ret
WriteKg ENDP

;顯示血量_____________________________________________________________
WriteLive PROC USES eax ebx ecx edx
	INVOKE Form_String ,OFFSET Clearkg,LiveCoordX,LiveCoordY,color_white	;清掉被扣掉的血量
	INVOKE Form_String ,OFFSET LiveTitle,LiveCoordX,LiveCoordY,color_white
	mov dl,LiveCoordX
	add dl,5
	movzx ecx,LiveCount
	cmp ecx,0
	je no_live
write_all:
	add dl,2
	INVOKE Form_String ,OFFSET Live,dl,LiveCoordY,color_white
	loop write_all
no_live:
	ret
WriteLive ENDP

;畫小豬_____________________________________________________________
Createpig PROC USES eax ebx ecx edx,
	pStr1: PTR BYTE, pStr2: PTR BYTE, pStr3: PTR BYTE,
	pStr4: PTR BYTE, pStr5: PTR BYTE, pStr6: PTR BYTE,;字串的POINTER
	Xcoord: BYTE,  ;座標X
	color: DWORD   ;顏色

	INVOKE Form_String ,pStr1,Xcoord,29,color
	INVOKE Form_String ,pStr2,Xcoord,30,color
	INVOKE Form_String ,pStr3,Xcoord,31,color
	INVOKE Form_String ,pStr4,Xcoord,32,color
	INVOKE Form_String ,pStr5,Xcoord,33,color
	INVOKE Form_String ,pStr6,Xcoord,34,color
	ret
Createpig ENDP

Createpig2 PROC USES eax ebx ecx edx,
	pStr1: PTR BYTE, pStr2: PTR BYTE, pStr3: PTR BYTE, pStr4: PTR BYTE, 
	pStr5: PTR BYTE, pStr6: PTR BYTE, pStr7: PTR BYTE, pStr8: PTR BYTE,;字串的POINTER
	Xcoord: BYTE,  ;座標X
	color: DWORD   ;顏色

	INVOKE Form_String ,pStr1,Xcoord,27,color
	INVOKE Form_String ,pStr2,Xcoord,28,color
	INVOKE Form_String ,pStr3,Xcoord,29,color
	INVOKE Form_String ,pStr4,Xcoord,30,color
	INVOKE Form_String ,pStr5,Xcoord,31,color
	INVOKE Form_String ,pStr6,Xcoord,32,color
	INVOKE Form_String ,pStr7,Xcoord,33,color
	INVOKE Form_String ,pStr8,Xcoord,34,color
	ret
Createpig2 ENDP

;移動小豬_____________________________________________________________
pigMovement PROC USES eax
	call ReadKey
	.IF dx == 25h && ah == 73h	;if left&ctrl are pressed
		.IF pigCoordinateX > 2	;移動四個單位
           	dec pigCoordinateX
			dec pigCoordinateX
			dec pigCoordinateX
			dec pigCoordinateX
		.ENDIF

		.IF pigLoseLive==1
			mov eax,color_green
			mov pigLoseLive,0
		.ELSE
			mov eax,color_pink_pig
		.ENDIF
		;印出左小豬
		.IF age == 1
			INVOKE Createpig, OFFSET pig_left_1_1,OFFSET pig_left_1_2,OFFSET pig_left_1_3,OFFSET pig_left_1_4,
			OFFSET pig_left_1_5,OFFSET pig_left_1_6,pigCoordinateX,eax
		.ELSEIF age == 2
			INVOKE Createpig2, OFFSET pig_left_2_1,OFFSET pig_left_2_2,OFFSET pig_left_2_3,OFFSET pig_left_2_4,
			OFFSET pig_left_2_5,OFFSET pig_left_2_6,OFFSET pig_left_2_7,OFFSET pig_left_2_8,pigCoordinateX,eax
		.ELSE
			INVOKE Createpig2, OFFSET pig_left_3_1,OFFSET pig_left_3_2,OFFSET pig_left_3_3,OFFSET pig_left_3_4,
			OFFSET pig_left_3_5,OFFSET pig_left_3_6,OFFSET pig_left_3_7,OFFSET pig_left_3_8,pigCoordinateX,eax			
		.ENDIF
	.ELSEIF dx == 25h 	; if left is pressed
		.IF pigCoordinateX > 1	;移動兩個單位
           	dec pigCoordinateX
			dec pigCoordinateX
		.ENDIF

		.IF pigLoseLive==1
			mov eax,color_green
			mov pigLoseLive,0
		.ELSE
			mov eax,color_pink_pig
		.ENDIF

		;印出左小豬
		.IF age == 1
			INVOKE Createpig, OFFSET pig_left_1_1,OFFSET pig_left_1_2,OFFSET pig_left_1_3,OFFSET pig_left_1_4,
			OFFSET pig_left_1_5,OFFSET pig_left_1_6,pigCoordinateX,eax
		.ELSEIF age == 2
			INVOKE Createpig2, OFFSET pig_left_2_1,OFFSET pig_left_2_2,OFFSET pig_left_2_3,OFFSET pig_left_2_4,
			OFFSET pig_left_2_5,OFFSET pig_left_2_6,OFFSET pig_left_2_7,OFFSET pig_left_2_8,pigCoordinateX,eax
		.ELSE
			INVOKE Createpig2, OFFSET pig_left_3_1,OFFSET pig_left_3_2,OFFSET pig_left_3_3,OFFSET pig_left_3_4,
			OFFSET pig_left_3_5,OFFSET pig_left_3_6,OFFSET pig_left_3_7,OFFSET pig_left_3_8,pigCoordinateX,eax			
		.ENDIF
	.ELSEIF dx == 27h && ah == 74h ; if right&ctrl is pressed
		mov dl,BCol
		sub dl,16
		.IF pigCoordinateX < dl	;移動四個單位
			inc pigCoordinateX
			inc pigCoordinateX
            inc pigCoordinateX
			inc pigCoordinateX
		.ENDIF

		.IF pigLoseLive==1
			mov eax,color_green
			mov pigLoseLive,0
		.ELSE
			mov eax,color_pink_pig
		.ENDIF

		;印出右小豬
		.IF age == 1
			INVOKE Createpig, OFFSET pig_right_1_1,OFFSET pig_right_1_2,OFFSET pig_right_1_3,OFFSET pig_right_1_4,
			OFFSET pig_right_1_5,OFFSET pig_right_1_6,pigCoordinateX,eax			
		.ELSEIF age == 2	
			INVOKE Createpig2, OFFSET pig_right_2_1,OFFSET pig_right_2_2,OFFSET pig_right_2_3,OFFSET pig_right_2_4,
			OFFSET pig_right_2_5,OFFSET pig_right_2_6,OFFSET pig_right_2_7,OFFSET pig_right_2_8,pigCoordinateX,eax
		.ELSE
			INVOKE Createpig2, OFFSET pig_right_3_1,OFFSET pig_right_3_2,OFFSET pig_right_3_3,OFFSET pig_right_3_4,
			OFFSET pig_right_3_5,OFFSET pig_right_3_6,OFFSET pig_right_3_7,OFFSET pig_right_3_8,pigCoordinateX,eax			
		.ENDIF
	.ELSEIF  dx == 27h ; if right is pressed
		mov dl,BCol
		sub dl,16
		.IF pigCoordinateX < dl	;移動兩個單位
			inc pigCoordinateX
			inc pigCoordinateX
		.ENDIF

		.IF pigLoseLive==1
			mov eax,color_green
			mov pigLoseLive,0
		.ELSE
			mov eax,color_pink_pig
		.ENDIF

		;印出右小豬
		.IF age == 1
			INVOKE Createpig, OFFSET pig_right_1_1,OFFSET pig_right_1_2,OFFSET pig_right_1_3,OFFSET pig_right_1_4,
			OFFSET pig_right_1_5,OFFSET pig_right_1_6,pigCoordinateX,eax			
		.ELSEIF age == 2
			INVOKE Createpig2, OFFSET pig_right_2_1,OFFSET pig_right_2_2,OFFSET pig_right_2_3,OFFSET pig_right_2_4,
			OFFSET pig_right_2_5,OFFSET pig_right_2_6,OFFSET pig_right_2_7,OFFSET pig_right_2_8,pigCoordinateX,eax
		.ELSE
			INVOKE Createpig2, OFFSET pig_right_3_1,OFFSET pig_right_3_2,OFFSET pig_right_3_3,OFFSET pig_right_3_4,
			OFFSET pig_right_3_5,OFFSET pig_right_3_6,OFFSET pig_right_3_7,OFFSET pig_right_3_8,pigCoordinateX,eax			
		.ENDIF
	.ELSE
		.IF pigLoseLive==1
			mov eax,color_green
			mov pigLoseLive,0
		.ELSE
			mov eax,color_pink_pig
		.ENDIF

		;印出小豬
		.IF age ==1
			INVOKE Createpig, OFFSET pig_mid_1_1,OFFSET pig_mid_1_2,OFFSET pig_mid_1_3,OFFSET pig_mid_1_4,
			OFFSET pig_mid_1_5,OFFSET pig_mid_1_6,pigCoordinateX,eax
		.ELSEIF age == 2
			INVOKE Createpig2, OFFSET pig_mid_2_1,OFFSET pig_mid_2_2,OFFSET pig_mid_2_3,OFFSET pig_mid_2_4,
			OFFSET pig_mid_2_5,OFFSET pig_mid_2_6,OFFSET pig_mid_2_7,OFFSET pig_mid_2_8,pigCoordinateX,eax
		.ELSE
			INVOKE Createpig2, OFFSET pig_mid_3_1,OFFSET pig_mid_3_2,OFFSET pig_mid_3_3,OFFSET pig_mid_3_4,
			OFFSET pig_mid_3_5,OFFSET pig_mid_3_6,OFFSET pig_mid_3_7,OFFSET pig_mid_3_8,pigCoordinateX,eax
		.ENDIF
	.ENDIF
	ret
pigMovement ENDP

;更新移動物座標_____________________________________________________________
updateXY PROC USES eax ebx ecx edx esi edi
	movzx ecx,Count_Fall
	mov edi,0
start:
	inc FallCoordY[edi]	;往下掉1
	mov bl,FallCoordY[edi]
	.IF bl>=BRow		;掉落物掉到邊界，刷新掉落物
		call refresh_fall
	.ENDIF

	;設定掉落物碰撞框
	mov dl,FallCoordX[edi]
	mov FallCollisionX1[edi],dl
	mov FallCollisionX2[edi],dl
	mov dl,Fall_width
	add FallCollisionX2[edi],dl
	
	mov dl,FallCoordY[edi]
	mov FallCollisionY1[edi],dl
	inc FallCollisionY1[edi]
	mov FallCollisionY2[edi],dl
	mov dl,Fall_height
	add FallCollisionY2[edi],dl

	inc edi
	dec ecx
	jne start
	.IF age == 2
		mov pig_width, 10
		mov pigCollisionY1,27
	.ENDIF

	.IF age == 3
		mov pig_width, 13
	.ENDIF

	;設定小豬碰撞框
	mov dl,pigCoordinateX
	add dl,2
	mov pigCollisionX1,dl
	add dl,pig_width
	mov pigCollisionX2,dl	
	ret
updateXY ENDP

;碰撞判定_____________________________________________________________
collision PROC USES EAX EBX ECX EDX
	movzx ecx,Count_Fall
	mov edi,0
start:
	mov dl,FallCollisionX1[edi] 
	mov dh,FallCollisionX2[edi]
	.IF dl <= pigCollisionX2 && dl >= pigCollisionX1
		mov dl, FallCollisionY2[edi] 
		.IF dl <= pigCollisionY2 && dl >= pigCollisionY1
			.IF randVal[edi] == 0
				add kg,50
 				call WriteKg
			.ELSEIF randVal[edi] == 1
				dec LiveCount
				call WriteLive
				mov pigLoseLive,1
			.ENDIF
			call refresh_fall
			call ClearGround
		.ENDIF
	.ELSEIF dh <= pigCollisionX2 && dh >= pigCollisionX1
		mov dh, FallCollisionY2[edi] 
		.IF dh<= pigCollisionY2 && dh >= pigCollisionY1
			.IF randVal[edi] == 0
				add kg,50
 				call WriteKg
			.ELSEIF randVal[edi] == 1
				dec LiveCount
				call WriteLive
				mov pigLoseLive,1
			.ENDIF
			call refresh_fall
			call ClearGround
		.ENDIF
	.ENDIF
	inc edi
	dec ecx
	jne start

	ret
collision ENDP

;刷新掉落物_____________________________________________________________
refresh_fall PROC USES eax ebx ecx edx
	mov FallCoordY[edi],-3
	mov  eax,124     		;get random 0 to 123      
	call RandomRange 
       	inc  eax        		 ;make range 1 to 124
       	mov  FallCoordX[edi],al
	call ClearGround
	call Random32
	and al,1b		;只取個位數，隨機生成蘿蔔or刀
	mov randVal[edi],al
	ret
refresh_fall ENDP

;血量過低閃爍_____________________________________________________________
liveShining PROC USES eax ebx ecx edx
	.IF LiveCount == 1   ;血量剩1
		INVOKE Form_String ,OFFSET Clearkg,LiveCoordX,LiveCoordY,color_white
		.IF LiveShine == 0
			INVOKE Form_String ,OFFSET LiveTitle,LiveCoordX,LiveCoordY,color_red
			mov dl,LiveCoordX
			add dl,7
			INVOKE Form_String ,OFFSET Live,dl,LiveCoordY,color_red
			mov LiveShine,1
		.ELSE
			INVOKE Form_String ,OFFSET LiveTitle,LiveCoordX,LiveCoordY,color_white
			mov dl,LiveCoordX
			add dl,7
			INVOKE Form_String ,OFFSET Live,dl,LiveCoordY,color_white
			mov LiveShine,0
		.ENDIF
	.ENDIF
	ret
liveShining ENDP

;主程式_____________________________________________________________
main PROC
	call Randomize
Init:			;開始遊戲
	mov bl,0
	call pig_Start
	call Clrscr
	mov eax, Delay_FPS		;螢幕更新速率
	call delay

	call pig_Rule
	call Clrscr
	mov eax, Delay_FPS		;螢幕更新速率
	call delay

	call ageUP1
	mov eax,ageUP_FPS
	call delay
	call Clrscr
 	call WriteKg
	call WriteLive
GameStart:			;進入遊戲
	call updateXY
	call collision
	call ClearBottom
	call CreateFalling
	call pigMovement
	call liveShining
	cmp LiveCount,0
	je GameOver	
	cmp kg,50	;age up
	je ageChange1
	cmp kg,100
	je ageChange2
	cmp kg,150
	je WinGame	;win
	
back_to_game:
    mov eax, Delay_FPS		;螢幕更新速率
	call delay
	jmp GameStart

ageChange1:
	cmp age,2
	je back_to_game
	inc age
	add Count_Fall,2
	mov bl,0
	mov eax,color_white
	call SetTextColor
	call Clrscr		;清空畫面
	call ageUP2
	jmp trytry

ageChange2:
	cmp age,3
	je back_to_game
	inc age
	add Count_Fall,2
	mov bl,0
	mov eax,color_white
	call SetTextColor
	call Clrscr		;清空畫面
	call ageUP3
	jmp trytry
trytry:
	inc bl
	mov eax,ageUP_FPS
	call delay
	cmp bl,2
	jne trytry
	call Clrscr
 	call WriteKg
	call WriteLive

	mov edi,0
	mov al,0
	movzx ecx,Count_Fall
reset_position:
	mov FallCoordY[edi],al	;把掉落物移回最高點
	inc edi
	sub al,10
	loop reset_position
	jmp back_to_game

GameOver:
	mov eax,1000
	call delay
	mov eax, color_white
	call Clrscr
	call Lose 
	mov eax,3000
	call delay
	jmp EndGame

WinGame:
	mov eax,1000
	call delay
	mov eax, color_white
	mov eax, color_white
	mov eax, color_white
	call Clrscr
	call Clrscr
	mov eax, color_white
	call win
	mov eax,3000
	call delay
	jmp EndGame

EndGame:
	exit
main ENDP
END main