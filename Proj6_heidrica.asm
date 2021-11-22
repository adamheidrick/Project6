TITLE Project 6     (Proj6_heidrica.asm)

; Author: Adam Heidrick
; Last Modified: 22 November 2021
; OSU email address: heidrica@oregonstate.edu
; Course number/section:   CS271 Section 400
; Project Number: 6                Due Date: 5 December 2021
; Description: This program uses low-level I/O procedures, string primatives, and implements macros to accomplish the following:
;              1. Uses modular procedures to reveive a user's input as a string 10 times and converts it into numeric form without ReadInt or ReadDec
;			   2. The user's input once converted is then calculates the sum and the rounded average. 
;			   3. The numbers entered, sum of numbers, and rounded average, is converted into charachters and printed wihout using WriteInt or WriteDec

INCLUDE Irvine32.inc
MAX = 200

mGetString MACRO user_prompt, user_input, MAX, byte_count
	push	edx
	push	ecx
	
	mov		edx, user_prompt
	call	WriteString
	
	mov edx,	user_input
	mov ecx,	MAX
	call		ReadString
	mov			byte_count, eax
	call		writeDec


	pop		ecx
	pop		edx
ENDM


; (insert constant definitions here)

.data
; This is for the Get String MACRO
user_prompt		byte		"Please enter a signed number: ",0		; prompt for user
user_input		byte		31 DUP(0)
byte_count		dword		?



.code
main PROC
push	offset user_prompt
push	offset user_input
push	MAX
push	byte_count
call ReadVal



	Invoke ExitProcess,0	; exit to operating system
main ENDP

ReadVal PROC
push		ebp
mov			ebp, esp
pushad

mGetString [ebp+20], [ebp+16], [ebp+12], [ebp+8]

popad
pop			ebp
ret			16	
ReadVal ENDP

WriteVal PROC



ret
WriteVal ENDP

END main