;;; Crude entry point for C code

	.cpu    816
	.altregsyn	1

	.global	_start
_start:
	;; Call the main routine
	;; Don't use the last bytes of the data memory,
	;; as they are used as FIFOs (e.g., for printf).
	move	%i2l,#0xf0
	move	%i2h,#0xff
	move	%i3l,#0xf0
	move	%i3h,#0xff
	calls	main
	;; Terminate
	halt
	jump	_start		; just in case...

;   void hw_putchar (char c) {	
;     DM[0xffff]=c;
;   }
	.global	hw_putchar
hw_putchar:
	move	-(%sp),%i0l
	move	-(%sp),%i0h
	move	%i0h,#0xff
	move	%i0l,#0xff
	move	(%i0),%r3
	move	%i0h,(%sp)+
	move	%i0l,(%sp)+
	jump	%ip

;;; Scratch area used by the compiler when the stack frame is bigger
;;; than 256 bytes.

	.global		__spill
	.section	.page0_bss
	.type		__spill,#object
	.size		__spill,8
__spill:
	.space		8
