; GCC -*- asm -*- macros for CoolRISC 816
;========================================================================
;=  CSEM IC Design SA				Embedded controllers
;========================================================================
;=  Project	: CoolRisc 816, GNU GCC compiler
;=		Compiler functions Library
;=
;=  Last Modified : February 03, 1996 CAr
;========================================================================

	.nolist
	
	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Left (char)
	;
	; Version 5.0
	;
	; Function:	rega << regc
	; Result:	rega
	; Date:		04-02-1997
	;=========================================================
	.macro	lshlqi3	rega, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shl	\rega
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Left (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb << regc
	; Result:	rega:regb
	; Date:		04-02-1997
	;=========================================================
	.macro	lshlhi3	rega, regb, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shl	\regb
	shlc	\rega
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Left (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb << value (immediate)
	; Result:	rega:regb
	;
	;
	; Date:		03-02-1997
	;=========================================================
	.macro	lshlihi3	rega, regb, value

	.if	\value
	; value >= 1
	.if	(\value & 0xFFFE)
	; value > 1
	.if	(\value & 0xFFF8)
	; value > 7
	.if	(\value - 0x0008)
	; value > 8
	.if	(\value & 0xFFF0)
	; SHL 16+
	move	\rega,	#0x00
	move	\regb,	#0x00
	.else
	; SHL 9..15
	mshl	\regb,	#\value-8
	move	\rega,	%a
	move	\regb,	#0x00
	.endif
	.else
	; SHL 8
	move	\rega,	\regb
	move	\regb,	#0x00
	.endif
	.else
	; SHL 2..7
	mshl	\regb,	#\value
	move	-(%sp),	%a
	mshl	\rega,	#\value
	or	\rega,	\regb,	%a
	move	\regb,	(%sp)+
	.endif
	.else
	; SHL 1
	shl	\regb
	shlc	\rega
	.endif
	.else
	; SHL 0
	; do nothing
	.endif
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Left (long)
	;
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 << SP(+0)
	; Result:	r3:r2:r1:r0
	; Date:		03-02-1997
	;=========================================================
	.macro	lshlsi3	; r3, r2, r1, r0, SP(+0)	r3, r2, r1, r0

	move	-(%i3),	%i0h		; save i0h
	move	%i0h,	(%i3, 1)	; load n
	jzs	.L\@_end_it
.L\@_next_bit:
	shl	%r0
	shlc	%r1
	shlc	%r2
	shlc	%r3
	dec	%i0h
	jzc	.L\@_next_bit
.L\@_end_it:
	move	%i0h,	(%i3, 2)+	; restore i0h
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Left (long)
	;
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 << value (immediate)
	; Result:	r3:r2:r1:r0
	; Date:		03-02-1997
	;=========================================================
	.macro	lshlisi3	value	; r3, r2, r1, r0	r3, r2, r1, r0

	.if	\value
	; value >= 1
	.if	(\value & 0xFFFE)
	; value > 1
	.if	(\value & 0xFFF8)
	; value > 7
	.if	(\value - 0x0008)
	; value > 8
	.if	(\value & 0xFFF0)
	; value > 15
	.if	(\value - 0x0010)
	; value > 16
	.if	(\value & 0xFFE8)
	; value > 23
	.if	(\value - 0x0018)
	; value > 24
	.if	(\value & 0xFFE0)
	; SHL 32+
	move	%r0,	#0x00
	move	%r1,	#0x00
	move	%r2,	#0x00
	move	%r3,	#0x00
	.else
	; SHL 25..31
	mshl	%r0,	#\value-24
	move	%r3,	%a
	move	%r0,	#0x00
	move	%r1,	#0x00
	move	%r2,	#0x00
	.endif
	.else
	; SHL 24
	move	%r3,	%r0
	move	%r2,	#0x00
	move	%r1,	#0x00
	move	%r0,	#0x00
	.endif
	.else
	; SHL 17..23
	mshl	%r1,	#\value-16
	move	%r3,	%a
	mshl	%r0,	#\value-16
	move	%r2,	%a
	or	%r3,	%r0
	move	%r0,	#0x00
	move	%r1,	#0x00
	.endif
	.else
	; SHL 16
	move	%r3,	%r1
	move	%r2,	%r0
	move	%r1,	#0x00
	move	%r0,	#0x00
	.endif
	.else
	; SHL 9..15
	mshl	%r2,	#\value-8
	move	%r3,	%a
	mshl	%r1,	#\value-8
	move	%r2,	%a
	or	%r3,	%r1
	mshl	%r0,	#\value-8
	move	%r1,	%a
	or	%r2,	%r0
	move	%r0,	#0x00
	.endif
	.else
	; SHL 8
	move	%r3,	%r2
	move	%r2,	%r1
	move	%r1,	%r0
	move	%r0,	#0x00
	.endif
	.else
	; SHL 2..7
	move	-(%i3),	%i0h
	move	%i0h,	%r3
	move	%r3,	%r2
	move	%r2,	%r1
	move	%r1,	%r0
	mshl	%r1,	#\value
	move	%r0,	%a
	mshl	%r2,	#\value
	or	%r1,	%a
	mshl	%r3,	#\value
	or	%r2,	%a
	mshl	%i0h,	#\value
	or	%r3,	%a
	move	%i0h,	(%i3)+
	.endif
	.else
	; SHL 1
	shl	%r0
	shlc	%r1
	shlc	%r2
	shlc	%r3
	.endif
	.else
	; SHL 0
	; do nothing
	.endif
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Right (char)
	;
	; Version 5.0
	;
	; Function:	rega >> regc
	; Result:	rega
	; Date:		04-02-1997
	;=========================================================
	.macro	lshrqi3	rega, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shr	\rega
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Right (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb >> regc
	; Result:	rega:regb
	; Date:		04-02-1997
	;=========================================================
	.macro	lshrhi3	rega, regb, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shr	\rega
	shrc	\regb
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Right (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb >> value (immediate)
	; Result:	rega:regb
	;
	; Date:		04-02-1997
	;=========================================================
	.macro	lshrihi3	rega, regb, value

	.if	\value
	; value >= 1
	.if	(\value & 0xFFFE)
	; value > 1
	.if	(\value & 0xFFF8)
	; value > 7
	.if	(\value - 0x0008)
	; value > 8
	.if	(\value & 0xFFF0)
	; SHR 16+
	move	\rega,	#0x00
	move	\regb,	#0x00
	.else
	; SHR 9..15
	mshr	\rega,	#\value-8
	move	\regb,	\rega
	move	\rega,	#0x00
	.endif
	.else
	; SHR 8
	move	\regb,	\rega
	move	\rega,	#0x00
	.endif
	.else
	; SHR 2..7
	mshr	\regb,	#\value
	mshr	\rega,	#\value
	or	\regb,	%a
	.endif
	.else
	; SHR 1
	shr	\rega
	shrc	\regb
	.endif
	.else
	; SHR 0
	; do nothing
	.endif
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Right (long)
	;
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 >> SP(+0)
	; Result:	r3:r2:r1:r0
	; Date:		04-02-1997
	;=========================================================
	.macro	lshrsi3	; r3, r2, r1, r0, SP(+0)	r3, r2, r1, r0

	move	-(%i3),	%i0h		; save i0h
	move	%i0h,	(%i3, 1)	; load n
	jzs	.L\@_end_it
.L\@_next_bit:
	shr	%r3
	shrc	%r2
	shrc	%r1
	shrc	%r0
	dec	%i0h
	jzc	.L\@_next_bit
.L\@_end_it:
	move	%i0h,	(%i3, 2)+	; restore i0h
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Logic Shift Right (long)
	;
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 >> value (immediate)
	; Result:	r3:r2:r1:r0
	; Date:		03-02-1997
	;=========================================================
	.macro	lshrisi3	value	; r3, r2, r1, r0	r3, r2, r1, r0

	.if	\value
	; value >= 1
	.if	(\value & 0xFFFE)
	; value > 1
	.if	(\value & 0xFFF8)
	; value > 7
	.if	(\value - 0x0008)
	; value > 8
	.if	(\value & 0xFFF0)
	; value > 15
	.if	(\value - 0x0010)
	; value > 16
	.if	(\value & 0xFFE8)
	; value > 23
	.if	(\value - 0x0018)
	; value > 24
	.if	(\value & 0xFFE0)
	; SHR 32+
	move	%r0,	#0x00
	move	%r1,	#0x00
	move	%r2,	#0x00
	move	%r3,	#0x00
	.else
	; SHR 25..31
	mshr	%r3,	#\value-24
	move	%r0,	%r3
	move	%r1,	#0x00
	move	%r2,	#0x00
	move	%r3,	#0x00
	.endif
	.else
	; SHR 24
	move	%r0,	%r3
	move	%r1,	#0x00
	move	%r2,	#0x00
	move	%r3,	#0x00
	.endif
	.else
	; SHR 17..23
	mshr	%r2,	#\value-16
	mshr	%r3,	#\value-16
	or	%r0,	%r2,	%a
	move	%r1,	%r3
	move	%r2,	#0x00
	move	%r3,	#0x00
	.endif
	.else
	; SHR 16
	move	%r0,	%r2
	move	%r1,	%r3
	move	%r2,	#0x00
	move	%r3,	#0x00
	.endif
	.else
	; SHR 9..15
	mshr	%r1,	#\value-8
	mshr	%r2,	#\value-8
	or	%r0,	%r1,	%a
	mshr	%r3,	#\value-8
	or	%r1,	%r2,	%a
	move	%r2,	%r3
	move	%r3,	#0x00
	.endif
	.else
	; SHR 8
	move	%r0,	%r1
	move	%r1,	%r2
	move	%r2,	%r3
	move	%r3,	#0x00
	.endif
	.else
	; SHR 2..7
	mshr	%r0,	#\value
	mshr	%r1,	#\value
	or	%r0,	%a
	mshr	%r2,	#\value
	or	%r1,	%a
	mshr	%r3,	#\value
	or	%r2,	%a
	.endif
	.else
	; SHR 1
	shr	%r3
	shrc	%r2
	shrc	%r1
	shrc	%r0
	.endif
	.else
	; SHR 0
	; do nothing
	.endif
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Arithmetic Shift Right (char)
	;
	; Version 5.0
	;
	; Function:	rega >> regc
	; Result:	rega
	; Date:		04-02-1997
	;=========================================================
	.macro	ashrqi3	rega, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shra	\rega
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Arithmetic Shift Right (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb >> regc
	; Result:	rega:regb
	; Date:		04-02-1997
	;=========================================================
	.macro	ashrhi3	rega, regb, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shra	\rega
	shrc	\regb
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Arithmetic Shift Right (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb >> value (immediate)
	; Result:	rega:regb
	;
	; Date:		04-02-1997
	;=========================================================
	.macro	ashrihi3	rega, regb, value

	.if	\value
	; value >= 1
	.if	(\value & 0xFFFE)
	; value > 1
	.if	(\value & 0xFFF8)
	; value > 7
	.if	(\value - 0x0008)
	; value > 8
	.if	(\value - 0x0009)
	; value > 9
	.if	(\value & 0xFFF0)
	; SHR 16+
	mshra	\rega,	#7		; copy sign into all bits
	move	\regb,	\rega
	.else
	; SHR 10..15
	mshra	\rega,	#\value-8
	move	\regb,	\rega
	mshra	\rega,	#7		; copy sign into all bits
	.endif
	.else
	; SHR 9
	shra	\regb,	\rega
	mshra	\rega,	#7
	.endif
	.else
	; SHR 8
	move	\regb,	\rega
	mshra	\rega,	#7		; copy sign into all bits
	.endif
	.else
	; SHR 2..7
	mshr	\regb,	#\value
	mshra	\rega,	#\value
	or	\regb,	%a
	.endif
	.else
	; SHR 1
	shra	\rega
	shrc	\regb
	.endif
	.else
	; SHR 0
	; do nothing
	.endif
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Arithmetic Shift Right (long)
	;
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 >> SP(+0)
	; Result:	r3:r2:r1:r0
	; Date:		04-02-1997
	;=========================================================
	.macro	ashrsi3	; r3, r2, r1, r0, SP(+0)	r3, r2, r1, r0

	move	-(%i3),	%i0h		; save i0h
	move	%i0h,	(%i3, 1)	; load n
	jzs	.L\@_end_it
.L\@_next_bit:
	shra	%r3
	shrc	%r2
	shrc	%r1
	shrc	%r0
	dec	%i0h
	jzc	.L\@_next_bit
.L\@_end_it:
	move	%i0h,	(%i3, 2)+	; restore i0h
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Arithmetic Shift Right (long)
	;
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 >> value (immediate)
	; Result:	r3:r2:r1:r0
	; Date:		03-02-1997
	;=========================================================
	.macro	ashrisi3	value	; r3, r2, r1, r0	r3, r2, r1, r0

	.if	\value
	; value >= 1
	.if	(\value & 0xFFFE)
	; value > 1
	.if	(\value & 0xFFF8)
	; value > 7
	.if	(\value - 0x0008)
	; value > 8
	.if	(\value - 0x0009)
	; value > 9
	.if	(\value & 0xFFF0)
	; value > 15
	.if	(\value - 0x0010)
	; value > 16
	.if	(\value - 0x0011)
	; value > 17
	.if	(\value & 0xFFE8)
	; value > 23
	.if	(\value - 0x0018)
	; value > 24
	.if	(\value - 0x0019)
	; value > 25
	.if	(\value & 0xFFE0)
	; SHR 32+
	mshra	%r3,	#7
	move	%r2,	%r3
	move	%r1,	%r3
	move	%r0,	%r3
	.else
	; SHR 26..31
	mshra	%r3,	#\value-24
	move	%r0,	%r3
	mshra	%r3,	#7
	move	%r2,	%r3
	move	%r1,	%r3
	.endif
	.else
	; SHR 25
	shra	%r0,	%r3
	mshra	%r3,	#7
	move	%r1,	%r3
	move	%r2,	%r3
	.endif
	.else
	; SHR 24
	move	%r0,	%r3
	mshra	%r3,	#7
	move	%r2,	%r3
	move	%r1,	%r3
	.endif
	.else
	; SHR 18..23
	mshr	%r2,	#\value-16
	mshra	%r3,	#\value-16
	or	%r0,	%r2,	%a
	move	%r1,	%r3
	mshra	%r3,	#7
	move	%r2,	%r3
	.endif
	.else
	; SHR 17
	shra	%r1,	%r3
	shrc	%r0,	%r2
	mshra	%r3,	#7
	move	%r2,	%r3
	.endif
	.else
	; SHR 16
	move	%r0,	%r2
	move	%r1,	%r3
	mshra	%r3,	#7
	move	%r2,	%r3
	.endif
	.else
	; SHR 10..15
	mshr	%r1,	#\value-8
	mshr	%r2,	#\value-8
	or	%r0,	%r1,	%a
	mshra	%r3,	#\value-8
	or	%r1,	%r2,	%a
	move	%r2,	%r3
	mshra	%r3,	#7
	.endif
	.else
	; SHR 9
	shra	%r3
	shrc	%r2
	shrc	%r0,	%r1
	move	%r1,	%r2
	move	%r2,	%r3
	mshra	%r3,	#7
	.endif
	.else
	; SHR 8
	move	%r0,	%r1
	move	%r1,	%r2
	move	%r2,	%r3
	mshra	%r3,	#7
	.endif
	.else
	; SHR 2..7
	mshr	%r0,	#\value
	mshr	%r1,	#\value
	or	%r0,	%a
	mshr	%r2,	#\value
	or	%r1,	%a
	mshra	%r3,	#\value
	or	%r2,	%a
	.endif
	.else
	; SHR 1
	shra	%r3
	shrc	%r2
	shrc	%r1
	shrc	%r0
	.endif
	.else
	; SHR 0
	; do nothing
	.endif
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Left (char)
	;
	; Version 5.0
	;
	; Function:	rega << regc
	; Result:	rega
	; Date:		04-02-1997
	;=========================================================
	.macro	rotlqi3	rega, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shl	%a,	\rega
	shlc	\rega
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Left (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb << regc
	; Result:	rega:regb
	; Date:		04-02-1997
	;=========================================================
	.macro	rotlhi3	rega, regb, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shl	%a,	\rega
	shlc	\regb
	shlc	\rega
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Left (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb << value (immediate)
	; Result:	rega:regb
	;
	; use regc for temporary value
	;
	; Date:		03-02-1997
	;=========================================================
	.macro	rotlihi3	rega, regb, regc, value

	.if	\value
	; value >= 1
	.if	(\value & 0xFFFE)
	; value > 1
	.if	(\value & 0xFFF8)
	; value > 7
	.if	(\value - 0x0008)
	; value > 8
	.if	(\value - 0x000F)
	; ROL 10..14  (ROR 16 - value )
	mshl	\rega,	#\value-8
	move	\regc,	%a
	mshl	\regb,	#\value-8
	or	\rega,	%a
	or	\regb,	\regc
	.else
	; ROL 15  ( ROR 1 )
	shr	%a,	\regb
	shrc	\rega
	shrc	\regb
	.endif
	.else
	; ROL 8  (Swap rega regb)
	move	\regc,	\rega
	move	\rega,	\regb
	move	\regb,	\regc
	.endif
	.else
	; ROL 2..7
	move	\regc,	\rega
	move	\rega,	\regb
	mshl	\rega,	#\value
	move	\regb,	%a
	mshl	\regc,	#\value
	or	\rega,	%a
	or	\regb,	\regc
	.endif
	.else
	; ROL 1
	shl	%a,	\rega
	shlc	\regb
	shlc	\rega
	.endif
	.else
	; ROL 0
	; do nothing
	.endif
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Left (long)
	;
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 << SP(+0)
	; Result:	r3:r2:r1:r0
	; Date:		03-02-1997
	;=========================================================
	.macro	rotlsi3	; r3, r2, r1, r0, SP(+0)	r3, r2, r1, r0

	move	-(%i3),	%i0h		; save i0h
	move	%i0h,	(%i3, 1)	; load n
	jzs	.L\@_end_it
.L\@_next_bit:
	shl	%a,	%r3
	shlc	%r0
	shlc	%r1
	shlc	%r2
	shlc	%r3
	dec	%i0h
	jzc	.L\@_next_bit
.L\@_end_it:
	move	%i0h,	(%i3, 2)+	; restore i0h
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Left (long)
	; (for hardware multiplication version)
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 << value (immediate)
	; Result:	r3:r2:r1:r0
	; Date:		03-02-1997
	;=========================================================
	.macro	rotlisi3	value	; r3, r2, r1, r0	r3, r2, r1, r0

	.if	\value
	; value >= 1
	.if	(\value & 0xFFFE)
	; value > 1
	.if	(\value & 0xFFF8)
	; value > 7
	.if	(\value - 0x0008)
	; value > 8
	.if	(\value & 0xFFF0)
	; value > 15
	.if	(\value - 0x0010)
	; value > 16
	.if	(\value & 0xFFE8)
	; value > 23
	.if	(\value - 0x0018)
	; value > 24
	.if	(\value - 0x001F)
	; ROL 25..30
	move	-(%i3),	%i0h
	mshl	%r0,	#\value-24
	move	%i0h,	%a
	mshl	%r1,	#\value-24
	or	%r0,	%a
	mshl	%r2,	#\value-24
	or	%r1,	%a
	mshl	%r3,	#\value-24
	or	%r2,	%a
	or	%r3,	%i0h
	move	%i0h,	(%i3)+
	.else
	; ROL 31   ( ROR 1 )
	shr	%a,	%r0
	shrc	%r3
	shrc	%r2
	shrc	%r1
	shrc	%r0
	.endif
	.else
	; ROL 24  ( ROR 8 )
	move	-(%i3),	%i0h
	move	%i0h,	%r0
	move	%r0,	%r1
	move	%r1,	%r2
	move	%r2,	%r3
	move	%r3,	%i0h
	move	%i0h,	(%i3)+
	.endif
	.else
	; ROL 17..23  (ROR 32 - value)
	move	-(%i3),	%i0h
	move	%i0h,	%r0
	move	%r0,	%r1
	move	%r1,	%r2
	move	%r2,	%r3
	mshl	%r0,	#\value-16
	move	%r3,	%a
	mshl	%r1,	#\value-16
	or	%r0,	%a
	mshl	%r2,	#\value-16
	or	%r1,	%a
	mshl	%i0h,	#\value-16
	or	%r2,	%a
	or	%r3,	%i0h
	move	%i0h,	(%i3)+
	.endif
	.else
	; ROL 16  (Swap r3 r2 and r1 r0)
	move	-(%i3),	%i0h
	move	%i0h,	%r1
	move	%r1,	%r3
	move	%r3,	%i0h
	move	%i0h,	%r0
	move	%r0,	%r2
	move	%r2,	%i0h
	move	%i0h,	(%i3)+
	.endif
	.else
	; ROL 9..15
	move	-(%i3),	%i0h
	move	%i0h,	%r2
	move	%r2,	%r0
	move	%r0,	%i0h
	move	%i0h,	%r1
	move	%r1,	%r3
	mshl	%r0,	#\value-8
	move	%r3,	%a
	mshl	%r1,	#\value-8
	or	%r0,	%a
	mshl	%r2,	#\value-8
	or	%r1,	%a
	mshl	%i0h,	#\value-8
	or	%r2,	%a
	or	%r3,	%i0h
	move	%i0h,	(%i3)+
	.endif
	.else
	; ROL 8
	move	-(%i3),	%i0h
	move	%i0h,	%r3
	move	%r3,	%r2
	move	%r2,	%r1
	move	%r1,	%r0
	move	%r0,	%i0h
	move	%i0h,	(%i3)+
	.endif
	.else
	; ROL 2..7
	move	-(%i3),	%i0h
	move	%i0h,	%r3
	move	%r3,	%r2
	move	%r2,	%r1
	move	%r1,	%r0
	mshl	%r1,	#\value
	move	%r0,	%a
	mshl	%r2,	#\value
	or	%r1,	%a
	mshl	%r3,	#\value
	or	%r2,	%a
	mshl	%i0h,	#\value
	or	%r3,	%a
	or	%r0,	%i0h
	move	%i0h,	(%i3)+
	.endif
	.else
	; ROL 1
	shl	%a,	%r3
	shlc	%r0
	shlc	%r1
	shlc	%r2
	shlc	%r3
	.endif
	.else
	; ROL 0
	; do nothing
	.endif
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Right (char)
	;
	; Version 5.0
	;
	; Function:	rega >> regc
	; Result:	rega
	; Date:		04-02-1997
	;=========================================================
	.macro	rotrqi3	rega, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shr	%a,	\rega
	shrc	\rega
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Right (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb >> regc
	; Result:	rega:regb
	; Date:		04-02-1997
	;=========================================================
	.macro	rotrhi3	rega, regb, regc

	dec	\regc
	jcc	.L\@_end_it
.L\@_next_bit:
	shr	%a,	\regb
	shrc	\rega
	shrc	\regb
	dec	\regc
	jcs	.L\@_next_bit
.L\@_end_it:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Right (integer)
	;
	; Version 5.0
	;
	; Function:	rega:regb >> value (immediate)
	; Result:	rega:regb
	;
	; regc is used for intermediary results
	;
	; Date:		04-02-1997
	;=========================================================
	.macro	rotrihi3	rega, regb, regc, value

	.if	\value
	.set	shlvalue,	16 - \value
	.endif

	rotlihi3	\rega, \regb, \regc, shlvalue
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Right (long)
	;
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 ROR SP(+0)
	; Result:	r3:r2:r1:r0
	; Date:		04-02-1997
	;=========================================================
	.macro	rotrsi3	; r3, r2, r1, r0, SP(+0)	r3, r2, r1, r0

	move	-(%i3),	%i0h		; save i0h
	move	%i0h,	(%i3, 1)	; load n
	jzs	.L\@_end_it
.L\@_next_bit:
	shr	%a,	%r0
	shrc	%r3
	shrc	%r2
	shrc	%r1
	shrc	%r0
	dec	%i0h
	jzc	.L\@_next_bit
.L\@_end_it:
	move	%i0h,	(%i3, 2)+	; restore i0h
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Rotate Right (long)
	;
	; Version 5.0
	;
	; Function:	r3:r2:r1:r0 >> value (immediate)
	; Result:	r3:r2:r1:r0
	; Date:		03-02-1997
	;=========================================================
	.macro	rotrisi3	value	; r3, r2, r1, r0	r3, r2, r1, r0

	.if	\value
	.set	shlvalue,	32 - \value
	.endif

	rotlisi3	shlvalue
	.endm


	;; FRa this macro should only be used in program that are to be
	;; simulated with the Sim816 instruction level simulator. It uses
	;; an unimplemented ALU opcode to cause the simulator to stop
	;; executing the program containing it.
	.macro	HALTSIM	number
	.long	0x00080000 + (\number &0x0ff)	; unimplemented ALU operation
	.endm  


	
	
		
	;========================================================================
	; Coolrisc 816 Library
	; Conditional Jumps (formerly file jumps.s)
	; version 5.0
	; Date:   12-02-1997
	;========================================================================


	.altregsyn	1

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega > regb
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpgtqi3	jumpto, rega, regb

	cmpa	\rega,	\regb
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega > number
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpgtiqi3	jumpto, rega, number

	cmpa	\rega,	#(\number & 0xFF)
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than Zero (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega > 0
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpgtzqi3	jumpto, rega

	cmpa	\rega,	#0
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega >= regb
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpgeqi3	jumpto, rega, regb

	cmpa	\rega,	\regb
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega >= number
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpgeiqi3	jumpto, rega, number

	cmpa	\rega,	#(\number & 0xFF)
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than Zero (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega >= 0
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpgezqi3	jumpto, rega

	cmpa	\rega,	#0
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega < regb
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpltqi3	jumpto, rega, regb

	cmpa	\rega,	\regb
	jlt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega < number
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpltiqi3	jumpto, rega, number

	cmpa	\rega,	#(\number & 0xFF)
	jlt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than Zero (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega < 0
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpltzqi3	jumpto, rega

	tstb	\rega,	#7
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega <= regb
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpleqi3	jumpto, rega, regb

	cmpa	\rega,	\regb
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than (Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega <= number
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpleiqi3	jumpto, rega, number

	cmpa	\rega,	#(\number & 0xFF)
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than Zero (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega <= 0
	; Date:			12-02-1997
	;=========================================================
	.macro  jmplezqi3	jumpto, rega

	cmpa	\rega,	#0
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega = regb
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpeqqi3	jumpto, rega, regb

	cmp	\rega,	\regb		; \regb - \rega
	jeq	\jumpto			; if \rega = \regb then jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To (Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega = number
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpeqiqi3	jumpto, rega, number

	cmp	\rega,	#(\number & 0xFF)
	jeq	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To Zero (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega = 0
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpeqzqi3	jumpto, rega

	move	%a,	\rega
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if not Equal To (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega != regb
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpneqi3	jumpto, rega, regb

	cmp	\rega,	\regb
	jne	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if not Equal To (Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega != number
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpneiqi3	jumpto, rega, number

	cmp	\rega,	#(\number & 0xFF)
	jne	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if not Equal To Zero (Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega != 0
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpnezqi3	jumpto, rega

	move	%a,	\rega
	jne	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Unsigned Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega > regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgtunsqi3	jumpto, rega, regb

	cmp	\rega,	\regb		; \regb - \rega
	jgt	\jumpto			; if \rega > \regb then jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Unsigned Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega > number
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgtunsiqi3	jumpto, rega, number

	cmp	\rega,	#(\number & 0xFF)
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than Zero (Unsigned Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega > 0
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgtunszqi3	jumpto, rega

	cmp	\rega,	#0
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Unsigned Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega >= regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgeunsqi3	jumpto, rega, regb                              
	
	cmp	\rega,	\regb
	jge	\jumpto
	.endm                                   

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Unsigned Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega >= number
	; Date:			12-02-1997
	;=========================================================
	.macro	jmpgeunsiqi3	jumpto, rega, number                              
	
	cmp	\rega,	#(\number & 0xFF)
	jge	\jumpto
	.endm                                   

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Unsigned Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega < regb
	; Date:			12-02-1997
	;=========================================================
	.macro	jmpltunsqi3	jumpto, rega, regb

	cmp	\rega,	\regb
	jlt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Unsigned Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega < number
	; Date:			12-02-1997
	;=========================================================
	.macro	jmpltunsiqi3	jumpto, rega, number

	cmp	\rega,	#(\number & 0xFF)
	jlt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than (Unsigned Char)
	;
	; Version 5.0
	;
	; Jump Condition:	rega <= regb
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpleunsqi3	jumpto, rega, regb

	cmp	\rega,	\regb
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than (Unsigned Char, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	rega <= number
	; Date:			12-02-1997
	;=========================================================
	.macro  jmpleunsiqi3	jumpto, rega, number

	cmp	\rega,	#(\number & 0xFF)
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A > B
	;			A: rega:regb,	B:regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgthi3	jumpto, rega, regb, regc, regd

	cmpa	\rega,	\regc
	jne	.L\@_end
	cmp	\regb,	\regd
.L\@_end:
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A > number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgtihi3	jumpto, rega, regb, number

	cmpa	\rega,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF)
.L\@_end:
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than Zero (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A > 0
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgtzhi3	jumpto, rega, regb

	cmpa	\rega,	#0
	jne	.L\@_end
	cmp	\regb,	#0
.L\@_end:
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Or Equal Than (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= B
	;			A: rega:regb,	B:regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgehi3	jumpto, rega, regb, regc, regd

	cmpa	\rega,	\regc
	jne	.L\@_end
	cmp	\regb,	\regd
.L\@_end:
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgeihi3	jumpto, rega, regb, number

	cmpa	\rega,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF)
.L\@_end:
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than Zero (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= 0
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgezhi3	jumpto, rega, regb

	tstb	\rega,	#7
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A < B
	;			A: rega:regb,	B:regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmplthi3	jumpto, rega, regb, regc, regd

	cmpa	\rega,	\regc
	jne	.L\@_end
	cmp	\regb,	\regd
.L\@_end:
	jlt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A < number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpltihi3	jumpto, rega, regb, number

	cmpa	\rega,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF)
.L\@_end:
	jlt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than Zero (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A < 0
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpltzhi3	jumpto, rega, regb

	tstb	\rega,	#7
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal To (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= B
	;			A: rega:regb,	B:regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmplehi3	jumpto, rega, regb, regc, regd

	cmpa	\rega,	\regc
	jne	.L\@_end
	cmp	\regb,	\regd
.L\@_end:
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal To (Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpleihi3	jumpto, rega, regb, number

	cmpa	\rega,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF)
.L\@_end:
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal To Zero (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= 0
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmplezhi3	jumpto, rega, regb

	tstb	\rega,	#7
	jzc	\jumpto
	or	%a,	\rega,	\regb
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A = B
	;			A: rega:regb,	B:regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpeqhi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	\regc
	jne	.L\@_end
	cmp	\regb,	\regd
	jeq	\jumpto
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To (Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A = number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpeqihi3	jumpto, rega, regb, number

	cmp	\rega,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF)
	jeq	\jumpto
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To Zero (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A = 0
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpeqzhi3	jumpto, rega, regb

	or	%a,	\rega,	\regb
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Not Equal To (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A != B
	;			A: rega:regb,	B:regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpnehi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	\regc
	jne	\jumpto
	cmp	\regb,	\regd
	jne	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Not Equal To (Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A != number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpneihi3	jumpto, rega, regb, number

	cmp	\rega,	#(\number & 0xFF00) >> 8
	jne	\jumpto
	cmp	\regb,	#(\number & 0xFF)
	jne	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump ifNot Equal To Zero (Integer)
	;
	; Version 5.0
	;
	; Jump Condition:	A != 0
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpnezhi3	jumpto, rega, regb

	or	%a,	\rega,	\regb
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Unsigned Integer)
	;
	; Version 5.0
	;
	; Jump Condition: 	A > B
	;			A: rega:regb,	B: regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgtunshi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	\regc
	jne	.L\@_end
	cmp	\regb,	\regd
.L\@_end:
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Unsigned Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition: 	A > number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgtunsihi3	jumpto, rega, regb, number

	cmp	\rega,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF)
.L\@_end:
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than Zero (Unsigned Integer)
	;
	; Version 5.0
	;
	; Jump Condition: 	A > 0
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgtunszhi3	jumpto, rega, regb

	or	%a,	\rega,	\regb
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Unsigned Integer)
	;
	; Version 5.0
	;
	; Jump Condition: 	A >= B
	;			A: rega:regb,	B: regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgeunshi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	\regc
	jne	.L\@_end
	cmp	\regb,	\regd
.L\@_end:
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Unsigned Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition: 	A >= number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpgeunsihi3	jumpto, rega, regb, number

	cmp	\rega,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF)
.L\@_end:
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Unsigned Integer)
	;
	; Version 5.0
	;
	; Jump Condition: 	A < B
	;			A: rega:regb,	B: regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpltunshi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	\regc
	jne	.L\@_end
	cmp	\regb,	\regd
.L\@_end:
	jlt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Unsigned Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition: 	A < number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpltunsihi3	jumpto, rega, regb, number

	cmp	\rega,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF)
.L\@_end:
	jlt	\jumpto
	.endm
	
	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal To (Unsigned Integer)
	;
	; Version 5.0
	;
	; Jump Condition: 	A <= B
	;			A: rega:regb,	B: regc:regd
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpleunshi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	\regc
	jne	.L\@_end
	cmp	\regb,	\regd
.L\@_end:
	jle	\jumpto
	.endm
	
	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal To (Unsigned Integer, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition: 	A <= number
	;			A: rega:regb
	; Date:	12-02-1997
	;=========================================================
	.macro	jmpleunsihi3	jumpto, rega, regb, number

	cmp	\rega,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF)
.L\@_end:
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A > B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgtsi3	jumpto, rega, regb, regc, regd

	cmpa	\rega,	(%i3, 0)		; first compare highbytes
	jne	.L\@_end
	cmp	\regb,	(%i3, 1)		; compare next bytes
	jne	.L\@_end
	cmp	\regc,	(%i3, 2)
	jne	.L\@_end
	cmp	\regd,	(%i3, 3)
.L\@_end:
	move	%a,	(%i3, 4)+	; gt == cc and c not modified
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A > number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgtisi3	jumpto, rega, regb, regc, regd, number

	cmpa	\rega,	#(\number & 0xFF000000) >> 24
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	.L\@_end
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regd,	#(\number & 0xFF)
.L\@_end:
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than Zero (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A > 0
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgtzsi3	jumpto, rega, regb, regc, regd

	tstb	\rega,	#7
	jzc	.L\@_end
	or	%a,	\rega,	\regb
	or	%a,	\regc
	or	%a,	\regd
	jzc	\jumpto
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal To (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgesi3	jumpto, rega, regb, regc, regd

	cmpa	\rega,	(%i3, 0)		; first compare highbytes
	jne	.L\@_test
	cmp	\regb,	(%i3, 1)		; compare next bytes
	jne	.L\@_test
	cmp	\regc,	(%i3, 2)
	jne	.L\@_test
	cmp	\regd,	(%i3, 3)
.L\@_test:
	jlt	.L\@_end
	move	%a,	(%i3, 4)+
	jump	\jumpto
.L\@_end:
	move	%a,	(%i3, 4)+	; gt == cc and c not modified
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal to (Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgeisi3	jumpto, rega, regb, regc, regd, number

	cmpa	\rega,	#(\number & 0xFF000000) >> 24
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	.L\@_end
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regd,	#(\number & 0xFF)
.L\@_end:
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Zero (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= 0
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgezsi3	jumpto, rega, regb, regc, regd

	tstb	\rega,	#7
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A < B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpltsi3	jumpto, rega, regb, regc, regd

	cmpa	\rega,	(%i3, 0)
	jne	.L\@_test
	cmp	\regb,	(%i3, 1)
	jne	.L\@_test
	cmp	\regc,	(%i3, 2)
	jne	.L\@_test
	cmp	\regd,	(%i3, 3)
.L\@_test:
	jge	.L\@_end
	move	%a,	(%i3, 4)+
	jump	\jumpto
.L\@_end:
	move	%a,	(%i3, 4)+	; empty stack
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A < number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpltisi3	jumpto, rega, regb, regc, regd, number

	cmpa	\rega,	#(\number & 0xFF000000) >> 24
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	.L\@_end
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regd,	#(\number & 0xFF)
.L\@_end:
	jlt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than Zero (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A < 0
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpltzsi3	jumpto, rega, regb, regc, regd

	tstb	\rega,	#7
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal to (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmplesi3	jumpto, rega, regb, regc, regd

	cmpa	\rega,	(%i3, 0)
	jne	.L\@_end
	cmp	\regb,	(%i3, 1)
	jne	.L\@_end
	cmp	\regc,	(%i3, 2)
	jne	.L\@_end
	cmp	\regd,	(%i3, 3)
.L\@_end:
	move	%a,	(%i3, 4)+		; empty stack
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal to (Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpleisi3	jumpto, rega, regb, regc, regd, number

	cmpa	\rega,	#(\number & 0xFF000000) >> 24
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	.L\@_end
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regd,	#(\number & 0xFF)
.L\@_end:
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal to Zero (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= 0
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmplezsi3	jumpto, rega, regb, regc, regd

	tstb	\rega,	#7
	jzc	\jumpto
	or	%a,	\rega,	\regb	; test = 0
	or	%a,	\regc
	or	%a,	\regd
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal to (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A = B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpeqsi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	(%i3, 0)
	jne	.L\@_end
	cmp	\regb,	(%i3, 1)
	jne	.L\@_end
	cmp	\regc,	(%i3, 2)
	jne	.L\@_end
	cmp	\regd,	(%i3, 3)
	jne	.L\@_end
	move	%a,	(%i3, 4)+
	jump	\jumpto
.L\@_end:
	move	%a,	(%i3, 4)+	; empty stack
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal to (Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A = number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpeqisi3	jumpto, rega, regb, regc, regd, number

	cmp	\rega,	#(\number & 0xFF000000) >> 24
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	.L\@_end
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regd,	#(\number & 0xFF)
	jeq	\jumpto
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal to Zero (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A = 0
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpeqzsi3	jumpto, rega, regb, regc, regd

	or	%a,	\rega,	\regb	; test = 0
	or	%a,	\regc
	or	%a,	\regd
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if not Equal to (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A != B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpnesi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	(%i3, 0)
	jne	.L\@_true
	cmp	\regb,	(%i3, 1)
	jne	.L\@_true
	cmp	\regc,	(%i3, 2)
	jne	.L\@_true
	cmp	\regd,	(%i3, 3)
	jeq	.L\@_end
.L\@_true:
	move	%a,	(%i3, 4)+
	jump	\jumpto
.L\@_end:
	move	%a,	(%i3, 4)+	; empty stack

	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Not qual to (Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A != number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpneisi3	jumpto, rega, regb, regc, regd, number

	cmp	\rega,	#(\number & 0xFF000000) >> 24
	jne	\jumpto
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	\jumpto
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	\jumpto
	cmp	\regd,	#(\number & 0xFF)
	jne	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Not Equal to Zero (Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A != 0
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpnezsi3	jumpto, rega, regb, regc, regd

	or	%a,	\rega,	\regb	; test = 0
	or	%a,	\regc
	or	%a,	\regd
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Unsigned Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A > B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgtunssi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	(%i3, 0)		; first compare highbytes
	jne	.L\@_end
	cmp	\regb,	(%i3, 1)		; compare next bytes
	jne	.L\@_end
	cmp	\regc,	(%i3, 2)
	jne	.L\@_end
	cmp	\regd,	(%i3, 3)
.L\@_end:
	move	%a,	(%i3, 4)+	; gt == cc and c not modified
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Unsigned Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A > number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgtunsisi3	jumpto, rega, regb, regc, regd, number

	cmp	\rega,	#(\number & 0xFF000000) >> 24
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	.L\@_end
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regd,	#(\number & 0xFF)
.L\@_end:
	jgt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than Zero (Unsigned Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A > 0
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgtunszsi3	jumpto, rega, regb, regc, regd

	or	%a,	\rega,	\regb	; test = 0
	or	%a,	\regc
	or	%a,	\regd
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal To (Unsigned Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgeunssi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	(%i3, 0)		; first compare highbytes
	jne	.L\@_test
	cmp	\regb,	(%i3, 1)		; compare next bytes
	jne	.L\@_test
	cmp	\regc,	(%i3, 2)
	jne	.L\@_test
	cmp	\regd,	(%i3, 3)
.L\@_test:
	jlt	.L\@_end
	move	%a,	(%i3, 4)+
	jump	\jumpto
.L\@_end:
	move	%a,	(%i3, 4)+	; gt == cc and c not modified
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal to (Unsigned Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpgeunsisi3	jumpto, rega, regb, regc, regd, number

	cmp	\rega,	#(\number & 0xFF000000) >> 24
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	.L\@_end
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regd,	#(\number & 0xFF)
.L\@_end:
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Unsigned Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A < B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpltunssi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	(%i3, 0)
	jne	.L\@_test
	cmp	\regb,	(%i3, 1)
	jne	.L\@_test
	cmp	\regc,	(%i3, 2)
	jne	.L\@_test
	cmp	\regd,	(%i3, 3)
.L\@_test:
	jge	.L\@_end
	move	%a,	(%i3, 4)+
	jump	\jumpto
.L\@_end:
	move	%a,	(%i3, 4)+	; empty stack
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Unsigned Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A < number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpltunsisi3	jumpto, rega, regb, regc, regd, number

	cmp	\rega,	#(\number & 0xFF000000) >> 24
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	.L\@_end
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regd,	#(\number & 0xFF)
.L\@_end:
	jlt	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal to (Unsigned Long)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= B
	;			A: rega:regb:regc:regd,  B: SP+0..+3
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpleunssi3	jumpto, rega, regb, regc, regd

	cmp	\rega,	(%i3, 0)
	jne	.L\@_end
	cmp	\regb,	(%i3, 1)
	jne	.L\@_end
	cmp	\regc,	(%i3, 2)
	jne	.L\@_end
	cmp	\regd,	(%i3, 3)
.L\@_end:
	move	%a,	(%i3, 4)+		; empty stack
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal to (Unsigned Long, Immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= number
	;			A: rega:regb:regc:regd
	; Date:   12-02-1997
	;=========================================================
	.macro	jmpleunsisi3	jumpto, rega, regb, regc, regd, number

	cmp	\rega,	#(\number & 0xFF000000) >> 24
	jne	.L\@_end
	cmp	\regb,	#(\number & 0xFF0000) >> 16
	jne	.L\@_end
	cmp	\regc,	#(\number & 0xFF00) >> 8
	jne	.L\@_end
	cmp	\regd,	#(\number & 0xFF)
.L\@_end:
	jle	\jumpto
	.endm



	
	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A > B
	;			A: r3, r2, r1, r0,  B: SP+0..+3
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgtsf3	jumpto

	.ifdef	SOFTLIB
	calls	cmpsf3
	.else
	call	cmpsf3
	.endif
	move	%a,	(%i3, 4)+
	cmp	%r0,	#0x01
	jeq	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Double, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A > number
	;			A: r3:r2:r1:r0,  B: number
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgtisf3	jumpto, number

	.if	(\number&0xFF000000)
	move	%a,	%r3
	.if	(\number&0x00800000)
	jzs	\jumpto
	.else
	jzs	.L\@_end
	.endif
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	tstb	%r2,	#7
	.if	(\number&0x00800000)
	; B < 0
	jzs	\jumpto
	.else
	jzc	.L\@_end
	.endif
	; Compare exponents
	cmp	%r3,	#(\number>>24)&0xFF
	jzc	.L\@_diff
	; Compare Mantissa (signs are equal)
	cmp	%r2,	#(\number>>16)&0xFF	; Compare AH BH
	jzc	.L\@_diff
	cmp	%r1,	#(\number>>8)&0xFF	; Compare AM BM
	jzc	.L\@_diff
	cmp	%r0,	#(\number&0xFF)	; Compare AL BL
	jzs	.L\@_end
.L\@_diff:
	; B<0 & c=1 => A>B, B>0 & c=1 => A<B
	; B<0 & c=0 => A<B, B>0 & c=0 => A>B
	.if	(\number&0x00800000)
	; B < 0
	jcs	\jumpto
	.else
	jcc	\jumpto
	.endif
	.else
	move	%a,	%r3
	jzs	.L\@_end
	tstb	%r2,	#7
	jzs	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than Zero (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A > 0
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgtzsf3	jumpto

	move	%a,	%r3
	jzs	.L\@_end
	tstb	%r2,	#7
	jzs	\jumpto
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= B
	;			A: r3:r2:r1:r0,  B: SP+0..+3
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgesf3	jumpto

	.ifdef	SOFTLIB
	calls	cmpsf3
	.else
	call	cmpsf3
	.endif
	move	%a,	(%i3, 4)+
	cmpa	%r0,	#0x00
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Double, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= number
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgeisf3	jumpto, number

	.if	(\number&0xFF000000)
	move	%a,	%r3
	.if	(\number&0x00800000)
	jzs	\jumpto
	.else
	jzs	.L\@_end
	.endif
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	tstb	%r2,	#7
	.if	(\number&0x00800000)
	jzs	\jumpto
	.else
	jzc	.L\@_end
	.endif
	; Compare exponents
	cmp	%r3,	#(\number>>24)&0xFF
	jzc	.L\@_diff
	; Remark that here we assume the number <> 0 !!
	; Compare Mantissa (signs are equal)
	cmp	%r2,	#(\number>>16)&0xFF	; Compare AH BH
	jzc	.L\@_diff
	cmp	%r1,	#(\number>>8)&0xFF	; Compare AM BM
	jzc	.L\@_diff
	cmp	%r0,	#(\number&0xFF)	; Compare AL BL
	jzs	\jumpto
.L\@_diff:
	; B<0 & c=1 => A>B, B>0 & c=1 => A<B
	; B<0 & c=0 => A<B, B>0 & c=0 => A>B
	.if	(\number&0x00800000)
	jcs	\jumpto
	.else
	jcc	\jumpto
	.endif
	.else
	move	%a,	%r3
	jzs	\jumpto
	tstb	%r2,	#7
	jzs	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than Zero (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= 0
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgezsf3	jumpto

	move	%a,	%r3
	jzs	\jumpto
	tstb	%r2,	#7
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= B
	;			A: r3:r2:r1:r0,  B: SP+0..+3
	; Date:   17-02-1997
	;=========================================================
	.macro	jmplesf3	jumpto

	.ifdef	SOFTLIB
	calls	cmpsf3
	.else
	call	cmpsf3
	.endif
	move	%a,	(%i3, 4)+
	cmpa	%r0,	#0x00
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than (Double, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= number
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpleisf3	jumpto, number

	.if	(\number&0xFF000000)
	move	%a,	%r3
	.if	(\number&0x00800000)
	jzs	.L\@_end
	.else
	jzs	\jumpto
	.endif
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	tstb	%r2,	#7
	.if	(\number&0x00800000)
	; B < 0
	jzs	.L\@_end
	.else
	; B >= 0
	jzc	\jumpto
	.endif
	; Compare exponents
	cmp	%r3,	#(\number>>24)&0xFF
	jzc	.L\@_diff
	; Compare Mantissa (signs are equal)
	cmp	%r2,	#(\number>>16)&0xFF	; Compare AH BH
	jzc	.L\@_diff
	cmp	%r1,	#(\number>>8)&0xFF	; Compare AM BM
	jzc	.L\@_diff
	cmp	%r0,	#(\number&0xFF)	; Compare AL BL
	jzs	\jumpto
.L\@_diff:
	; B<0 & c=1 => A>B, B>0 & c=1 => A<B
	; B<0 & c=0 => A<B, B>0 & c=0 => A>B
	.if	(\number&0x00800000)
	jcc	\jumpto
	.else
	jcs	\jumpto
	.endif
	.else
	move	%a,	%r3
	jzs	\jumpto
	tstb	%r2,	#7
	jzc	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than Zero (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= 0
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmplezsf3	jumpto

	move	%a,	%r3
	jzs	\jumpto
	tstb	%r2,	#7
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A < B
	;			A: r3:r2:r1:r0,  B: SP+0..+3
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpltsf3	jumpto

	.ifdef	SOFTLIB
	calls	cmpsf3
	.else
	call	cmpsf3
	.endif
	move	%a,	(%i3, 4)+
	cmp	%r0,	#0xFF
	jeq	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Double, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A < number
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpltisf3	jumpto, number

	.if	(\number&0xFF000000)
	move	%a,	%r3
	.if	(\number&0x00800000)
	jzs	.L\@_end
	.else
	jzs	\jumpto
	.endif
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	tstb	%r2,	#7
	.if	(\number&0x00800000)
	; B < 0
	jzs	.L\@_end
	.else
	; B >= 0
	jzc	\jumpto
	.endif
	; Compare exponents
	cmp	%r3,	#(\number>>24)&0xFF
	jzc	.L\@_diff
	; Compare Mantissa (signs are equal)
	cmp	%r2,	#(\number>>16)&0xFF	; Compare AH BH
	jzc	.L\@_diff
	cmp	%r1,	#(\number>>8)&0xFF	; Compare AM BM
	jzc	.L\@_diff
	cmp	%r0,	#(\number&0xFF)	; Compare AL BL
	jzs	.L\@_end
.L\@_diff:
	; B<0 & c=1 => A>B, B>0 & c=1 => A<B
	; B<0 & c=0 => A<B, B>0 & c=0 => A>B
	.if	(\number&0x00800000)
	jcc	\jumpto
	.else
	jcs	\jumpto
	.endif
	.else
	move	%a,	%r3
	jzs	.L\@_end
	tstb	%r2,	#7
	jzc	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than Zero (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A < 0
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpltzsf3	jumpto

	move	%a,	%r3
	jzs	.L\@_end
	tstb	%r2,	#7
	jzc	\jumpto
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A = B
	;			A: r3:r2:r1:r0,  B: SP+0..+3
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpeqsf3	jumpto

	.ifdef	SOFTLIB
	calls	cmpsf3
	.else
	call	cmpsf3
	.endif
	move	%a,	(%i3, 4)+
	move	%a,	%r0
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To (Double, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A = number
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpeqisf3	jumpto, number

	.if	(\number&0xFF000000)
	; Compare exponents
	cmp	%r3,	#(\number>>24)&0xFF
	jzc	.L\@_end
	; Compare Mantissa
	cmp	%r2,	#(\number>>16)&0xFF	; Compare AH BH
	jzc	.L\@_end
	cmp	%r1,	#(\number>>8)&0xFF	; Compare AM BM
	jzc	.L\@_end
	cmp	%r0,	#(\number&0xFF)	; Compare AL BL
	jzs	\jumpto
	.else
	move	%a,	%r3
	jzs	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To Zero (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A = 0
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpeqzsf3	jumpto

	move	%a,	%r3
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Different Than (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A != B
	;			A: r3:r2:r1:r0,  B: SP+0..+3
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpnesf3	jumpto

	.ifdef	SOFTLIB
	calls	cmpsf3
	.else
	call	cmpsf3
	.endif
	move	%a,	(%i3, 4)+
	move	%a,	%r0
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Different Than (Double, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A != number
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpneisf3	jumpto, number

	.if	(\number&0xFF000000)
	; Compare exponents
	cmp	%r3,	#(\number>>24)&0xFF
	jzc	\jumpto
	; remark that here we assume that number <> 0 !!
	; Compare Mantissa
	cmp	%r2,	#(\number>>16)&0xFF	; Compare AH BH
	jzc	\jumpto
	cmp	%r1,	#(\number>>8)&0xFF	; Compare AM BM
	jzc	\jumpto
	cmp	%r0,	#(\number&0xFF)	; Compare AL BL
	jzc	\jumpto
	.else
	move	%a,	%r3
	jzc	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Different Than Zero (Double)
	;
	; Version 5.0
	;
	; Jump Condition:	A != 0
	;			A: r3:r2:r1:r0
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpnezsf3	jumpto

	move	%a,	%r3
	jzc	\jumpto
	.endm


	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Float)
	;
	; Version 5.0
	;
	; Jump Condition:	A > B
	;			A: r3:r2:r1,  B: SP+0..+2
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgttqf3	jumpto

	.ifdef	SOFTLIB
	calls	cmptqf3
	.else
	call	cmptqf3
	.endif
	move	%a,	(%i3, 3)+
	cmp	%r0,	#0x01
	jeq	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater Than (Float, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A > number
	;			A: r3:r2:r1,  B: number
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgtitqf3	jumpto, number

	.if	(\number&0xFF0000)
	move	%a,	%r3
	.if	(\number&0x008000)
	jzs	\jumpto
	.else
	jzs	.L\@_end
	.endif
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	tstb	%r2,	#7
	.if	(\number&0x008000)
	; B < 0
	jzs	\jumpto
	.else
	jzc	.L\@_end
	.endif
	; Compare exponents
	cmp	%r3,	#(\number>>16)&0xFF
	jzc	.L\@_diff
	; Compare Mantissa (signs are equal)
	cmp	%r2,	#(\number>>8)&0xFF	; Compare AH BH
	jzc	.L\@_diff
	cmp	%r1,	#(\number&0xFF)		; Compare AL BL
	jzs	.L\@_end
.L\@_diff:
	; B<0 & c=1 => A>B, B>0 & c=1 => A<B
	; B<0 & c=0 => A<B, B>0 & c=0 => A>B
	.if	(\number&0x008000)
	; B < 0
	jcs	\jumpto
	.else
	jcc	\jumpto
	.endif
	.else
	move	%a,	%r3
	jzs	.L\@_end
	tstb	%r2,	#7
	jzs	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Float)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= B
	;			A: r3:r2:r1,  B: SP+0..+2
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgetqf3	jumpto

	.ifdef	SOFTLIB
	calls	cmptqf3
	.else
	call	cmptqf3
	.endif
	move	%a,	(%i3, 3)+
	cmpa	%r0,	#0x00
	jge	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Greater or Equal Than (Float, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A >= number
	;			A: r3:r2:r1
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpgeitqf3	jumpto, number

	.if	(\number&0xFF0000)
	move	%a,	%r3
	.if	(\number&0x008000)
	jzs	\jumpto
	.else
	jzs	.L\@_end
	.endif
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	tstb	%r2,	#7
	.if	(\number&0x008000)
	jzs	\jumpto
	.else
	jzc	.L\@_end
	.endif
	; Compare exponents
	cmp	%r3,	#(\number>>16)&0xFF
	jzc	.L\@_diff
	; Remark that here we assume the number <> 0 !!
	; Compare Mantissa (signs are equal)
	cmp	%r2,	#(\number>>8)&0xFF	; Compare AH BH
	jzc	.L\@_diff
	cmp	%r1,	#(\number&0xFF)		; Compare AL BL
	jzs	\jumpto
.L\@_diff:
	; B<0 & c=1 => A>B, B>0 & c=1 => A<B
	; B<0 & c=0 => A<B, B>0 & c=0 => A>B
	.if	(\number&0x008000)
	jcs	\jumpto
	.else
	jcc	\jumpto
	.endif
	.else
	move	%a,	%r3
	jzs	\jumpto
	tstb	%r2,	#7
	jzs	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than (Float)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= B
	;			A: r3:r2:r1,  B: SP+0..+2
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpletqf3	jumpto

	.ifdef	SOFTLIB
	calls	cmptqf3
	.else
	call	cmptqf3
	.endif
	move	%a,	(%i3, 3)+
	cmpa	%r0,	#0x00
	jle	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less or Equal Than (Float, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A <= number
	;			A: r3:r2:r1
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpleitqf3	jumpto, number

	.if	(\number&0xFF0000)
	move	%a,	%r3
	.if	(\number&0x008000)
	jzs	.L\@_end
	.else
	jzs	\jumpto
	.endif
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	tstb	%r2,	#7
	.if	(\number&0x008000)
	; B < 0
	jzs	.L\@_end
	.else
	; B >= 0
	jzc	\jumpto
	.endif
	; Compare exponents
	cmp	%r3,	#(\number>>16)&0xFF
	jzc	.L\@_diff
	; Compare Mantissa (signs are equal)
	cmp	%r2,	#(\number>>8)&0xFF	; Compare AH BH
	jzc	.L\@_diff
	cmp	%r1,	#(\number&0xFF)		; Compare AL BL
	jzs	\jumpto
.L\@_diff:
	; B<0 & c=1 => A>B, B>0 & c=1 => A<B
	; B<0 & c=0 => A<B, B>0 & c=0 => A>B
	.if	(\number&0x008000)
	jcc	\jumpto
	.else
	jcs	\jumpto
	.endif
	.else
	move	%a,	%r3
	jzs	\jumpto
	tstb	%r2,	#7
	jzc	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Float)
	;
	; Version 5.0
	;
	; Jump Condition:	A < B
	;			A: r3:r2:r1,  B: SP+0..+2
	; Date:   17-02-1997
	;=========================================================
	.macro	jmplttqf3	jumpto

	.ifdef	SOFTLIB
	calls	cmptqf3
	.else
	call	cmptqf3
	.endif
	move	%a,	(%i3, 3)+
	cmp	%r0,	#0xFF
	jeq	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Less Than (Float, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A < number
	;			A: r3:r2:r1
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpltitqf3	jumpto, number

	.if	(\number&0xFF0000)
	move	%a,	%r3
	.if	(\number&0x008000)
	jzs	.L\@_end
	.else
	jzs	\jumpto
	.endif
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	tstb	%r2,	#7
	.if	(\number&0x008000)
	; B < 0
	jzs	.L\@_end
	.else
	; B >= 0
	jzc	\jumpto
	.endif
	; Compare exponents
	cmp	%r3,	#(\number>>16)&0xFF
	jzc	.L\@_diff
	; Compare Mantissa (signs are equal)
	cmp	%r2,	#(\number>>8)&0xFF	; Compare AH BH
	jzc	.L\@_diff
	cmp	%r1,	#(\number&0xFF)	; Compare AL BL
	jzs	.L\@_end
.L\@_diff:
	; B<0 & c=1 => A>B, B>0 & c=1 => A<B
	; B<0 & c=0 => A<B, B>0 & c=0 => A>B
	.if	(\number&0x008000)
	jcc	\jumpto
	.else
	jcs	\jumpto
	.endif
	.else
	move	%a,	%r3
	jzs	.L\@_end
	tstb	%r2,	#7
	jzc	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To (Float)
	;
	; Version 5.0
	;
	; Jump Condition:	A = B
	;			A: r3:r2:r1,  B: SP+0..+2
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpeqtqf3	jumpto

	.ifdef	SOFTLIB
	calls	cmptqf3
	.else
	call	cmptqf3
	.endif
	move	%a,	(%i3, 3)+
	move	%a,	%r0
	jzs	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Equal To (Float, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A = number
	;			A: r3:r2:r1
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpeqitqf3	jumpto, number

	.if	(\number&0xFF0000)
	; Compare exponents
	cmp	%r3,	#(\number>>16)&0xFF
	jzc	.L\@_end
	; Compare Mantissa
	cmp	%r2,	#(\number>>8)&0xFF	; Compare AH BH
	jzc	.L\@_end
	cmp	%r1,	#(\number&0xFF)	; Compare AL BL
	jzs	\jumpto
	.else
	move	%a,	%r3
	jzs	\jumpto
	.endif
.L\@_end:
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Different Than (Float)
	;
	; Version 5.0
	;
	; Jump Condition:	A != B
	;			A: r3:r2:r1,  B: SP+0..+3
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpnetqf3	jumpto

	.ifdef	SOFTLIB
	calls	cmptqf3
	.else
	call	cmptqf3
	.endif
	move	%a,	(%i3, 3)+
	move	%a,	%r0
	jzc	\jumpto
	.endm

	;=========================================================
	; Coolrisc 816  Subroutine
	; Jump if Different Than (Float, immediate value)
	;
	; Version 5.0
	;
	; Jump Condition:	A != number
	;			A: r3:r2:r1
	; Date:   17-02-1997
	;=========================================================
	.macro	jmpneitqf3	jumpto, number

	.if	(\number&0xFF0000)
	; Compare exponents
	cmp	%r3,	#(\number>>16)&0xFF
	jzc	\jumpto
	; remark that here we assume that number <> 0 !!
	; Compare Mantissa
	cmp	%r2,	#(\number>>8)&0xFF	; Compare AH BH
	jzc	\jumpto
	cmp	%r1,	#(\number&0xFF)		; Compare AL BL
	jzc	\jumpto
	.else
	move	%a,	%r3
	jzc	\jumpto
	.endif
.L\@_end:
	.endm

	
	.list
