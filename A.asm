.MODEL SMALL
.STACK 64
.DATA

;                                      ------This is Final Version, Combine With Order Member------
; LOG IN  - 238
; MENU    - 470
; CASE 1  - 
; CASE 2  - 
; CASE 3  - 
; CASE 4  - 1128
; CASE 4(NO_DISCOUNT)  - 1942
; RECEIPT - 2447

MSG_ENDING1 DB 10,13,"                 -----------------------------------------"
MSG_ENDING2 DB 10,13,"                 *                                       *"
MSG_ENDING3 DB 10,13,"                 *     THANK YOU FOR USING OUR SYSTEM    *" 
MSG_ENDING4 DB 10,13,"                 *               BYE BYE !!              *" 
MSG_ENDING5 DB 10,13,"                 -----------------------------------------",10,13,"$"

;=====================================================================================================================

	PY_TotalBefore DW 0					 					;This is total before do any calculate
	PY_DISCOUNT    DB 9										;This is 11.111%, 11.111% = 9
	
	FINAL_INPUT_USER DB 4 DUP("$")							;This is user input character : '1'  '2'  '3'  '4'
	FINAL_DIGIT_USER DB ?,?,?,?								;This is user digit      	  :  1    2    3    4
	INPUT_ONE   DB ?										;This is user digit 1
	INPUT_TWO   DB ?										;					2
	INPUT_THREE DB ?										;					3
	INPUT_FOUR  DB ?										;					4
	                            ;17
	MSG_DESIGN1 DB 10,13,"                 -----------------------------------------"
	MSG_DESIGN2 DB 10,13,"                 *                                       *"
	MSG_DESIGN3 DB 10,13,"                 *        WELCOME TO PAYMENT PAGE        *"
	MSG_DESIGN5 DB 10,13,"                 *                                       *"
	MSG_DESIGN4 DB 10,13,"                 -----------------------------------------",10,13,"$"
	
	
	MSG_PY_NEWLINE     DB 10,13,"$"
	MSG_PY_LINE        DB       10,13,"                                             ----------$"
	MSG_PY_BeforeTotal DB 10,13,10,13,"                 Previous Payment          : RM $"
	MSG_PY_DISCOUNT    DB       10,13,"                 Discount 11.111%          : RM $"
	MSG_PY_AfterTotal  DB       10,13,"                 Final Payment             : RM $"
	MSG_PY_User        DB       10,13,"                 Enter Your Amount(RM9999) : RM $"
	MSG_PY_BACK		   DB       10,13,"                 Successful!               : RM $"
	MSG_PY_Receipt     DB       10,13,"                 Do you need a receipt (Y/N)? : $"
	
	QUOTIENT_BEFORE_DISC DB ?,?,?,?								;This is Quotient Before Discount   ,RM546 = '5' '4' '6'
	QUOTIENT_DISCOUNT    DB ?,?,?								;This is Quotient Discount Quotient ,RM60  = '6' '0'
	QUOTIENT_AFTER_DISC  DB ?,?,?								;This is Quotient After Discount    ,RM485 = '4' '8' '5'
	QUOTIENT_USER_FEE    DB ?,?,?,?								;This is Quotient User Fee          ,RM748 = '7' '4' '8'
	QUOTIENT_USER_INPUT  DW ?,?,?,?								;This is Quotient User Input        ,RM1234
	
	INPUT_CAL_ONE   DW ?
	INPUT_CAL_TWO   DW ?
	INPUT_CAL_THREE DW ?
	INPUT_CAL_FOUR  DW ?
	
	REMAINDER_DISCOUNT DB 3 DUP ("$"),'$'						;This is Remainder Disocunt       ,RM .666
	REMAINDER_AT_DC    DB ?,?,?									;This is Remainder After Discount ,RM .334
	REMAINDER_AT_DC_DIGIT    DB ?,?,?							;This is Remainder After Discount ,RM .334, Digit Format
	
	GET_REMAINDER_DISCOUNT DB ?									;This to get Remainder Disocunt       ,546/9 = 60(Q) 6(R)
	
	TOTAL_DISCOUNT   DB ?		;This is Total Disocunt           ,RM60
	TOTAL_AT_DC      DW ?		;This is Total After Discount     ,RM485
	TOTAL_USER_INPUT DW ?		;This is Total User Input    	  ,RM1234
	TOTAL_BACK_PY    DW ?		;This is Total Remainder For User ,RM748
	TOTAL_NO_DC      DW ?       ;This is Total No Discount Payment,
	
;=======================
	MSG_PY     DB 10,13,"        Do you have any discount code(Y / N / X=Back)        : $"
	MSG_PY_YES DB 10,13,"        Please Enter your Discount Code(xx999)               : $"
	
	MSG_PY_UNSUC DB 13,10,10,13,"       ----This is invalid Discount Code!! You can't get discount----",10,13,"$"
	
	DIS_CODE DB "AB123"
	U_CODE DB 5 DUP(0)
	DIS_WRONG DB 'Y'
	
;=====================================================================================================================


;=====================================================================================================================

;                             +++++++++++++++++++++++++++++++Receipt++++++++++++++++++++++++++++

MSG_RECEIPT_DESIGN_1 DB 10,13,"      ----------------------------------------------------------------"
MSG_RECEIPT_DESIGN_2 DB 10,13,"      *                             RECEIPT                          *"
MSG_RECEIPT_DESIGN_3 DB 10,13,"      *                            ---------                         *"
MSG_RECEIPT_THANKYOU DB 10,13,"      * Thank You For Purchasing!                                    *"   
MSG_RECEIPT_DESIGN_4 DB 10,13,"      *    Member ID : M1234                                         *"
MSG_RECEIPT_DESIGN_5 DB 10,13,"      *                                                              *"
MSG_RECEIPT_DESIGN_6 DB 10,13,"      *              ITEM                             PRICE          *"
MSG_RECEIPT_DESIGN_7 DB 10,13,"      *           -----------                       ---------        *","$"
MSG_RECEIPT_DESIGN_8 DB "                                      *$"
MSG_RECEIPT_DESIGN_9 DB "                                     *$"

MSG_LINE       DB 10,13,"      *                                                              *$"
MSG_TT         DB 10,13,"      *    Total Price : RM $"

C_NEWLINE EQU 10,13,'$'
D10 DB C_NEWLINE,"                 Back to Menu?(Y/N)",'$'
errorMsg db "                 Please enter y or n only $"
NEWLINE DB C_NEWLINE,'$'


;                                      +++++++++++++++++++Check Out Order++++++++++++++++++++++

MSG_CK_DESIGN_1 DB 10,13,"      ----------------------------------------------------------------"
MSG_CK_DESIGN_2 DB 10,13,"      *                        Check Out List                        *"
MSG_CK_DESIGN_3 DB 10,13,"      *                       ----------------                       *"
MSG_CK_DESIGN_5 DB 10,13,"      *                                                              *"
MSG_CK_DESIGN_6 DB 10,13,"      *              ITEM                             PRICE          *"
MSG_CK_DESIGN_7 DB 10,13,"      *           -----------                       ---------        *","$"
MSG_CK_DESIGN_8 DB "                                      *$"
MSG_CK_DESIGN_9 DB "                                     *$"

TOTAL_USER_NUMBER_CK   DB ?,?,?
TOTAL_USER_NUMBER_CK_4 DB ?,?,?,?

MSG_CK_DESIGN11   DB 10,13,"      *--------------------------------------------------------------*$"
MSG_TT_CK         DB 10,13,"      *                                Total Price : RM $"
MSG_CK_DESIGN22   DB 10,13,"      *--------------------------------------------------------------*$"
MSG_CK_DESIGN33   DB "          *$"
MSG_CK_DESIGN44   DB "         *$"

DATA9 DB "Any Problem?(Y/N)$"
DATA10 DB C_NEWLINE,"1.Proceed to payment",C_NEWLINE, '$'
DATA11 DB "2.Back to menu ",C_NEWLINE,'$'
DATA12 DB "Please enter a number: $"
DATA13 DB "*",C_NEWLINE,'$'
errorMsg1 db "Please enter y or n only $"
NEWLINE1 DB C_NEWLINE,'$'

;=====================================================================================================================




;=====================================================================================================================

;                                       ++++++++++++++++++++++++Menu+++++++++++++++++++++++++++++++++++++++
MENU DB 10,13,'             --------------------------------------------------'
	 DB 10,13,'             **                                              **'
	 DB 10,13,'             **              ****  MENU LIST  ****           **' 
     DB 10,13,'             **                                              **'	 
     DB 10,13,'             **         Please Select your Option:           **'
	 DB 10,13,'             **                                              **'
     DB 10,13,'             **                 1.Product List               **' 
     DB 10,13,'             **                 2.Modify Cart                **'
     DB 10,13,'             **                 3.Check Out Order            **'
     DB 10,13,'             **                 4.Payment                    **'
     DB 10,13,'             **                 5.Exit                       **'
	 DB 10,13,'             **                                              **'
     DB 10,13,'             --------------------------------------------------$'
               
NUMBER DB 1,2,3,4,5

PROM1 DB 10,13,10,13,'                 Please Enter a number : $'

;INVALID
IVMG DB 10,13,10,13,'******INVALID ENTRY ! Try Again ******$'

MSG1 DB "THIS IS CASE 1 $"
MSG2 DB "THIS IS CASE 2 $"
MSG3 DB "THIS IS CASE 3 $"
MSG4 DB "THIS IS CASE 4 $"

;                                        +++++++++++++++++++++++++++++++++LogIn++++++++++++++++++++++++++++
  DNAME DB "M1234"
  DANAME DB "A1234"
  DPSW DB "MP1234"
  DAPSW DB "AP1234"
  
  IANAME DB 5 DUP (0)
  INAME DB 5 DUP (0)
  IPSW  DB 6 DUP (0)
  IAPSW  DB 6 DUP (0)
	 
  ACCOUNT DB 10,13,'             --------------------------------------------------'
	      DB 10,13,'             **                                              **'
	      DB 10,13,'             **            ***** MENU LIST *****             **' 
          DB 10,13,'             **                                              **'	 
          DB 10,13,'             **         -Please LOGIN Your ACCOUNT-          **'
	      DB 10,13,'             **                                              **'
	      DB 10,13,'             **        1.MEMBER            2.ADMIN           **'
	      DB 10,13,'             **----------------------------------------------**$'
	   
  STR3       DB 13,10,"             Please Select your Account : $"  
  STR4 DB 10,13,10,13,"             Please Enter your ADMIN ID : $"	 
  STR1 DB 10,13,10,13,"             Please Enter your USER ID  : $"	   
  STR2       DB 13,10,"             Please Enter your PASSWORD : $"
  
  IMSG       DB 13,10,"             INVALID FORMAT :(  PLEASE TRY AGAIN !$"
  VMSG       DB 13,10,"             ACCESS GRANTED :) ! $"
  
  ;SMSG DB 13,10,"YOU HAVE TRY MORE THAN 3 TIMES ! TRY AGAIN LATER -_- $"
  COUNT DB 0
  
 ;                              +++++++++++++++++++++++++++++++++Admin LogIn++++++++++++++++++++++++++++++
 
 AMENU DB 10,13,'             --------------------------------------------------'
	   DB 10,13,'             **                                              **'
	   DB 10,13,'             **         **** ADMIN  MENU LIST  ****          **' 
       DB 10,13,'             **                                              **'	 
       DB 10,13,'             **         Please Select your Option:           **'
	   DB 10,13,'             **                                              **'
       DB 10,13,'             **                 1.Edit Stock                 **'
       DB 10,13,'             **                 2.Exit                       **'
	   DB 10,13,'             **                                              **'
       DB 10,13,'             --------------------------------------------------$'	

	sentence db 10,13,10,13,"Do you want to continue(y/n)?$"	 


;=====================================================================================================================





;=====================================================================================================================

NEWLINE_PD DB 10,13,"$"

MSG_DESIGN_PD  DB 10,13,"      ----------------------------------------------------------------"
MSG_DESIGN_PD2 DB 10,13,"      *                         Product List                         *"
MSG_TITLE  	   DB 10,13,"      *   NO                   ITEM                    UNIT PRICE    *"
MSG_TITLE_LINE DB 10,13,"      *  ----      -------------------------------     ----------    *"
MSG_PD11  	   DB 10,13,"      *   1.       Ground Boots Men Football             RM 159      *"
MSG_PD22       DB 10,13,"      *   2.       Ownthegame Shoes Men Basketball       RM 122      *"
MSG_PD33       DB 10,13,"      *   3.       X9000L4 Shoes Men Running             RM 231      *"
MSG_PD44       DB 10,13,"      *   4.       Drawn Shmoofoil Logo Tee              RM 149      *"
MSG_PD55       DB 10,13,"      *   5.       Jersey Football                       RM 129      *"
MSG_PD66       DB 10,13,"      *   6.       EXTPLY Tee Men Basketball             RM 119      *"
MSG_PD77       DB 10,13,"      *   7.       Cushioned Ankle Socks Training        RM 29       *"
MSG_PD88       DB 10,13,"      *   8.       Low-Cut Socks 3 Pairs Training        RM 55       *"
MSG_DESIGN_PD4 DB 10,13,"      ----------------------------------------------------------------","$"

MSG_PD1        DB 10,13,"           Ground Boots Men Football                 RM 159     $"
MSG_PD2        DB 10,13,"           Ownthegame Shoes Men Basketball           RM 122     $"
MSG_PD3        DB 10,13,"           X9000L4 Shoes Men Running                 RM 231     $"
MSG_PD4        DB 10,13,"           Drawn Shmoofoil Logo Tee                  RM 149     $"
MSG_PD5        DB 10,13,"           Jersey Football                           RM 129     $"
MSG_PD6        DB 10,13,"           EXTPLY Tee Men Basketball                 RM 119     $"
MSG_PD7        DB 10,13,"           Cushioned Ankle Socks Training            RM 29      $"
MSG_PD8        DB 10,13,"           Low-Cut Socks 3 Pairs Training            RM 55      $"

MSG_BUY DB 10,13,"      Please select one product to buy (X =BACK) : $"
MSG_CONFIRM DB 10,13,"      ARE YOU SURE WANT TO BUY THIS PRODUCT?(Y / N) : $"
MSG_ERROE_INPUT DB 10,13,"      Sorry, this is invalid input $"
MSG_SUCCESS_BUY DB 10,13,"      Successful add to chart! $"
MSG_ASK_AGAIN DB 10,13,"      Do you want to buy another product>(Y / N) : $"
TOTAL_USER_BUY DW ?

TOTAL_USER_NUMBER DB ?,?,?
TOTAL_USER_NUMBER_4 DB ?,?,?,?
USER_INPUT DB ?
OUTPUT_RECEIPT DB 30 DUP ("$")



;=====================================================================================================================




;=====================================================================================================================

;                                      +++++++++++++++++Modify Chart++++++++++++++++++++++++

MSG_MD_DESIGN_1 DB 10,13,"      ----------------------------------------------------------------"
MSG_MD_DESIGN_2 DB 10,13,"      *                            Modify Chart                      *"
MSG_MD_DESIGN_3 DB 10,13,"      *                           --------------                     *"
MSG_MD_DESIGN_4 DB 10,13,"      *                                                              *"   
MSG_MD_DESIGN_5 DB 10,13,"      *              ITEM                             PRICE          *"
MSG_MD_DESIGN_6 DB 10,13,"      *           -----------                       ---------        *","$"

MSG_MD_DESIGN_7 DB "                                      *$"
MSG_MD_DESIGN_8 DB "                                     *$"

TOTAL_USER_NUMBER_MD   DB ?,?,?
TOTAL_USER_NUMBER_MD_4 DB ?,?,?,?

promptMsg db "Do you want DELETE ALL ?$"
errorMsg_1 db "Please enter y or n only $"

deletemsg db "                      ************** All had been DELETED ! **************** $"


;                                      +++++++++++++++++++++Edit Stock+++++++++++++++++++++


	
	ms1 db '                    Enter Product Name   :$'
	ms2 db '                    Enter Product Prices :$'
	array db 100 dup("$")
	info db 10,13,'$'
	labletop  db '                    ---------------------------------$'
	vars      db '                    * Product Name & Product Amount *$'
	lableside db "*$"
	space db "                                 $"
	prompt_Msg db "                 do you want to continue printing? (Y/N)$"
	ttlxian  db "                  Edit Stock",10,13
	ttlxian1 db "                                 ----------",10,13,"$" 
	
	

;=====================================================================================================================



;---------------------------Start Coding--------------------

.Code
MAIN PROC FAR

MOV AX,@DATA
MOV DS,AX
MOV AX,0000

;COLOR
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0

;==================================================================(LogIn Start)=================================
;TITLE COLOR
MOV AX,0600H
MOV BH,7EH		;background = grey, font = yellow
MOV CX,060FH
MOV DX,063CH
INT 10H

;MEMBER COLOR
MOV AX,0600H
MOV BH,71H		;background = grey, font = blue
MOV CX,0A16H
MOV DX,0A1FH
INT 10H

;ADMIN COLOR
MOV AX,0600H
MOV BH,74H		;background = grey, font = red
MOV CX,0A2AH 
MOV DX,0A32H
INT 10H

 MOV AH,09H
  LEA DX,ACCOUNT
  INT 21H

;-------------SELECT YOUR ACCOUNT-------------------------------------
  MOV AH,09H
  LEA DX,STR3
  INT 21H
  
  MOV AH,01H
  INT 21H
  
 
 ;---------------------------CHECK ----------------
 CHECK_MEMBER:
cmp al,'1'
JE MEMBER


 CHECK_ADMIN:
cmp al,'2'
JE ADMIN


ADMIN:
;---------OUTPUT STRING I (USERNAME)-----------------
  MOV AH,09H
  LEA DX,STR4
  INT 21H
;-----------------------------------
  MOV CX,5
  MOV SI,0
GETANAME:
  MOV AH,01H
  INT 21H
  MOV IANAME[SI],AL
  INC SI
  LOOP GETANAME
 
 ;---------OUTPUT STRING 2 (PASSWORD)-----------------------
  MOV AH,09H
  LEA DX,STR2
  INT 21H 
;----------------------------------- 
  MOV CX,6
  MOV SI,0
GETAIPSW:
  MOV AH,07H
  INT 21H
  MOV IAPSW[SI],AL
  INC SI
  LOOP GETAIPSW
 
;--------------VALIDATION CHECK  -----------------------
  MOV SI,0 ;(USERNAME)
  MOV DI,0 ; (PASSWORD)
 
;---------------------------------------------------------------------------------  
CHECKAN:
  CMP SI,5          ;COMPARE SI=1
  JE CHECKAP
  MOV BL,IANAME[SI]  ;CMP INAME & DNAME  (SI=1) A=A
  CMP BL,DANAME[SI]
  JE ANEXTN          ;JUMP TO NEXTN (SI=1) A=A
  JNE APRINTI        ;JUMP INVALID WHEN (SI=1) BUT A!=a  (PRINTI)
  
ANEXTN:
  INC SI            ;INCREASE SI++  (SI=2)
  JMP CHECKAN         ;BACK TO CHECK AND LOOP

;---------------------------------------------------------------------------------  
CHECKAP:
  CMP DI,6          ;COMPARE DI=1
  JE APRINTV         ; JUMP WHEN IT IS VALID
  MOV BL,DAPSW[DI]   ;CMP DPSW & IPSW  (DI=1) A=A
  CMP BL,IAPSW[DI]
  JE ANEXTP          ;JUMP TO NEXTN (DI=1) A=A
  JNE APRINTI        ;JUMP INVALID WHEN (DI=1) BUT A!=a  (PRINTI)
  
ANEXTP:
  INC DI            ;INCREASE DI++  (DI=2)
  JMP CHECKAP        ;BACK TO CHECK AND LOOP
  
;-------------------------------------------------------------------------------  
APRINTV:             ;VALID MESSAGE
  MOV AH,09H
  LEA DX,VMSG
  INT 21H
  JMP ADMINMENU
  
APRINTI :            ;INVALID MESSAGE
  MOV AH,09H
  LEA DX,IMSG
  INT 21H
  JMP ADMIN
 
;------------------------------------------------------MEMBER----------------------------------------- 
MEMBER:
  CMP COUNT,3
  JNE START_LOGIN_HERE
  JMP EXIT  

START_LOGIN_HERE:	
;---------OUTPUT STRING I (USERNAME)-----------------
  MOV AH,09H
  LEA DX,STR1
  INT 21H
;-----------------------------------
  MOV CX,5
  MOV SI,0
GETINAME:
  MOV AH,01H
  INT 21H
  MOV INAME[SI],AL
  INC SI
  LOOP GETINAME
  
;---------OUTPUT STRING 2 (PASSWORD)-----------------------
  MOV AH,09H
  LEA DX,STR2
  INT 21H 
;----------------------------------- 
  MOV CX,6
  MOV SI,0
GETIPSW:
  MOV AH,07H
  INT 21H
  MOV IPSW[SI],AL
  INC SI
  LOOP GETIPSW
 
;--------------VALIDATION CHECK  -----------------------
  MOV SI,0 ;(USERNAME)
  MOV DI,0 ; (PASSWORD)
 
;---------------------------------------------------------------------------------  
CHECKN:
  CMP SI,5          ;COMPARE SI=1
  JE CHECKP
  MOV BL,INAME[SI]  ;CMP INAME & DNAME  (SI=1) A=A
  CMP BL,DNAME[SI]
  JE NEXTN          ;JUMP TO NEXTN (SI=1) A=A
  JNE PRINTI        ;JUMP INVALID WHEN (SI=1) BUT A!=a  (PRINTI)
  
NEXTN:
  INC SI            ;INCREASE SI++  (SI=2)
  JMP CHECKN         ;BACK TO CHECK AND LOOP

;---------------------------------------------------------------------------------  
CHECKP:
  CMP DI,6          ;COMPARE DI=1
  JE PRINTV         ; JUMP WHEN IT IS VALID
  MOV BL,DPSW[DI]   ;CMP DPSW & IPSW  (DI=1) A=A
  CMP BL,IPSW[DI]
  JE NEXTP          ;JUMP TO NEXTN (DI=1) A=A
  JNE PRINTI        ;JUMP INVALID WHEN (DI=1) BUT A!=a  (PRINTI)
  
NEXTP:
  INC DI            ;INCREASE DI++  (DI=2)
  JMP CHECKP        ;BACK TO CHECK AND LOOP
  
;-------------------------------------------------------------------------------  
PRINTV:             ;VALID MESSAGE
  MOV AH,09H
  LEA DX,VMSG
  INT 21H
  JMP TOPMENU
  
PRINTI :            ;INVALID MESSAGE
  MOV AH,09H
  LEA DX,IMSG
  INT 21H
  INC COUNT
  JMP MEMBER



;==================================================================(LogIn End)=================================





;==================================================================(Menu Start)=================================

TOPMENU:
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
MOV DI,0
MOV SI,0

;COLOR
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0

;TITLE COLOR
MOV AX,0600H
MOV BH,7EH		;background = grey, font = yellow
MOV CX,060FH
MOV DX,063CH
INT 10H

	MOV AH,09H
	LEA DX,MENU
	INT 21H

	;ASK USER TO INPUT SELECTION
    MOV AH,09H
    LEA DX,PROM1
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
	
	MOV AH,09H
	LEA DX,NEWLINE
	INT 21H
	INT 21H

    CMP AL,1
    JNE TRY1
    JMP CASE1

TRY1:
    CMP AL,2
    JNE TRY2
    JMP CASE2
TRY2:
    CMP AL,3
    JNE TRY3
	JMP CASE3
TRY3:
	CMP AL,4
	JNE TRY4
	JMP CASE4
TRY4:  
	CMP AL,5
	JNE SHOW_ERROR_MSG
	JMP EXIT
	
SHOW_ERROR_MSG:
	MOV AH,09H
	LEA DX,IVMG
	INT 21H
JMP TOPMENU





;=================================================================(Menu End)=========================================
	

;=================================================================(Product List Start: Caes 1)======================


CASE1:
	MOV SI,0
COME_HERE:

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
MOV DI,0

;---COLOR---
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,01		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0

;----Output Product Details---
MOV AH,09H
LEA DX,MSG_DESIGN_PD
INT 21H

;----Let user input---
USER_INPUT_AGIAN:
LEA DX,MSG_BUY
INT 21H

MOV AH,01H
INT 21H

MOV AH,09H
LEA DX,NEWLINE_PD
INT 21H

MOV USER_INPUT,AL		;Store user input

;----Start Compare---
PRODUCT1:
CMP AL,'1'
JNE PRODUCT2
MOV AH,09H
LEA DX,MSG_PD1
INT 21H
;---Ask user sure or not---
JMP ARE_YOU_SURE


PRODUCT2:
CMP AL,'2'
JNE PRODUCT3
MOV AH,09H
LEA DX,MSG_PD2
INT 21H
JMP ARE_YOU_SURE


PRODUCT3:
CMP AL,'3'
JNE PRODUCT4
MOV AH,09H
LEA DX,MSG_PD3
INT 21H
JMP ARE_YOU_SURE


PRODUCT4:
CMP AL,'4'
JNE PRODUCT5
MOV AH,09H
LEA DX,MSG_PD4
INT 21H
JMP ARE_YOU_SURE

PRODUCT5:
CMP AL,'5'
JNE PRODUCT6
MOV AH,09H
LEA DX,MSG_PD5
INT 21H
JMP ARE_YOU_SURE

PRODUCT6:
CMP AL,'6'
JNE PRODUCT7
MOV AH,09H
LEA DX,MSG_PD6
INT 21H
JMP ARE_YOU_SURE

PRODUCT7:
CMP AL,'7'
JNE PRODUCT8
MOV AH,09H
LEA DX,MSG_PD7
INT 21H
JMP ARE_YOU_SURE

PRODUCT8:
CMP AL,'8'
JNE GO_OUT
MOV AH,09H
LEA DX,MSG_PD8
INT 21H
JMP ARE_YOU_SURE

GO_OUT:
CMP AL,'X'
JNE USER_ERROE_INPUT
JMP TOPMENU            ;CHANEG TO TOPMENU

;---Here is Error Message---
USER_ERROE_INPUT:
MOV AH,09H
LEA DX,MSG_ERROE_INPUT
INT 21H
JMP USER_INPUT_AGIAN


;---Output Confirm message,and let user input Y / N---
ARE_YOU_SURE:
MOV AH,09H
LEA DX,NEWLINE_PD
INT 21H
LEA DX,MSG_CONFIRM
INT 21H

MOV AH,01H
INT 21H

;---Start Comapre Y / N---
CMP AL,'Y'
JE CALCULATE_TOTAL_HERE
JMP COME_HERE


;---if YES, START calculate total---
CALCULATE_TOTAL_HERE:
MOV AL,USER_INPUT
MOV OUTPUT_RECEIPT[SI],AL

INC SI

CMP USER_INPUT,'1'
JNE CAL_PD2
ADD TOTAL_USER_BUY,159

;---After Calculate,ask agian user---
JMP SUCCESSFUL_BUYING


CAL_PD2:
CMP USER_INPUT,'2'
JNE CAL_PD3
ADD TOTAL_USER_BUY,122

JMP SUCCESSFUL_BUYING


CAL_PD3:
CMP USER_INPUT,'3'
JNE CAL_PD4
ADD TOTAL_USER_BUY,231

JMP SUCCESSFUL_BUYING


CAL_PD4:
CMP USER_INPUT,'4'
JNE CAL_PD5
ADD TOTAL_USER_BUY,149

JMP SUCCESSFUL_BUYING


CAL_PD5:
CMP USER_INPUT,'5'
JNE CAL_PD6
ADD TOTAL_USER_BUY,129

JMP SUCCESSFUL_BUYING

CAL_PD6:
CMP USER_INPUT,'6'
JNE CAL_PD7
ADD TOTAL_USER_BUY,119

JMP SUCCESSFUL_BUYING

CAL_PD7:
CMP USER_INPUT,'7'
JNE CAL_PD8
ADD TOTAL_USER_BUY,29

JMP SUCCESSFUL_BUYING

CAL_PD8:
CMP USER_INPUT,'8'
ADD TOTAL_USER_BUY,55

JMP SUCCESSFUL_BUYING


;---Ask user buy again---
SUCCESSFUL_BUYING:
MOV AH,09H
LEA DX,NEWLINE_PD
INT 21H
LEA DX,MSG_SUCCESS_BUY
INT 21H

MOV AH,09H
LEA DX,MSG_ASK_AGAIN
INT 21H

MOV AH,01H
INT 21H

CMP AL,'Y'
JNE CHECK_HERE_ABC
JMP COME_HERE

CHECK_HERE_ABC:
JMP TOPMENU

;=================================================================(Product List End: Caes 1)======================





;=================================================================(Modify Chart Start: Caes 2)======================
CASE2:
	MOV AH,09H
	LEA DX,MSG2
	INT 21H
	
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
MOV DI,0
MOV SI,0

;COLOR
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
;++++++++++++++++++++++++++++++
;----HERE IS RECEIPT---
START_CALCULATE_MD:

MOV AH,09H
LEA DX,NEWLINE_PD
INT 21H
;---OUTPUT TITLE------------------------------------
MOV AH,09H
LEA DX,MSG_MD_DESIGN_1
INT 21H


MOV SI,0
MOV CX,30

OUTPUT_DETAILS_MD:

CMP OUTPUT_RECEIPT[SI],'1'
JNE OUTPUT2_MD
MOV AH,09H
LEA DX,MSG_PD1
INT 21H
JMP JUMP_HERE_MD

OUTPUT2_MD:
CMP OUTPUT_RECEIPT[SI],'2'
JNE OUTPUT3_MD
MOV AH,09H
LEA DX,MSG_PD2
INT 21H
JMP JUMP_HERE_MD

OUTPUT3_MD:
CMP OUTPUT_RECEIPT[SI],'3'
JNE OUTPUT4_MD
MOV AH,09H
LEA DX,MSG_PD3
INT 21H
JMP JUMP_HERE_MD

OUTPUT4_MD:
CMP OUTPUT_RECEIPT[SI],'4'
JNE OUTPUT5_MD
MOV AH,09H
LEA DX,MSG_PD4
INT 21H
JMP JUMP_HERE_MD

OUTPUT5_MD:
CMP OUTPUT_RECEIPT[SI],'5'
JNE JUMP_HERE_MD
MOV AH,09H
LEA DX,MSG_PD5
INT 21H
JMP JUMP_HERE_MD

JUMP_HERE_MD:
INC SI
LOOP OUTPUT_DETAILS_MD


;----------------------------
MOV SI,0
MOV CX,30
OUTPUT_DETAILS2_MD:

OUTPUT6_MD:
CMP OUTPUT_RECEIPT[SI],'6'
JNE OUTPUT7_MD
MOV AH,09H
LEA DX,MSG_PD6
INT 21H
JMP JUMP_HERE_NEW_MD

OUTPUT7_MD:
CMP OUTPUT_RECEIPT[SI],'7'
JNE OUTPUT8_MD
MOV AH,09H
LEA DX,MSG_PD7
INT 21H
JMP JUMP_HERE_NEW_MD

OUTPUT8_MD:
CMP OUTPUT_RECEIPT[SI],'8'
JNE JUMP_HERE_NEW_MD
MOV AH,09H
LEA DX,MSG_PD8
INT 21H

JMP JUMP_HERE_NEW_MD

JUMP_HERE_NEW_MD:
INC SI
LOOP OUTPUT_DETAILS2_MD

BYE_BYE_1:

CMP TOTAL_USER_BUY,1000
JL CALCULATE_3_TIMES_MD
JMP CALCULATE_4_TIMES_MD
;---Here is 3 digit calculate---
CALCULATE_3_TIMES_MD:

	MOV AX,TOTAL_USER_BUY
	MOV BL,10
	DIV BL

	MOV TOTAL_USER_NUMBER_MD[2],AH

	MOV AH,0
	DIV BL

	MOV TOTAL_USER_NUMBER_MD[1],AH
	MOV TOTAL_USER_NUMBER_MD[0],AL


	ADD TOTAL_USER_NUMBER_MD[2],30H
	ADD TOTAL_USER_NUMBER_MD[1],30H
	ADD TOTAL_USER_NUMBER_MD[0],30H

	MOV AH,09H
	LEA DX,MSG_LINE
	INT 21H

	MOV AH,09H
	LEA DX,MSG_TT
	INT 21H

	MOV AH,02H
	MOV DL,TOTAL_USER_NUMBER_MD[0]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_MD[1]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_MD[2]
	INT 21H

	MOV AH,09H
	LEA DX,MSG_RECEIPT_DESIGN_8
	INT 21H
	LEA DX,MSG_DESIGN_PD4
	INT 21H
	
	JMP ASK_USER_GO_WHERE_MD

;---Here is 4 digit calculate---
CALCULATE_4_TIMES_MD:
	MOV AX,TOTAL_USER_BUY
	MOV BL,10
	DIV BL
	
	MOV TOTAL_USER_NUMBER_4[3],AH
	
	MOV AH,0
	DIV BL
	
	MOV TOTAL_USER_NUMBER_4[2],AH
	
	MOV AH,0
	DIV BL
	
	MOV TOTAL_USER_NUMBER_4[1],AH
	MOV TOTAL_USER_NUMBER_4[0],AL
	
	ADD TOTAL_USER_NUMBER_4[3],30H
	ADD TOTAL_USER_NUMBER_4[2],30H
	ADD TOTAL_USER_NUMBER_4[1],30H
	ADD TOTAL_USER_NUMBER_4[0],30H
	
	MOV AH,09H
	LEA DX,MSG_LINE
	INT 21H

	MOV AH,09H
	LEA DX,MSG_TT
	INT 21H
	
	MOV AH,02H
	MOV DL,TOTAL_USER_NUMBER_4[0]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_4[1]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_4[2]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_4[3]
	INT 21H
	
	MOV AH,09H
	LEA DX,MSG_RECEIPT_DESIGN_9
	INT 21H
	LEA DX,MSG_DESIGN_PD4
	INT 21H
	
	JMP ASK_USER_GO_WHERE_MD
	
ASK_USER_GO_WHERE_MD:

INPUT_1:
		;------print promp msg------
    mov ah,9
	lea dx,NEWLINE
	int 21h
    lea dx,promptMsg
    int 21h
    
    mov ah,1
    int 21h
    
    mov ah,9
    lea dx,newline
    int 21h
    
    ;----------comparison logic-------
upper_y:
    cmp al,"Y"
		JNE lower_y
		JMP delete          
    
lower_y:
    cmp al,"y"
		JNE upper_n
    JMP delete
    
upper_n:
    cmp al,"N"
		JNE lower_n
		JMP JUMP_HERE_MENU
    
lower_n:
    cmp al,"n"
		JNE errorkey   
		JMP JUMP_HERE_MENU
    
errorkey:
	MOV AH,9
    LEA DX,errorMsg_1
    INT 21H
    
    LEA DX,NEWLINE
    INT 21H
    JMP INPUT_1
	
delete:
mov ah,9
lea dx,newLine
int 21h

mov ah,9
lea dx,deletemsg
int 21h

JUMP_HERE_MENU:

JMP TOPMENU
;=================================================================(Modify Chart Start: Caes 2)======================






;=================================================================(Check Out Order Start: Caes 3)======================

CASE3:

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
MOV DI,0
MOV SI,0

;COLOR
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0

MOV AH,09H
LEA DX,MSG_CK_DESIGN_1
INT 21H

;----HERE IS RECEIPT---
START_CALCULATE_CK:

MOV AH,09H
LEA DX,NEWLINE_PD
INT 21H
;---OUTPUT TITLE------------------------------------

MOV SI,0
MOV CX,30

OUTPUT_DETAILS_CK:

CMP OUTPUT_RECEIPT[SI],'1'
JNE OUTPUT2_CK
MOV AH,09H
LEA DX,MSG_PD1
INT 21H
JMP JUMP_HERE_CK

OUTPUT2_CK:
CMP OUTPUT_RECEIPT[SI],'2'
JNE OUTPUT3_CK
MOV AH,09H
LEA DX,MSG_PD2
INT 21H
JMP JUMP_HERE_CK

OUTPUT3_CK:
CMP OUTPUT_RECEIPT[SI],'3'
JNE OUTPUT4_CK
MOV AH,09H
LEA DX,MSG_PD3
INT 21H
JMP JUMP_HERE_CK

OUTPUT4_CK:
CMP OUTPUT_RECEIPT[SI],'4'
JNE OUTPUT5_CK
MOV AH,09H
LEA DX,MSG_PD4
INT 21H
JMP JUMP_HERE_CK

OUTPUT5_CK:
CMP OUTPUT_RECEIPT[SI],'5'
JNE JUMP_HERE_CK
MOV AH,09H
LEA DX,MSG_PD5
INT 21H
JMP JUMP_HERE_CK

JUMP_HERE_CK:
INC SI
LOOP OUTPUT_DETAILS_CK


;----------------------------
MOV SI,0
MOV CX,30
OUTPUT_DETAILS2_CK:

OUTPUT6_CK:
CMP OUTPUT_RECEIPT[SI],'6'
JNE OUTPUT7_CK
MOV AH,09H
LEA DX,MSG_PD6
INT 21H
JMP JUMP_HERE_NEW_CK

OUTPUT7_CK:
CMP OUTPUT_RECEIPT[SI],'7'
JNE OUTPUT8_CK
MOV AH,09H
LEA DX,MSG_PD7
INT 21H
JMP JUMP_HERE_NEW_CK

OUTPUT8_CK:
CMP OUTPUT_RECEIPT[SI],'8'
JNE JUMP_HERE_NEW_CK
MOV AH,09H
LEA DX,MSG_PD8
INT 21H

JMP JUMP_HERE_NEW_CK

JUMP_HERE_NEW_CK:
INC SI
LOOP OUTPUT_DETAILS2_CK



CMP TOTAL_USER_BUY,1000
JL CALCULATE_3_TIMES_CK
JMP CALCULATE_4_TIMES_CK
;---Here is 3 digit calculate---
CALCULATE_3_TIMES_CK:

	MOV AX,TOTAL_USER_BUY
	MOV BL,10
	DIV BL

	MOV TOTAL_USER_NUMBER_CK[2],AH

	MOV AH,0
	DIV BL

	MOV TOTAL_USER_NUMBER_CK[1],AH
	MOV TOTAL_USER_NUMBER_CK[0],AL


	ADD TOTAL_USER_NUMBER_CK[2],30H
	ADD TOTAL_USER_NUMBER_CK[1],30H
	ADD TOTAL_USER_NUMBER_CK[0],30H

	MOV AH,09H
	LEA DX,MSG_LINE
	INT 21H

	MOV AH,09H
	LEA DX,MSG_CK_DESIGN11
	INT 21H
	LEA DX,MSG_TT_CK
	INT 21H

	MOV AH,02H
	MOV DL,TOTAL_USER_NUMBER_CK[0]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_CK[1]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_CK[2]
	INT 21H

	MOV AH,09H
	LEA DX,MSG_CK_DESIGN33
	INT 21H
	LEA DX,MSG_CK_DESIGN22
	INT 21H
	
	JMP ASK_USER_GO_WHERE_CK

;---Here is 4 digit calculate---
CALCULATE_4_TIMES_CK:
	MOV AX,TOTAL_USER_BUY
	MOV BL,10
	DIV BL
	
	MOV TOTAL_USER_NUMBER_CK_4[3],AH
	
	MOV AH,0
	DIV BL
	
	MOV TOTAL_USER_NUMBER_CK_4[2],AH
	
	MOV AH,0
	DIV BL
	
	MOV TOTAL_USER_NUMBER_CK_4[1],AH
	MOV TOTAL_USER_NUMBER_CK_4[0],AL
	
	ADD TOTAL_USER_NUMBER_CK_4[3],30H
	ADD TOTAL_USER_NUMBER_CK_4[2],30H
	ADD TOTAL_USER_NUMBER_CK_4[1],30H
	ADD TOTAL_USER_NUMBER_CK_4[0],30H
	
	MOV AH,09H
	LEA DX,MSG_LINE
	INT 21H

	MOV AH,09H
	LEA DX,MSG_CK_DESIGN11
	INT 21H
	LEA DX,MSG_TT_CK
	INT 21H
	
	MOV AH,02H
	MOV DL,TOTAL_USER_NUMBER_CK_4[0]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_CK_4[1]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_CK_4[2]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_CK_4[3]
	INT 21H
	
	MOV AH,09H
	LEA DX,MSG_CK_DESIGN44
	INT 21H
	LEA DX,MSG_CK_DESIGN22
	INT 21H
	
	JMP ASK_USER_GO_WHERE_CK


ASK_USER_GO_WHERE_CK:
	INPUT1:
	LEA DX,NEWLINE
	INT 21H
	LEA DX,DATA9
	INT 21H

	;INPUT BYTE
	MOV AH,1
	INT 21H

    mov ah,9
    lea dx,NEWLINE1
    int 21h

CHECK_UPPER_Y1:
    cmp al,"Y"
	JNE CHECK_SMALL_Y1
	;JMP BACK TO EDIT CART
    
CHECK_SMALL_Y1:
    cmp al,"y"
	JNE CHECK_UPPER_N1
	;JMP BACK TO EDIT CART
    
CHECK_UPPER_N1:
    cmp al,"N"
		JNE CHECK_SMALL_N1
		JMP ASK_USER1
    
CHECK_SMALL_N1:
    cmp al,"n"
		JNE PRINT_ERROR_MSG1   
		JMP ASK_USER1
		
PRINT_ERROR_MSG1:
	MOV AH,9
    LEA DX,errorMsg
    INT 21H
    
    LEA DX,NEWLINE1
    INT 21H
    JMP INPUT1
	
ASK_USER1:
	MOV AH,9
	LEA DX,NEWLINE1
    INT 21H
	
	LEA DX,DATA10
	INT 21H

	LEA DX,DATA11
	INT 21H
	
	LEA DX,DATA12
	INT 21H

	;INPUT BYTE
	MOV AH,01H
	INT 21H

	CMP AL,"1"
	JE CHECK_POINT_CASE4
	JMP TOPMENU

CHECK_POINT_CASE4:
	JMP CASE4
	
	
;=================================================================(Check Out Order End: Caes 3)======================
	
	
	
	
	
	
;=================================================================(Payment Start: Caes 4)============================

;-------Check User Have Or Not Discount Code---------------

CASE4:

CMP TOTAL_USER_BUY,0


JNE START_TO_DO
JMP TOPMENU

START_TO_DO:
MOV AX,TOTAL_USER_BUY
MOV PY_TotalBefore,AX

MOV AH,'Y'
MOV DIS_WRONG,AH

;-----Clear Screen-----
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
MOV DI,0
MOV SI,0

;COLOR
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0

;----TITLE COLOR-----
MOV AX,0600H
MOV BH,7EH		;background = grey, font = yellow
MOV CX,0612H
MOV DX,0638H
INT 10H

;----Title Output-----
	MOV AH,09H
	LEA DX,MSG_DESIGN1
	INT 21H

;----Y/N discount code-----
TryAgain:
	MOV AH,09H
	LEA DX,MSG_PY
	INT 21H
	
	MOV AH,01H
	INT 21H

;----Validation Y/N---------'Y' go to discount page, 'N' go to no discount page, 'Other' go to try agian, 'X' go to Menu Page
CMP AL,"X"
JNE CHECK_UPPER_Y_RECEIPT1
JMP TOPMENU
	
CHECK_UPPER_Y_RECEIPT1:
	CMP AL,"Y"
	JNE CHECK_SMALL_Y_RECEIPT1
	JMP YES_PY
    
CHECK_SMALL_Y_RECEIPT1:
    CMP AL,"y"
	JNE CHECK_UPPER_N_RECEIPT1
    JMP YES_PY
    
CHECK_UPPER_N_RECEIPT1:
    CMP AL,"N"
	JNE CHECK_SMALL_N_RECEIPT1
	JMP NO_PY
    
CHECK_SMALL_N_RECEIPT1:
    CMP AL,"n"
	JNE TryAgain
	JMP NO_PY
	
;----if no code, go to no discount page---------
INVALID_CODE:						;if got one word wrong, then unsuccessful
	MOV AH,09H
	LEA DX,MSG_PY_UNSUC
	INT 21H
	
	MOV AH,'N'
	MOV DIS_WRONG,AH
	JMP NO_PY

;=====================Got Discount==============================
;=====================Got Discount==============================

YES_PY:	

;----Input Code---------Max is input 3 times
MOV DI,0
AGAIN_CODE:
INC DI
CMP DI,4
JNE CONTINUE_RUN
JMP INVALID_CODE

;----Output Message---------
CONTINUE_RUN:
	MOV AH,09H
	LEA DX,MSG_PY_NEWLINE
    INT 21H 
	LEA DX,MSG_PY_YES   			;output 'Please Enter your Discount Code :'
	INT 21H


;----Start Input---------
MOV CX,5
MOV SI,0
GETCODE:
	MOV AH,01H           			;Get and Check user code is correct or not
	INT 21H				 			;1 word 1 word get and put into U_CODE
	MOV U_CODE[SI],AL 
	INC SI
LOOP GETCODE

;----Start Checking---------3 time input wrong go to no discount page, if correct continue
MOV SI,0
CHECKCODE:
	
	CMP SI,5
	JE DONE_CODE                    ;will scan 5 word,then finish
	MOV BL,DIS_CODE[SI]
	CMP BL,U_CODE[SI]               ;start compare
	JE NEXT_CODE					;if equal, scan next word. go to NEXT_CODE
	JMP AGAIN_CODE					;if no equal, invalid code. go to INVALID_CODE
	
NEXT_CODE:							;go to next word
	INC SI
	JMP CHECKCODE

;---------------Before Discount Total----(Previous Payment)---------------------

;----Check got how many digit---------
DONE_CODE:

CMP PY_TotalBefore,1000
JGE OUTPUT_4_TIME
JMP OUTPUT_3_TIME

;-----if 4 digit, come here------
OUTPUT_4_TIME:
	MOV AX,PY_TotalBefore								;Get Total(Before Disocunt)
	MOV BL,10											;Change 3 number to character
	DIV BL												;Output 3 character
	MOV QUOTIENT_BEFORE_DISC[3],AH
	
	MOV AH,0
	MOV BL,10
	DIV BL
	MOV QUOTIENT_BEFORE_DISC[2],AH
	
	MOV AH,0
	DIV BL
	MOV QUOTIENT_BEFORE_DISC[1],AH
	MOV QUOTIENT_BEFORE_DISC[0],AL
	
	MOV AH,09H
	LEA DX,MSG_PY_BeforeTotal							;Output 'Previous Payment  : RM'
	INT 21H

;----Start Output----
	MOV CX,4
	MOV SI,0
PY_OUTPUT_TOTAL1:
	MOV AH,02H
	MOV DL,QUOTIENT_BEFORE_DISC[SI]						;Output Total Amount
	ADD DL,30H
	INT 21H
	INC SI
LOOP PY_OUTPUT_TOTAL1

;----Output Discount Message------and go to calculate discount
    MOV AH,09H
	LEA DX,MSG_PY_DISCOUNT
	INT 21H

JMP GET_DISCOUNT_QUOTIENT

;-----if 3 digit, come here------
OUTPUT_3_TIME:											;if all word is true, then successful
	MOV AX,PY_TotalBefore								;Get Total(Before Disocunt)
	MOV BL,10											;Change 3 number to character
	DIV BL												;Output 3 character
	MOV QUOTIENT_BEFORE_DISC[2],AH
	
	MOV AH,0
	DIV BL
	MOV QUOTIENT_BEFORE_DISC[1],AH
	MOV QUOTIENT_BEFORE_DISC[0],AL
	
	MOV AH,09H
	LEA DX,MSG_PY_BeforeTotal							;Output 'Previous Payment  : RM'
	INT 21H

;----Start Output----
	MOV CX,3
	MOV SI,0
PY_OUTPUT_TOTAL:
	MOV AH,02H
	MOV DL,QUOTIENT_BEFORE_DISC[SI]						;Output Total Amount
	ADD DL,30H
	INT 21H
	INC SI
LOOP PY_OUTPUT_TOTAL

;----Output Discount Message------and go to calculate discount
    MOV AH,09H
	LEA DX,MSG_PY_DISCOUNT
	INT 21H
	
JMP GET_DISCOUNT_QUOTIENT
;-------------------------------------------------------------------


	
;-------------Get Discount Quotient Number------(Discount)-----------
GET_DISCOUNT_QUOTIENT:
	MOV AX,PY_TotalBefore
	MOV BL,PY_DISCOUNT						; BL除完后，会自动存入AX        AH-> 1 REMAINDER    AL-> 0 QUOTIENT
	DIV BL          						; 1(al) / 4(bl) = ax(0100)  ah=remainder        al=quotient 

	MOV QUOTIENT_DISCOUNT[0],AL
	MOV TOTAL_DISCOUNT,AL
	MOV GET_REMAINDER_DISCOUNT,AH
	
;--------------------------------------------------------------------



;----------Get Discount Remainder Number------(Discount)-------------
	MOV SI,0
	MOV CX,3
	MOV AH,GET_REMAINDER_DISCOUNT
	
PY_CAL_DISCOUNT:
	MOV AL,AH
	MOV BL,10
	MUL BL      					;1(al) * 10(bl) = ax(0010) 
	
	MOV BL,PY_DISCOUNT
	DIV BL      					;10(al) / 4(bl) = ax(0202)   ah=remainder  al=quotient
	
	MOV REMAINDER_AT_DC[SI],AL
	ADD AL,30H             			;Change to character
	MOV REMAINDER_DISCOUNT[SI],AL
	INC SI

LOOP PY_CAL_DISCOUNT
	
;--------------------------------------------------------------------
	



;------------Check Quotient Decimal------(Discount)------------------
	MOV AX,0
	MOV AL,TOTAL_DISCOUNT
	CMP AL,9
	JG PY_TWO_DEC
	JMP PY_ONE_DEC
	
;---if 1 digit, come here----
PY_ONE_DEC:	
	
	MOV AH,02H
	ADD QUOTIENT_DISCOUNT[0],30H
	MOV DL,QUOTIENT_DISCOUNT[0]     	;Output 1 Decimal
	INT 21H
	
	MOV DL,46           				;Output .
	INT 21H
	
	MOV AH,09H
	LEA DX,REMAINDER_DISCOUNT   		;Output 3 Decimal Point
    INT 21H
	JMP AfterDiscount

;---if 2 digit, come here----
PY_TWO_DEC:								;50 / 4 =12.5
	CMP AL,99
	JG PY_THREE_DEC
	
	MOV AX,0
	MOV AL,TOTAL_DISCOUNT             	;AL = 12
	MOV BL,10				    		;12(al) / 10(bl) = ax(02 01)   ah=remainder  al=quotient
	DIV BL
	
	ADD AX,3030H
	MOV QUOTIENT_DISCOUNT[0],AL			;1
	MOV QUOTIENT_DISCOUNT[1],AH			;2
	
	
	MOV AH,02H
	MOV DL,QUOTIENT_DISCOUNT[0]			;Output 12
	INT 21H
	MOV DL,QUOTIENT_DISCOUNT[1]
	INT 21H
	
	MOV DL,46           				;Output .
	INT 21H
	
	MOV AH,09H
	LEA DX,REMAINDER_DISCOUNT   		;Output 3 Decimal Point
    INT 21H
	JMP AfterDiscount

;---if 3 digit, come here----
PY_THREE_DEC:
	MOV AX,0
	MOV AL,TOTAL_DISCOUNT               ;AL = 127
	MOV BL,10				    		;127(al) / 10(bl) = ax(07 12)   ah=remainder  al=quotient
	DIV BL
	
	MOV QUOTIENT_DISCOUNT[2],AH			;AH = 7
	
    MOV AH,0                            ;AL = 12
	MOV BL,10                       	;12(al) / 10(bl) = ax(02 01)
	DIV BL
	
	MOV QUOTIENT_DISCOUNT[1],AH
	MOV QUOTIENT_DISCOUNT[0],AL
	
	ADD QUOTIENT_DISCOUNT[2],30H		;1
	ADD QUOTIENT_DISCOUNT[1],30H		;2
	ADD QUOTIENT_DISCOUNT[0],30H		;7
	
	MOV AH,02H
	MOV DL,QUOTIENT_DISCOUNT[0]			;Output 127
	INT 21H
	MOV DL,QUOTIENT_DISCOUNT[1]
	INT 21H
	MOV DL,QUOTIENT_DISCOUNT[2]
	INT 21H
	
	
	MOV DL,46           				;Output .
	INT 21H
	
	MOV AH,09H
	LEA DX,REMAINDER_DISCOUNT   		;Output 3 Decimal Point
    INT 21H
	
	JMP AfterDiscount
	
;---------------------------------------------------------------



;-------Calculate Total After Disocunt----(After Discount)------
;---Start Calcualte Quotient---
AfterDiscount:
	MOV AH,09H
	LEA DX,MSG_PY_LINE
	INT 21H
	LEA DX,MSG_PY_AfterTotal
	INT 21H

	MOV AX,PY_TotalBefore
	MOV BX,0
	MOV BL,TOTAL_DISCOUNT
	SUB AX,BX
	SUB AX,1
	MOV TOTAL_AT_DC,AX

;---Store Result---
	MOV BL,10
	DIV BL
	MOV QUOTIENT_AFTER_DISC[2],AH
	
	MOV AH,0
	DIV BL
	MOV QUOTIENT_AFTER_DISC[1],AH
	MOV QUOTIENT_AFTER_DISC[0],AL
	

;---Start Calcualte Remainder---
	MOV CX,3
	MOV SI,0
PY_CAL_TOTAL:

	MOV AL,REMAINDER_AT_DC[SI]
	MOV BL,9
	SUB BL,AL
	MOV REMAINDER_AT_DC[SI],BL
	MOV REMAINDER_AT_DC_DIGIT[SI],BL
	INC SI
	
LOOP PY_CAL_TOTAL

;---Store Result---
	MOV AL,REMAINDER_AT_DC[2]
	MOV BL,REMAINDER_AT_DC_DIGIT[2]
	ADD AL,1
	ADD BL,1
	MOV REMAINDER_AT_DC[2],AL
	MOV REMAINDER_AT_DC_DIGIT[2],BL
	

;------------------------------------------------------------



;-------Output After Discount Total---(After Discount)-------

;---Output Quotient 3 digit------
MOV CX,3
MOV SI,0
PY_OUTPUT_AFTER_TOTAL:

	MOV AH,02H
	MOV DL,QUOTIENT_AFTER_DISC[SI]
	ADD DL,30H
	INT 21H
	INC SI
	
LOOP PY_OUTPUT_AFTER_TOTAL

	MOV AH,02H					
	MOV DL,46           		;Output .
	INT 21H

;---Output Remainder 3 digit------
MOV CX,3
MOV SI,0
PY_OUTPUT_AFTER_POINT:

	MOV AH,02H
	MOV AL,REMAINDER_AT_DC[SI]
	ADD AL,30H
	MOV DL,AL   		;Output 3 Decimal Point
    INT 21H
	INC SI
	
LOOP PY_OUTPUT_AFTER_POINT

;-----------------------------------------------------------



;-----Get User Input Total Amount ---(Before Final Total)---

;---Output Message---
INPUT_AGAIN:
	MOV AH,09H
	LEA DX,MSG_PY_User
	INT 21H

;---Start Input, max is input 4 digit---
MOV CX,4
MOV SI,0
GetAmount_PY:
	MOV BL,"$"
	MOV FINAL_INPUT_USER[SI],BL
	MOV AH,01H          		;Loop 4 times, let user input 5 digit
	INT 21H				
	CMP AL,13					;if user press Enter, will stop, start change to digit
	JE CHECKING_3_TIME
	MOV FINAL_INPUT_USER[SI],AL
	INC SI
	
LOOP GetAmount_PY

;---------------------------------------------------------



;------Check got Invalid Input----(User Input)------------

;---If input 4 digit, then check 4 digit---only can number
CHECKING_4_TIME:
MOV CX,4
MOV SI,0
Check_Digit:
	CMP FINAL_INPUT_USER[SI],13
	JE ChangeDigit
	JMP COMPARE_0

COMPARE_0:
	CMP FINAL_INPUT_USER[SI],48
	JL INPUT_AGAIN
	JMP COMPARE_9
	
COMPARE_9:
	CMP FINAL_INPUT_USER[SI],57
	JG INPUT_AGAIN
	
INC SI
LOOP Check_Digit


;---If input 3 digit, then check 3 digit---only can number
CHECKING_3_TIME:
MOV CX,3
MOV SI,0
Check_Digit1:
	CMP FINAL_INPUT_USER[SI],13
	JE ChangeDigit
	JMP COMPARE_00

COMPARE_00:
	CMP FINAL_INPUT_USER[SI],48
	JL INPUT_AGAIN
	JMP COMPARE_99
	
COMPARE_99:
	CMP FINAL_INPUT_USER[SI],57
	JG INPUT_AGAIN
	
INC SI
LOOP Check_Digit1
;-------------------------------------------------------




;----Calculate Input-----(Before Final Total)-----------

;---Change all input to digit---
ChangeDigit:
MOV CX,4
MOV SI,0
MOV DI,0

StartCheck_PY:				
	MOV DL,FINAL_INPUT_USER[SI]
	CMP DL,'$'
	JE NotDigit
	JNE IsDigit

IsDigit:
	SUB DL,30H
	MOV FINAL_DIGIT_USER[SI],DL
	INC SI
	INC DI
	JMP NextCheck_PY

NotDigit:
	
NextCheck_PY:
LOOP StartCheck_PY
;-----------------------------------------------------



;----Calculate and output---(Before Final Total)------

;---Calculate 3 digit Remainder---
MOV CX,3
MOV SI,0
PY_CAL_REMAINDER:

	MOV AL,REMAINDER_AT_DC_DIGIT[SI]
	MOV BL,9
	SUB BL,AL
	MOV REMAINDER_AT_DC_DIGIT[SI],BL
	INC SI
	
LOOP PY_CAL_REMAINDER

	MOV AL,REMAINDER_AT_DC_DIGIT[2]
	ADD AL,1
	MOV REMAINDER_AT_DC_DIGIT[2],AL

;---Check got how many input---
  CMP DI,4
  JE FourDigit
  JMP ThreeDigit

;---Four Digit Calculate---
FourDigit:
	MOV AL,FINAL_DIGIT_USER[0]
	MOV INPUT_ONE,AL
	MOV AL,FINAL_DIGIT_USER[1]		;Put all into 'INPUT_???'
	MOV INPUT_TWO,AL
	MOV AL,FINAL_DIGIT_USER[2]
	MOV INPUT_THREE,AL
	MOV AL,FINAL_DIGIT_USER[3]
	MOV INPUT_FOUR,AL
 
;====1
MOV AX,0
	MOV AX,1000
	MOV BL,INPUT_ONE				;Start calculate 1,2,3,4 change to 1234
	MUL BX
	MOV INPUT_CAL_ONE,AX
;====2
   MOV AX,0 
	MOV AL,100
	MOV BL,INPUT_TWO
	MUL BL
	MOV INPUT_CAL_TWO,AX
;====3
MOV AX,0
	MOV AL,10
	MOV BL,INPUT_THREE
	MUL BL
	MOV INPUT_CAL_THREE,AX
;====4
MOV AX,0
	MOV AL,1 
	MOV BL,INPUT_FOUR
	MUL BL
	MOV INPUT_CAL_FOUR,AX
;====Combine
    MOV AX,INPUT_CAL_ONE
	ADD AX,INPUT_CAL_TWO
	ADD AX,INPUT_CAL_THREE
	ADD AX,INPUT_CAL_FOUR
	MOV TOTAL_USER_INPUT,AX			;After calculate put the total in to 'TOTAL_USER_INPUT'

;---Start Calculate the Final Fee to user---
JMP CalculateUserRemainder


;---Four Digit Output---
GetFourNumber:
	MOV AX,TOTAL_BACK_PY            ;AL = 0748
	MOV BL,10				    	;748(al) / 10(bl) = ax(08 74)   ah=remainder  al=quotient
	DIV BL
	MOV QUOTIENT_USER_FEE[3],AH		;QUOTIENT_USER_FEE[3] = 8

    MOV AH,0                        ;AL = 074
	MOV BL,10                       ;74(al) / 10(bl) = ax(04 07)
	DIV BL
	MOV QUOTIENT_USER_FEE[2],AH		;QUOTIENT_USER_FEE[2] = 4

	MOV AH,0                        ;AL = 07
	MOV BL,10                       ;07(al) / 10(bl) = ax(07 00)
	DIV BL
	MOV QUOTIENT_USER_FEE[1],AH		;QUOTIENT_USER_FEE[1] = 7
	MOV QUOTIENT_USER_FEE[0],AL		;QUOTIENT_USER_FEE[0] = 0
	
	ADD QUOTIENT_USER_FEE[3],30H
	ADD QUOTIENT_USER_FEE[2],30H
	ADD QUOTIENT_USER_FEE[1],30H
	ADD QUOTIENT_USER_FEE[0],30H
	
	MOV AX,0
	MOV BX,0
	MOV BL,02H
	INT 10H
	
	MOV AH,09H
	LEA DX,MSG_PY_LINE
	INT 21H

	MOV AH,09H
	LEA DX,MSG_PY_BACK
	INT 21H
	
MOV CX,4
MOV SI,0
	MOV AH,02H
OutputFinalDigit:
	MOV DL,QUOTIENT_USER_FEE[SI]	;Output 0728
	INT 21H
	INC SI
LOOP OutputFinalDigit

JMP Output3Decimal


;---Three Digit Calculate---
ThreeDigit:
CMP DI,3
JE ThreeDigit2
JMP TwoDigit

ThreeDigit2:
	MOV AL,FINAL_DIGIT_USER[0]
	MOV INPUT_ONE,AL

	MOV AL,FINAL_DIGIT_USER[1]			;Put all into 'INPUT_???'
	MOV INPUT_TWO,AL

	MOV AL,FINAL_DIGIT_USER[2]
	MOV INPUT_THREE,AL

;====1
MOV AX,0
	MOV AX,100
	MOV BL,INPUT_ONE					;Start calculate 1,2,3 change to 123
	MUL BX
	MOV INPUT_CAL_ONE,AX
;====2
   MOV AX,0 
	MOV AL,10
	MOV BL,INPUT_TWO
	MUL BL
	MOV INPUT_CAL_TWO,AX
;====3
MOV AX,0
	MOV AL,1
	MOV BL,INPUT_THREE
	MUL BL
	MOV INPUT_CAL_THREE,AX
;====Combine
    MOV AX,INPUT_CAL_ONE
	ADD AX,INPUT_CAL_TWO
	ADD AX,INPUT_CAL_THREE
	MOV TOTAL_USER_INPUT,AX				;After calculate put the total in to 'TOTAL_USER_INPUT'

;---Start Calculate the Final Fee to user---
	JMP CalculateUserRemainder

;---Three Digit Output---
GetThreeNumber:
CMP AX,100
JL GetTwoNumber

	MOV AX,TOTAL_BACK_PY            ;AL = 0748
	MOV BL,10				    	;748(al) / 10(bl) = ax(08 74)   ah=remainder  al=quotient
	DIV BL
	MOV QUOTIENT_USER_FEE[2],AH		;QUOTIENT_USER_FEE[3] = 8
	
    MOV AH,0                        ;AL = 074
	MOV BL,10                       ;74(al) / 10(bl) = ax(04 07)
	DIV BL
	MOV QUOTIENT_USER_FEE[1],AH		;QUOTIENT_USER_FEE[2] = 4
	MOV QUOTIENT_USER_FEE[0],AL
	
	ADD QUOTIENT_USER_FEE[2],30H
	ADD QUOTIENT_USER_FEE[1],30H
	ADD QUOTIENT_USER_FEE[0],30H
	
	MOV AH,09H
	LEA DX,MSG_PY_LINE
	INT 21H

	MOV AH,09H
	LEA DX,MSG_PY_BACK
	INT 21H
	
MOV CX,3
MOV SI,0
	MOV AH,02H
OutputFinalDigit2:
	MOV DL,QUOTIENT_USER_FEE[SI]	;Output 728
	INT 21H
	INC SI
LOOP OutputFinalDigit2

JMP Output3Decimal

;---Two Digit Calculate---

TwoDigit:
	MOV AL,FINAL_DIGIT_USER[0]
	MOV INPUT_ONE,AL

	MOV AL,FINAL_DIGIT_USER[1]			;Put all into 'INPUT_???'
	MOV INPUT_TWO,AL
	
;====1
MOV AX,0
	MOV AX,10
	MOV BL,INPUT_ONE					;Start calculate 1,2 change to 12
	MUL BX
	MOV INPUT_CAL_ONE,AX
;====2
  MOV AX,0 
	MOV AL,1
	MOV BL,INPUT_TWO
	MUL BL
	MOV INPUT_CAL_TWO,AX

;---Start Calculate the Final Fee to user---
JMP CalculateUserRemainder

;---Two Digit Output---
GetTwoNumber:
	MOV AX,TOTAL_BACK_PY            ;AL = 74
	MOV BL,10				    	;748(al) / 10(bl) = ax(08 74)   ah=remainder  al=quotient
	DIV BL
	MOV QUOTIENT_USER_FEE[1],AH		;QUOTIENT_USER_FEE[3] = 8
	MOV QUOTIENT_USER_FEE[0],AL
	
	ADD QUOTIENT_USER_FEE[1],30H
	ADD QUOTIENT_USER_FEE[0],30H
	
	MOV AH,09H
	LEA DX,MSG_PY_LINE
	INT 21H

	MOV AH,09H
	LEA DX,MSG_PY_BACK
	INT 21H
	
MOV CX,2
MOV SI,0

	MOV AH,02H
OutputFinalDigit3:
	MOV DL,QUOTIENT_USER_FEE[SI]	;Output 74
	INT 21H
	INC SI
LOOP OutputFinalDigit3

JMP Output3Decimal
	

;------------------------------------------------
CalculateUserRemainder:
	MOV AX,TOTAL_USER_INPUT
	SUB AX,1
	CMP AX,TOTAL_AT_DC
	JL INPUT_AGAIN_CP
	JMP START_DO

INPUT_AGAIN_CP:
	JMP INPUT_AGAIN

START_DO:
	MOV AX,TOTAL_USER_INPUT			;1234
	SUB AX,TOTAL_AT_DC				;1234-485-1
	SUB AX,1
	MOV TOTAL_BACK_PY,AX
	
	MOV AX,0
	MOV AX,TOTAL_BACK_PY
	CMP AX,1000
	JL HereIsCheckPoint
	JMP GetFourNumber
	
HereIsCheckPoint:
	JMP GetThreeNumber

;---Start Output 3 digit Remainder---
Output3Decimal:
	MOV AH,02H					
	MOV DL,46           		;Output .
	INT 21H

MOV CX,3
MOV SI,0
OutputRemainder:

	MOV AH,02H
	MOV AL,REMAINDER_AT_DC_DIGIT[SI]
	ADD AL,30H
	MOV DL,AL   		;Output 3 Decimal Point
    INT 21H
	INC SI
	
LOOP OutputRemainder
	
JMP GetReceipt
	

;====================No Discount========================
;====================No Discount========================
NO_PY:

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
MOV DI,0
MOV SI,0

;---Clear Screen---
MOV AX,0600H
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0

;---TITLE COLOR---
MOV AX,0600H
MOV BH,7EH		;background = grey, font = yellow
MOV CX,0612H
MOV DX,0638H
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0

	MOV AH,09H
	LEA DX,MSG_DESIGN1
	INT 21H
	
;---If input 3 time code all wrong, output error message---
	CMP DIS_WRONG,'Y'
	JE NO_PROB
	JNE GOT_PROB

;---Output Error Message---
GOT_PROB:
;COLOR
MOV AX,0600H
MOV BH,0CH		;background = grey, font = red
MOV CX,0B07H 
MOV DX,0B44H
INT 10H

	MOV AH,09H
	LEA DX,MSG_PY_UNSUC
	INT 21H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0


;---No Output Message---
NO_PROB:
	MOV AH,09H
	LEA DX,NEWLINE
	INT 21H
	LEA DX,MSG_PY_AfterTotal
	INT 21H
	
;---Check Total how many digit---
CMP PY_TotalBefore,1000
JGE OUTPUT_4_TIME1
JMP OUTPUT_3_TIME1

;---if 4 digit, come here---
;---Start Calculate---
OUTPUT_4_TIME1:
	MOV AX,PY_TotalBefore								;Get Total(Before Disocunt)
	MOV BL,10											;Change 3 number to character
	DIV BL												;Output 3 character
	MOV QUOTIENT_BEFORE_DISC[3],AH
	
	MOV AH,0
	MOV BL,10
	DIV BL
	MOV QUOTIENT_BEFORE_DISC[2],AH
	
	MOV AH,0
	DIV BL
	MOV QUOTIENT_BEFORE_DISC[1],AH
	MOV QUOTIENT_BEFORE_DISC[0],AL
	
;---Start Output---
	MOV CX,4
	MOV SI,0
PY_OUTPUT_TOTAL11:
	MOV AH,02H
	MOV DL,QUOTIENT_BEFORE_DISC[SI]						;Output Total Amount
	ADD DL,30H
	INT 21H
	INC SI
LOOP PY_OUTPUT_TOTAL11

JMP StartHere

;---if 3 digit, come here---
;---Start Calculate---
OUTPUT_3_TIME1:											;if all word is true, then successful
	MOV AX,PY_TotalBefore								;Get Total(Before Disocunt)
	MOV BL,10											;Change 3 number to character
	DIV BL												;Output 3 character
	MOV QUOTIENT_BEFORE_DISC[2],AH
	
	MOV AH,0
	DIV BL
	MOV QUOTIENT_BEFORE_DISC[1],AH
	MOV QUOTIENT_BEFORE_DISC[0],AL


;---Start Output---
MOV CX,3
MOV SI,0
PY_OUTPUT_TOTAL111:
	MOV AH,02H
	MOV DL,QUOTIENT_BEFORE_DISC[SI]						;Output Total Amount
	ADD DL,30H
	INT 21H
	INC SI
LOOP PY_OUTPUT_TOTAL111

JMP StartHere


;---Let user input---
StartHere:
	MOV AH,09H
	LEA DX,MSG_PY_User		;output message
	INT 21H

;---Input 4 digit---
MOV CX,4
MOV SI,0
GetAmount_PY1:
	MOV BL,'$'
	MOV FINAL_INPUT_USER[SI],BL
	MOV AH,01H          		;Loop 4 times, let user input 4 digit
	INT 21H				
	CMP AL,13					;if user press Enter, will stop, start change to digit
	JE CHECKING_3_TIME_NO_DC
	MOV FINAL_INPUT_USER[SI],AL
	INC SI
	
LOOP GetAmount_PY1


;---Check got how many digit---
CHECKING_4_TIME_NO_DC:
MOV CX,4
MOV SI,0
Check_Digit_NO_DC:
	CMP FINAL_INPUT_USER[SI],13
	JE ChangeDigit1
	JMP COMPARE_0_NO_DC

COMPARE_0_NO_DC:
	CMP FINAL_INPUT_USER[SI],48
	JL StartHere
	JMP COMPARE_9_NO_DC
	
COMPARE_9_NO_DC:
	CMP FINAL_INPUT_USER[SI],57
	JG StartHere
	
INC SI
LOOP Check_Digit_NO_DC

;======

CHECKING_3_TIME_NO_DC:
MOV CX,3
MOV SI,0
Check_Digit1_NO_DC:
	CMP FINAL_INPUT_USER[SI],13
	JE ChangeDigit1
	JMP COMPARE_00_NO_DC

COMPARE_00_NO_DC:
	CMP FINAL_INPUT_USER[SI],48
	JL StartHere
	JMP COMPARE_99_NO_DC
	
COMPARE_99_NO_DC:
	CMP FINAL_INPUT_USER[SI],57
	JG StartHere
	
INC SI
LOOP Check_Digit1_NO_DC



;---------Calculate Input-----(Before Final Total)---------

;---Change all input to digit---
ChangeDigit1:
MOV CX,4
MOV SI,0
MOV DI,0

StartCheck_PY1:				
	MOV DL,FINAL_INPUT_USER[SI]
	CMP DL,'$'
	JE NotDigit1
	JNE IsDigit1

IsDigit1:
	SUB DL,30H
	MOV FINAL_DIGIT_USER[SI],DL
	INC SI
	INC DI
	JMP NextCheck_PY1

NotDigit1:
	
NextCheck_PY1:
LOOP StartCheck_PY1
;---------------------------------------------------------



;------------------Calculate and output-------------------

  CMP DI,4						;Check got how many input
  JE FourDigit1
  JMP ThreeDigit1

;=============================Four Digit Calculate and Output
FourDigit1:
	MOV AL,FINAL_DIGIT_USER[0]
	MOV INPUT_ONE,AL

	MOV AL,FINAL_DIGIT_USER[1]			;Put all into 'INPUT_???'
	MOV INPUT_TWO,AL

	MOV AL,FINAL_DIGIT_USER[2]
	MOV INPUT_THREE,AL

	MOV AL,FINAL_DIGIT_USER[3]
	MOV INPUT_FOUR,AL
 
;====1
MOV AX,0
	MOV AX,1000
	MOV BL,INPUT_ONE					;Start calculate 1,2,3,4 change to 1234
	MUL BX
	MOV INPUT_CAL_ONE,AX
;====2
   MOV AX,0 
	MOV AL,100
	MOV BL,INPUT_TWO
	MUL BL
	MOV INPUT_CAL_TWO,AX
;====3
MOV AX,0
	MOV AL,10
	MOV BL,INPUT_THREE
	MUL BL
	MOV INPUT_CAL_THREE,AX
;====4
MOV AX,0
	MOV AL,1 
	MOV BL,INPUT_FOUR
	MUL BL
	MOV INPUT_CAL_FOUR,AX
;====Combine
    MOV AX,INPUT_CAL_ONE
	ADD AX,INPUT_CAL_TWO
	ADD AX,INPUT_CAL_THREE
	ADD AX,INPUT_CAL_FOUR
	MOV TOTAL_USER_INPUT,AX						;After calculate put the total in to 'TOTAL_USER_INPUT'

JMP CalculateUserRemainder1

;--------------------------------
	
GetFourNumber1:
	MOV AX,TOTAL_BACK_PY            ;AL = 0748
	MOV BL,10				    	;748(al) / 10(bl) = ax(08 74)   ah=remainder  al=quotient
	DIV BL
	MOV QUOTIENT_USER_FEE[3],AH		;QUOTIENT_USER_FEE[3] = 8

    MOV AH,0                        ;AL = 074
	MOV BL,10                       ;74(al) / 10(bl) = ax(04 07)
	DIV BL
	MOV QUOTIENT_USER_FEE[2],AH		;QUOTIENT_USER_FEE[2] = 4

	MOV AH,0                        ;AL = 07
	MOV BL,10                       ;07(al) / 10(bl) = ax(07 00)
	DIV BL
	MOV QUOTIENT_USER_FEE[1],AH		;QUOTIENT_USER_FEE[1] = 7
	MOV QUOTIENT_USER_FEE[0],AL		;QUOTIENT_USER_FEE[0] = 0
	
	ADD QUOTIENT_USER_FEE[3],30H
	ADD QUOTIENT_USER_FEE[2],30H
	ADD QUOTIENT_USER_FEE[1],30H
	ADD QUOTIENT_USER_FEE[0],30H
	
	MOV AH,09H
	LEA DX,MSG_PY_LINE
	INT 21H
	LEA DX,MSG_PY_BACK
	INT 21H
	
MOV CX,4
MOV SI,0
	MOV AH,02H
OutputFinalDigit1:
	MOV DL,QUOTIENT_USER_FEE[SI]	;Output 0728
	INT 21H
	INC SI
LOOP OutputFinalDigit1

JMP GetReceipt

ThreeDigit1:
CMP DI,3
JE ThreeDigit21
JMP TwoDigit1

ThreeDigit21:
	MOV AL,FINAL_DIGIT_USER[0]
	MOV INPUT_ONE,AL

	MOV AL,FINAL_DIGIT_USER[1]			;Put all into 'INPUT_???'
	MOV INPUT_TWO,AL

	MOV AL,FINAL_DIGIT_USER[2]
	MOV INPUT_THREE,AL

;====1
MOV AX,0
	MOV AX,100
	MOV BL,INPUT_ONE					;Start calculate 1,2,3,4 change to 1234
	MUL BX
	MOV INPUT_CAL_ONE,AX
;====2
   MOV AX,0 
	MOV AL,10
	MOV BL,INPUT_TWO
	MUL BL
	MOV INPUT_CAL_TWO,AX
;====3
MOV AX,0
	MOV AL,1
	MOV BL,INPUT_THREE
	MUL BL
	MOV INPUT_CAL_THREE,AX
;====Combine
    MOV AX,INPUT_CAL_ONE
	ADD AX,INPUT_CAL_TWO
	ADD AX,INPUT_CAL_THREE
	MOV TOTAL_USER_INPUT,AX						;After calculate put the total in to 'TOTAL_USER_INPUT'
	
	JMP CalculateUserRemainder1

GetThreeNumber1:
CMP AX,100
JL GetTwoNumber1

	MOV AX,TOTAL_BACK_PY            ;AL = 0748
	MOV BL,10				    	;748(al) / 10(bl) = ax(08 74)   ah=remainder  al=quotient
	DIV BL
	MOV QUOTIENT_USER_FEE[2],AH		;QUOTIENT_USER_FEE[3] = 8
	
    MOV AH,0                        ;AL = 074
	MOV BL,10                       ;74(al) / 10(bl) = ax(04 07)
	DIV BL
	MOV QUOTIENT_USER_FEE[1],AH		;QUOTIENT_USER_FEE[2] = 4
	MOV QUOTIENT_USER_FEE[0],AL
	
	ADD QUOTIENT_USER_FEE[2],30H
	ADD QUOTIENT_USER_FEE[1],30H
	ADD QUOTIENT_USER_FEE[0],30H
	
	MOV AH,09H
	LEA DX,MSG_PY_LINE
	INT 21H
	LEA DX,MSG_PY_BACK
	INT 21H
	
MOV CX,3
MOV SI,0
	MOV AH,02H
OutputFinalDigit21:
	MOV DL,QUOTIENT_USER_FEE[SI]	;Output 728
	INT 21H
	INC SI
LOOP OutputFinalDigit21

JMP GetReceipt

TwoDigit1:
	MOV AL,FINAL_DIGIT_USER[0]
	MOV INPUT_ONE,AL

	MOV AL,FINAL_DIGIT_USER[1]			;Put all into 'INPUT_???'
	MOV INPUT_TWO,AL
	
;====1
MOV AX,0
	MOV AX,10
	MOV BL,INPUT_ONE					;Start calculate 1,2 change to 12
	MUL BX
	MOV INPUT_CAL_ONE,AX
;====2
  MOV AX,0 
	MOV AL,1
	MOV BL,INPUT_TWO
	MUL BL
	MOV INPUT_CAL_TWO,AX

	JMP CalculateUserRemainder1

GetTwoNumber1:
	MOV AX,TOTAL_BACK_PY            ;AL = 74
	MOV BL,10				    	;748(al) / 10(bl) = ax(08 74)   ah=remainder  al=quotient
	DIV BL
	MOV QUOTIENT_USER_FEE[1],AH		;QUOTIENT_USER_FEE[3] = 8
	MOV QUOTIENT_USER_FEE[0],AL
	
	ADD QUOTIENT_USER_FEE[1],30H
	ADD QUOTIENT_USER_FEE[0],30H
	
	MOV AH,09H
	LEA DX,MSG_PY_LINE
	INT 21H
	LEA DX,MSG_PY_BACK
	INT 21H
	
MOV CX,2
MOV SI,0

	MOV AH,02H
OutputFinalDigit31:
	MOV DL,QUOTIENT_USER_FEE[SI]	;Output 74
	INT 21H
	INC SI
LOOP OutputFinalDigit31

JMP GetReceipt

;'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
CalculateUserRemainder1:
	MOV AX,TOTAL_USER_INPUT
	CMP AX,PY_TotalBefore
	JL INPUT_AGAIN_CP1
	JMP START_DO1

INPUT_AGAIN_CP1:
	JMP StartHere

START_DO1:
	MOV AX,TOTAL_USER_INPUT				;1234
	SUB AX,PY_TotalBefore				;1234-485-1
	MOV TOTAL_BACK_PY,AX
	
	MOV AX,0
	MOV AX,TOTAL_BACK_PY
	CMP AX,1000
	JL HereIsCheckPoint1
	JMP GetFourNumber1
	
HereIsCheckPoint1:
	JMP GetThreeNumber1
	

;----------------------------和上面的一模一样----------------------

;-----------------Need Receipt(Yes / No)-----------------------
GetReceipt:

MOV AH,09H
LEA DX,MSG_PY_NEWLINE
INT 21H

GetReceipt1:
MOV AH,09H
LEA DX,MSG_PY_Receipt
INT 21H

MOV AH,01H
INT 21H

MOV AH,09H
LEA DX,NEWLINE
INT 21H

CHECK_UPPER_Y_RECEIPT:
	CMP AL,"Y"
	JNE CHECK_SMALL_Y_RECEIPT
	JMP HereIsReceipt
    
CHECK_SMALL_Y_RECEIPT:
    CMP AL,"y"
	JNE CHECK_UPPER_N_RECEIPT
    JMP HereIsReceipt
    
CHECK_UPPER_N_RECEIPT:
    CMP AL,"N"
	JNE CHECK_SMALL_N_RECEIPT
	MOV TOTAL_USER_BUY,0
	
MOV CX,30
MOV DI,0
CLEAR_LOOP_3:
	MOV OUTPUT_RECEIPT[DI],'$'
	INC DI

LOOP CLEAR_LOOP_3
	JMP TOPMENU
    
CHECK_SMALL_N_RECEIPT:
    CMP AL,"n"
	JNE GetReceipt1
	MOV TOTAL_USER_BUY,0
	
MOV CX,30
MOV DI,0
CLEAR_LOOP_4:
	MOV OUTPUT_RECEIPT[DI],'$'
	INC DI

LOOP CLEAR_LOOP_4

	JMP TOPMENU
	
HereIsReceipt:

;=================================================================(Payment End)====================================



;=================================================================(Receipt Start)====================================

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
MOV DI,0
MOV SI,0

;COLOR
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
;++++++++++++++++++++++++++++++
;----HERE IS RECEIPT---
START_CALCULATE_PD:

MOV AH,09H
LEA DX,NEWLINE_PD
INT 21H
;---OUTPUT TITLE------------------------------------
MOV AH,09H
LEA DX,MSG_RECEIPT_DESIGN_1
INT 21H


MOV SI,0
MOV CX,30

OUTPUT_DETAILS:

CMP OUTPUT_RECEIPT[SI],'1'
JNE OUTPUT2_PD
MOV AH,09H
LEA DX,MSG_PD1
INT 21H
JMP JUMP_HERE

OUTPUT2_PD:
CMP OUTPUT_RECEIPT[SI],'2'
JNE OUTPUT3_PD
MOV AH,09H
LEA DX,MSG_PD2
INT 21H
JMP JUMP_HERE

OUTPUT3_PD:
CMP OUTPUT_RECEIPT[SI],'3'
JNE OUTPUT4_PD
MOV AH,09H
LEA DX,MSG_PD3
INT 21H
JMP JUMP_HERE

OUTPUT4_PD:
CMP OUTPUT_RECEIPT[SI],'4'
JNE OUTPUT5_PD
MOV AH,09H
LEA DX,MSG_PD4
INT 21H
JMP JUMP_HERE

OUTPUT5_PD:
CMP OUTPUT_RECEIPT[SI],'5'
JNE JUMP_HERE
MOV AH,09H
LEA DX,MSG_PD5
INT 21H
JMP JUMP_HERE

JUMP_HERE:
INC SI
LOOP OUTPUT_DETAILS


;----------------------------
MOV SI,0
MOV CX,30
OUTPUT_DETAILS2:

OUTPUT6_PD:
CMP OUTPUT_RECEIPT[SI],'6'
JNE OUTPUT7_PD
MOV AH,09H
LEA DX,MSG_PD6
INT 21H
JMP JUMP_HERE_NEW

OUTPUT7_PD:
CMP OUTPUT_RECEIPT[SI],'7'
JNE OUTPUT8_PD
MOV AH,09H
LEA DX,MSG_PD7
INT 21H
JMP JUMP_HERE_NEW

OUTPUT8_PD:
CMP OUTPUT_RECEIPT[SI],'8'
JNE JUMP_HERE_NEW
MOV AH,09H
LEA DX,MSG_PD8
INT 21H

JMP JUMP_HERE_NEW

JUMP_HERE_NEW:
INC SI
LOOP OUTPUT_DETAILS2

BYE_BYE:

CMP TOTAL_USER_BUY,1000
JL CALCULATE_3_TIMES_PD
JMP CALCULATE_4_TIMES_PD
;---Here is 3 digit calculate---
CALCULATE_3_TIMES_PD:

	MOV AX,TOTAL_USER_BUY
	MOV BL,10
	DIV BL

	MOV TOTAL_USER_NUMBER[2],AH

	MOV AH,0
	DIV BL

	MOV TOTAL_USER_NUMBER[1],AH
	MOV TOTAL_USER_NUMBER[0],AL


	ADD TOTAL_USER_NUMBER[2],30H
	ADD TOTAL_USER_NUMBER[1],30H
	ADD TOTAL_USER_NUMBER[0],30H

	MOV AH,09H
	LEA DX,MSG_LINE
	INT 21H

	MOV AH,09H
	LEA DX,MSG_TT
	INT 21H

	MOV AH,02H
	MOV DL,TOTAL_USER_NUMBER[0]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER[1]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER[2]
	INT 21H

	MOV AH,09H
	LEA DX,MSG_RECEIPT_DESIGN_8
	INT 21H
	LEA DX,MSG_DESIGN_PD4
	INT 21H
	
	JMP ASK_USER_GO_WHERE

;---Here is 4 digit calculate---
CALCULATE_4_TIMES_PD:
	MOV AX,TOTAL_USER_BUY
	MOV BL,10
	DIV BL
	
	MOV TOTAL_USER_NUMBER_4[3],AH
	
	MOV AH,0
	DIV BL
	
	MOV TOTAL_USER_NUMBER_4[2],AH
	
	MOV AH,0
	DIV BL
	
	MOV TOTAL_USER_NUMBER_4[1],AH
	MOV TOTAL_USER_NUMBER_4[0],AL
	
	ADD TOTAL_USER_NUMBER_4[3],30H
	ADD TOTAL_USER_NUMBER_4[2],30H
	ADD TOTAL_USER_NUMBER_4[1],30H
	ADD TOTAL_USER_NUMBER_4[0],30H
	
	MOV AH,09H
	LEA DX,MSG_LINE
	INT 21H

	MOV AH,09H
	LEA DX,MSG_TT
	INT 21H
	
	MOV AH,02H
	MOV DL,TOTAL_USER_NUMBER_4[0]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_4[1]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_4[2]
	INT 21H
	MOV DL,TOTAL_USER_NUMBER_4[3]
	INT 21H
	
	MOV AH,09H
	LEA DX,MSG_RECEIPT_DESIGN_9
	INT 21H
	LEA DX,MSG_DESIGN_PD4
	INT 21H
	
	JMP ASK_USER_GO_WHERE
	
ASK_USER_GO_WHERE:

MOV TOTAL_USER_BUY,0
MOV CX,30
MOV DI,0
CLEAR_LOOP_1:
	MOV OUTPUT_RECEIPT[DI],'$'
	INC DI

LOOP CLEAR_LOOP_1

;++++++++++++++++++++++++++++++

INPUT:
	LEA DX,NEWLINE
	INT 21H
	LEA DX,D10
	INT 21H

	;INPUT BYTE
	MOV AH,1
	INT 21H

    mov ah,9
    lea dx,NEWLINE
    int 21h
	
CHECK_UPPER_Y:
    cmp al,"Y"
	JNE CHECK_SMALL_Y
	JMP TOPMENU
    
CHECK_SMALL_Y:
    cmp al,"y"
	JNE CHECK_UPPER_N
	JMP TOPMENU
    
CHECK_UPPER_N:
    cmp al,"N"
	JNE CHECK_SMALL_N
	JMP EXIT
    
CHECK_SMALL_N:
    cmp al,"n"
	JNE PRINT_ERROR_MSG   
	JMP EXIT
		
PRINT_ERROR_MSG:
	MOV AH,9
    LEA DX,errorMsg
    INT 21H
    
    LEA DX,NEWLINE
    INT 21H
    JMP INPUT
;=================================================================(Receipt End)====================================
	
;=================================================================(Admin Page Start)====================================
ADMINMENU:

;COLOR
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0

    MOV AH,09H
	LEA DX,AMENU
	INT 21H
	
	;ASK USER TO INPUT SELECTION
    MOV AH,09H
    LEA DX,PROM1
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H

    
    CMP AL,1
    JNE TRYY1
    JMP EDITSTOCK

TRYY1:
    CMP AL,1
    JNE TRYY2
    JMP CASE2
    

TRYY2:  
	CMP AL,2
	JNE SHOW_ERROR_MSG1
    JMP EXIT

SHOW_ERROR_MSG1:
  MOV AH,09H
	LEA DX,IVMG
	INT 21H
  
JMP ADMINMENU
	
	
;=================================================Tan Chin Yung 'Code'================(Admin Page End)====================================



;=================================================Pang Zhi Xian 'Code'================(Edit Stock Start)====================================
EDITSTOCK:

menuxian:

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
MOV DI,0
MOV SI,0

;COLOR
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0


mov ah,9
lea dx,ttlxian
int 21h

mov si,offset array ;“Offset” is an assembler directive in x86 assembly language. It actually means “address” and is a way of handling the overloading of the “mov” instruction. 
mov dx,offset ms1
mov ah,9
int 21h

l1:
mov ah,1;input product name from user
int 21h
cmp al,13;until user press enter
je second1
mov [si],al
inc si
jmp l1

second1:
mov al,32
mov [si],al
inc si

mov dx,offset newLine
mov ah,9
int 21h

mov dx,offset ms2
mov ah,9
int 21h
jmp second

second:
mov ah,1 ;get product prices from user
int 21h
cmp al,13 ;until user press enter
je print
mov [si],al
inc si
jmp second
	print:
	
	mov dx,offset newLine
	mov ah,9
	int 21h
	
	mov ah,9
	lea dx,labletop
	int 21h
	
	mov dx,offset newLine
	mov ah,9
	int 21h
	
	mov ah,9
	lea dx,vars
	int 21h
	
	mov dx,offset newLine
	mov ah,9
	int 21h
	
	mov ah,9
	lea dx,labletop
	int 21h
	
	mov dx,offset newLine
	mov ah,9
	int 21h
	
	
	mov ah,9
	lea dx,space
	int 21h
	
	mov dx,offset array
	mov ah,9
	int 21h
	
	mov dx,offset newLine
	mov ah,9
	int 21h
	
	mov ah,9
	lea dx,labletop
	int 21h
	
	mov dx,offset newLine
	mov ah,9
	int 21h

INPUTxian:
		;------print promp msg------
    mov ah,9
    lea dx,prompt_Msg
    int 21h
    
    mov ah,1
    int 21h
    
    mov ah,9
    lea dx,newLine
    int 21h

up_y:
    cmp al,"Y"
		JNE up_n
		JMP menuxian   
		
up_n:
    cmp al,"N"
		JNE errormsgxian
		JMP ADMINMENU
		
errormsgxian:
	MOV AH,9
    LEA DX,errorMsg_1
    INT 21H
	
	mov dx,offset newLine
	mov ah,9
	int 21h
    JMP INPUTxian

;=================================================================(Edit Stock End)====================================
	
	
EXIT:
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0
MOV DI,0
MOV SI,0

;COLOR
MOV AX,0600H	;Clean screen
MOV BH,0FH		;MOV BH,04H  =  0 is background, 4 is font color.  0 = black , 4 = red
MOV CX,0000H	;coordinate x,y  .  Clear screen start at where 
MOV DX,184FH	;coordinate x,y  .  Clear screen end   at where 
INT 10H

MOV AX,0
MOV AH,02H
MOV BH,0
MOV DH,03		;coordinate x , Massege output screen start at which row
MOV DL,15
INT 10H

MOV AH,09H
LEA DX,MSG_ENDING1
INT 21H


	MOV AX, 4C00H
	INT 21H

MAIN ENDP

END MAIN