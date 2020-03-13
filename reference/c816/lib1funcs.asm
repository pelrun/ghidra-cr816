;;; libgcc1 support routines for CoolRISC 816

	.altregsyn	0
	.set	bias, 0x80
#ifdef Laddsf3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Floating Point Addition (32 bits)
	;
	;Version 5.2
	; Function:	Aexp:AH:AM:AL + Bexp:BH:BM:BL
	;		A: r3:r2:r1:r0  B: SP+0..+3
	; Result:	r3:r2:r1:r0
	; Date:		19-02-1997
	;=========================================================
	.global addsf3

addsf3:		; .proc r3, r2, r1, r0, sp(0..+3)

	;save some registers we may need them later
	move	-(i3),	i0l
	move	-(i3),	i0h
	; Compare exponents
	cmp	r3,	(i3, 0x02)
	jle	.L_addsf3_e1lte2
	; Swap if exp1 > exp2 (smaller float in registers)
	move	a,	(i3, 0x05)
	move	(i3, 0x05), r0
	move	r0,	a
	move	a,	(i3, 0x04)
	move	(i3, 0x04), r1
	move	r1,	a
	move	a,	(i3, 0x03)
	move	(i3, 0x03), r2
	move	r2,	a
	move	a,	(i3, 0x02)
	move	(i3, 0x02), r3
	move	r3,	a
	; test exp1 = 0 (float1 = 0 => result is float2)
	; (if float2 = 0 => float1 = 0 because exp1 <= exp2)
.L_addsf3_e1lte2:
	move	a,	r3
	jzs	.L_addsf3_rest2
	; get mantissa1 shift adjust  ( = exp2 - exp1)
	subd	r3,	(i3, 0x02)
	; test float2 >> float1
	cmp	r3,	#0x18
	jge	.L_addsf3_rest2
	;comapre sign ,save float1 sign,mantissa1 MSB explicit
	
	move	a,	(i3, 0x03)
	xor	i0h,	a,	r2
	setb	r2,	#7
	;test if exp1=exp2 
	move	a,	r3
	jzs	.L_addsf3_aligned
;; if exponent difference is one and signs are different
; special treatment to avoid loosing precision
	cmp	r3,	#0x01
	jne	.L_addsf3_diff_not_one
	tstb	i0h,	#7
	jzs	.L_addsf3_diff_not_one
	move	a,	(i3, 0x03)
	tstb	a,	#6
	jzs	.L_addsf3_diff_exp_1
;;
.L_addsf3_diff_not_one:
	; if adjust > 7 bits, use moves
	cmp	r3,	#0x08
	jlt	.L_addsf3_shr_bit
.L_addsf3_shr_byte:
	cpl2	r3,	a		; -(8 - r3)
	move	i0l,	r0		; save value for rounding
	move r0,r1     ;shifted right by 8  bits move 
	move r1,r2
	move	r2,	#0x00
	; check if aligned (cpl2 0 => c=1)
	jcs	.L_addsf3_round
	cmp	r3,	#0x08		; check if adjust still > 7
	jge	.L_addsf3_shr_byte
	; Adjust bit by bit
.L_addsf3_shr_bit:
	shr	r2			; no->shift bit
	shrc	r1
	shrc	r0
	shrc	i0l			; for rounding
	dec	r3			; decrement num of shifts
	jzc	.L_addsf3_shr_bit
	; Round result (inc if last bit shifted is 1)
.L_addsf3_round:
	shl	i0l			; get last bit shifted
	incc	r0			; round
	
	incc r1
	incc r2
.L_addsf3_aligned:
	; Restore result exponent
	move	r3,	(i3, 0x02)
	; Check if signs are equal
	tstb	i0h,	#7
	jzc	.L_addsf3_opp_sign
	; add mantissa (same sign)
	add	r0,	(i3, 0x05)
	addc	r1,	(i3, 0x04)
	move	i0l,	(i3, 0x03)	; place sign in i0l
	setb	a,	#7		; make MSB explicit
	addc	r2,	a
	; if c = 1 then shift mantissa and inc exponent
	jcc	.L_addsf3_fix_sign
	shrc	r2
	shrc	r1
	shrc	r0
	inc	r3
	; check for exponent overflow
	jzc	.L_addsf3_fix_sign
.L_addsf3_OV:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x53		; load error code (float OV)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x53		; load error code (float OV)
	call	matherr
	.endif
	.else
	move	r3,	#0xFF
;;
	move	r0,	#0x00
	move	r1,	#0x00
	move	r2,	#0x80
	and	r2,	i0l		; set sign
;;
;;	move	r0,	#0xFF
;;	move	r1,	#0xFF
;;	move	r2,	#0x7F
;;	or	r2,	i0l		; set sign
	.endif
	jump	.L_addsf3_end

	; if opposite sign => do mantissa2 - mantissa1
.L_addsf3_opp_sign:
	cpl2	r0			; - mantissa1
	cpl2c	r1
	cpl2c	r2
	add	r0,	(i3, 0x05)	; add mantissa
	addc	r1,	(i3, 0x04)
	move	i0l,	(i3, 0x03)
	setb	a,	#7		; make MSB explicit
	addc	r2,	a
	; if c = 0 then change sign of result
	; (work with virtual 25 bits cpl2 mantissa !
	;  mantissa1[25] = 1, mantissa2[25] = 0
	;  c = 0 => result[25] = 1 => negative result )
	jcs	.L_addsf3_norm
	invb	i0l,	#7
	cpl2	r0
	cpl2c	r1
	cpl2c	r2
	; normalize to IEEE754
.L_addsf3_norm:
	; if high byte = 0, shift 8 bits (decrement exp by 8)
	jzc	.L_addsf3_norm_bit
	subs	r3,	#0x08
	jcc	.L_addsf3_UN		; check for underflow
	jzs	.L_addsf3_UN
	move	r2,	r1
	; if r1 is also 0, shift another 8 bits
	jzc	.L_addsf3_norm_byte
	subs	r3,	#0x08
	jcc	.L_addsf3_UN
	jzs	.L_addsf3_UN
	move	r2,	r0
	; check if result is 0
	jzs	.L_addsf3_zero
.L_addsf3_norm_r0:
	move	r0,	#0x00
	; normalise bit by bit, until MSB is 1
.L_addsf3_norm_bit:
	tstb	r2,	#7
	jzc	.L_addsf3_fix_sign
	shl	r0
	shlc	r1
	shlc	r2
	dec	r3
	; check exponent underflow
	jzc	.L_addsf3_norm_bit
.L_addsf3_UN:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x54		; load error code
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x54		; load error code
	call	matherr
	.endif
	jump	.L_addsf3_end
	.endif

	; return 0 has result
.L_addsf3_zero:
	move	r3,	#0x00
	move	r2,	#0x00
	move	r1,	#0x00
	move	r0,	#0x00
	jump	.L_addsf3_end

.L_addsf3_norm_byte:
	move	r1,	r0
	jump	.L_addsf3_norm_r0

.L_addsf3_rest2:
	move	r3,	(i3, 0x02)
	jzs	.L_addsf3_zero
	move	r2,	(i3, 0x03)
	move	r1,	(i3, 0x04)
	move	r0,	(i3, 0x05)
	jump	.L_addsf3_end

	; set the result sign
	; (r2[7] = 1, => force to 0 if result >= 0)
.L_addsf3_fix_sign:
	or	i0l,	#0x7F
	and	r2,	i0l
	; restore saved registers
.L_addsf3_end:
	move	i0h,	(i3)+
	move	i0l,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

;;
.L_addsf3_diff_exp_1:
	; if opposite sign and exp1 - exp2 = 1 :
	shl	r3,	(i3, 0x05)	; shift mantissa2 left
	shlc	i0l,	(i3, 0x04)
	shlc	i0h,	(i3, 0x03)
	cpl2	r0			; - mantissa1
	cpl2c	r1
	cpl2c	r2
	add	r0,	r3		; add mantissa
	addc	r1,	i0l
	addc	r2,	i0h
	dec	r3,	(i3, 0x02)	; decrement exponent
	move	i0l,	(i3, 0x03)	; place sign in i0l
	move	a,	r2
	jump	.L_addsf3_norm
;;
#endif /*Laddsf3*/

#ifdef Laddtqf3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Floating Point Addition (24 bits)
	;
	; Version 5.2
	;
	; Function: Aexp:AH:AL + Bexp:BH:BL
	;           A: r3:r2:r1  B: SP+0..+2
	; Result:   r3:r2:r1
	; Date:	   19-02-1997
	;=========================================================
	.global addtqf3

addtqf3:	; .proc r3, r2, r1, sp(+0..+2)

	; save some registers
	move	-(i3),	i0h
	; Compare exponents
	cmp	r3,	(i3, 0x01)
	jle	.L_addtqf3_e1lte2
	; Swap if exp1 > exp2 (smaller float in registers)
	move	a,	(i3, 0x03)
	move	(i3, 0x03), r1
	move	r1, a
	move	a,	(i3, 0x02)
	move	(i3, 0x02), r2
	move	r2,	a
	move	a,	(i3, 0x01)
	move	(i3, 0x01), r3
	move	r3,	a
	; test exp1 = 0 (float1 = 0 => result is float2)
	; (if float2 = 0 => float1 = 0 because exp1 <= exp2)
.L_addtqf3_e1lte2:
	move	a,	r3
	jzs	.L_addtqf3_rest2
	; get mantissa1 shift adjust  ( = exp2 - exp1)
	subd	r3,	(i3, 0x01)
	; test float2 >> float1
	cmp	r3,	#0x10
	jge	.L_addtqf3_rest2
	; compare sign, save float1 sign, mantissa1 MSB explicit
	move	a,	(i3, 0x02)
	xor	i0h,	a,	r2
	setb	r2,	#7
	; test if exp1 = exp2
	move	a,	r3
	jzs	.L_addtqf3_aligned
;; if exponent difference is one and signs are different
; special treatment to avoid loosing precision
	cmp	r3,	#0x01
	jne	.L_addtqf3_diff_not_one
	tstb	i0h,	#7
	jzs	.L_addtqf3_diff_not_one
	move	a,	(i3, 0x02)
	tstb	a,	#6
	jzs	.L_addtqf3_diff_exp_1
;
.L_addtqf3_diff_not_one:
	; if adjust > 7 bits, use moves
	cmp	r3,	#0x08
	jlt	.L_addtqf3_shr_bit
;;
.L_addtqf3_shr_byte:
	cpl2	r3,	a		; -(8 - r3)
	move	r0,	r1		; save value for rounding
	move	r1,	r2		; shift right 8 bits by move
	move	r2,	#0x00
	; check if aligned (cpl2 0 => c=1)
	jcs	.L_addtqf3_round
	cmp	r3,	#0x08		; check if adjust still > 7
	jge	.L_addtqf3_shr_byte
	; Adjust bit by bit
.L_addtqf3_shr_bit:
	shr	r2			; no->shift bit
	shrc	r1
	shrc	r0			; for rounding
	dec	r3			; decrement num of shifts
	jzc	.L_addtqf3_shr_bit
	; Round result (inc if last bit shifted is 1)
.L_addtqf3_round:
	shl	r0			; get last bit shifted
	incc	r1			; round
	incc	r2
.L_addtqf3_aligned:
	; Restore result exponent
	move	r3,	(i3, 0x01)
	; Check if signs are equal
	tstb	i0h,	#7
	jzc	.L_addtqf3_opp_sign
	; add mantissa (same sign)
	add	r1,	(i3, 0x03)
	move	r0,	(i3, 0x02)	; place sign in r0
	setb	a,	#7		; make MSB explicit
	addc	r2,	a
	; if c = 1 then shift mantissa and inc exponent
	jcc	.L_addtqf3_fix_sign
	shrc	r2
	shrc	r1
	inc	r3
	; check for exponent overflow
	jzc	.L_addtqf3_fix_sign
.L_addtqf3_OV:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x43		; load error code (float OV)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x43		; load error code (float OV)
	call	matherr
	.endif
	.else
	move	r3,	#0xFF
;;
	move	r1,	#0x00
	move	r2,	#0x80
	and	r2,	r0		; set sign
;;
;;	move	r1,	#0xFF
;;	move	r2,	#0x7F
;;	or	r2,	r0		; set sign
	.endif
	jump	.L_addtqf3_end

	; if opposite sign => do mantissa2 - mantissa1
.L_addtqf3_opp_sign:
	cpl2	r1			; - mantissa1
	cpl2c	r2
	add	r1,	(i3, 0x03)	; add mantissa
	move	r0,	(i3, 0x02)
	setb	a,	#7		; make MSB explicit
	addc	r2,	a
	; if c = 0 then change sign of result
	; (work with virtual 17 bits cpl2 mantissa !
	;  mantissa1[17] = 1, mantissa2[17] = 0
	;  c = 0 => result[17] = 1 => negative result )
	jcs	.L_addtqf3_norm
	invb	r0,	#7
	cpl2	r1
	cpl2c	r2
	; normalize to IEEE754
.L_addtqf3_norm:
	; if high byte = 0, shift 8 bits (decrement exp by 8)
	jzc	.L_addtqf3_norm_bit
	subs	r3,	#0x08
	jcc	.L_addtqf3_UN		; check for underflow
	jzs	.L_addtqf3_UN
	move	r2,	r1
	; check if result is 0
	jzs	.L_addtqf3_zero
	move	r1,	#0x00
	; normalise bit by bit, until MSB is 1
.L_addtqf3_norm_bit:
	tstb	r2,	#7
	jzc	.L_addtqf3_fix_sign
	shl	r1
	shlc	r2
	dec	r3
	; check exponent underflow
	jzc	.L_addtqf3_norm_bit
.L_addtqf3_UN:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x44		; load error code
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x44		; load error code
	call	matherr
	.endif
	jump	.L_addtqf3_end
	.endif

	; return 0 has result
.L_addtqf3_zero:
	move	r3,	#0x00
	move	r2,	#0x00
	move	r1,	#0x00
	jump	.L_addtqf3_end

.L_addtqf3_rest2:
	move	r3,	(i3, 0x01)
	jzs	.L_addtqf3_zero		; used by  0 - 0  !
	move	r2,	(i3, 0x02)
	move	r1,	(i3, 0x03)
	jump	.L_addtqf3_end

	; set the result sign
	; (r2[7] = 1, => force to 0 if result >= 0)
.L_addtqf3_fix_sign:
	or	r0,	#0x7F
	and	r2,	r0
	; restore saved registers
.L_addtqf3_end:
	move	i0h,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

;;
.L_addtqf3_diff_exp_1:
	; if opposite sign and exp1 - exp2 = 1 :
	shl	r3,	(i3, 0x03)	; shift mantissa2 left
	shlc	r0,	(i3, 0x02)
	cpl2	r1			; - mantissa1
	cpl2c	r2
	add	r1,	r3		; add mantissa
	addc	r2,	r0
	dec	r3,	(i3, 0x01)	; decrement exponent
	move	r0,	(i3, 0x02)	; place sign in r0
	move	a,	r2
	jump	.L_addtqf3_norm
;;
#endif /*Laddtqf3*/

#ifdef Lcmphi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Integer Comparison
	;
	; Version 5.0
	;
	; Function:	Cmp (A , B)
	;		A: r1:r0 ,  B: r3, r2
	; Result:	r0 ( 0 if = , 1 if > , -1 if < )
	; Date:		07-02-1997
	;=========================================================
	.global cmphi3

cmphi3:		; .proc r3 , r2 , r1 , r0

	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	xor	a,	r3,	r1
	tstb	a,	#7
	jzc	.L_cmphi3_diffs		; Signs are different
	cmp	r1,	r3		; Compare AH BH
	jzc	.L_cmphi3_diff
	subd	r0,	r2		; Compare AL BL
	jzc	.L_cmphi3_diff
	; A = B, return 0
.L_cmphi3_equal:
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	; A <> B
.L_cmphi3_diffs:
	shl	a,	r1
.L_cmphi3_diff:
	jcs	.L_cmphi3_asmall
	; A > B, return 1
	move	r0,	#0x01
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	; A < B, return -1
.L_cmphi3_asmall:
	move	r0,	#0xFF
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lcmphi3*/

#ifdef Lcmpsf3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Floating Point Comparison (32 bits)
	;
	; Version 5.0
	;
	; Function:	Cmp (A , B)
	;		A: r3:r2:r1:r0 ,  B: SP+0..+3
	; Result:	r0 ( 0 if = , 1 if > , -1 if < )
	; Date:		07-02-1997
	;=========================================================
	.global cmpsf3

cmpsf3:		; .proc r3 , r2 , r1 , r0 , sp(0..+3)

	move	a,	r3
	jzs	.L_cmpsf3_a0
	move	a,	(i3, 0)
	jzs	.L_cmpsf3_b0
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	move	a,	(i3, 1)
	xor	a,	r2
	tstb	a,	#7
	jzc	.L_cmpsf3_diffs		; Signs are different
	; Compare exponents
	cmp	r3,	(i3, 0)
	jzc	.L_cmpsf3_diff
	; Compare Mantissa (signs are equal)
	cmp	r2,	(i3, 1)		; Compare AH BH
	jzc	.L_cmpsf3_diff
	cmp	r1,	(i3, 2)		; Compare AM BM
	jzc	.L_cmpsf3_diff
	cmp	r0,	(i3, 3)		; Compare AL BL
	jzc	.L_cmpsf3_diff
	; A = B, return 0
.L_cmpsf3_equal:
	move	r0,	#0x00
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	; A <> B
.L_cmpsf3_diff:
	shrc	a			; Get c (c=1 => |A| < |B|)
.L_cmpsf3_diffs:
	; if diff. signs: B<0 => A>B  (a is 80, => tstb not sign B)
	; if diff. exp/mant.: B<0 & c=1 => A>B, B>0 & c=1 => A<B
	;                     B<0 & c=0 => A<B, B>0 & c=0 => A>B
	xor	a,	(i3, 1)
	tstb	a,	#7
	jzc	.L_cmpsf3_asmall
	; A > B, return 1
.L_cmpsf3_agreat:
	move	r0,	#0x01
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_cmpsf3_a0:
	move	a,	(i3, 0)
	jzs	.L_cmpsf3_equal
	shl	a,	(i3, 1)
	jcs	.L_cmpsf3_agreat
	; A < B, return -1
.L_cmpsf3_asmall:
	move	r0,	#0xFF
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_cmpsf3_b0:
	shl	a,	r2
	jcc	.L_cmpsf3_agreat
	jump	.L_cmpsf3_asmall
#endif /*Lcmpsf3*/

#ifdef Lcmpsi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Long Comparison
	;
	; Version 5.0
	;
	; Function:	Cmp (A , B)
	;		A: r3:r2:r1:r0 ,  B: SP+0..+3
	; Result:	r0 ( 0 if = , 1 if > , -1 if < )
	; Date:		07-02-1997
	;=========================================================
	.global cmpsi3

cmpsi3:		; .proc r3 , r2 , r1 , r0 , sp(0..+3)

	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	move	a,	(i3, 0)
	xor	a,	r3
	tstb	a,	#7
	jzc	.L_cmpsi3_diffs		; Signs are different
	cmp	r3,	(i3, 0)		; Compare A3 B3
	jzc	.L_cmpsi3_diff
	cmp	r2,	(i3, 1)		; Compare A2 B2
	jzc	.L_cmpsi3_diff
	cmp	r1,	(i3, 2)		; Compare A1 B1
	jzc	.L_cmpsi3_diff
	subd	r0,	(i3, 3)		; Compare A0 B0
	jzc	.L_cmpsi3_diff
	; A = B, return 0
.L_cmpsi3_end:
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	; A <> B
.L_cmpsi3_diffs:
	shl	a,	r3
.L_cmpsi3_diff:
	jcs	.L_cmpsi3_asmall
	; A > B, return 1
	move	r0,	#0x01
	jump	.L_cmpsi3_end

	; A < B, return -1
.L_cmpsi3_asmall:
	move	r0,	#0xFF
	jump	.L_cmpsi3_end
#endif /*Lcmpsi3*/

#ifdef Lcmptqf3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Floating Point Comparison (24 bits)
	;
	; Version 5.0
	;
	; Function:	Cmp (A , B)
	;		A: r3:r2:r1 ,  B: SP+0..+2
	; Result:	r0 ( 0 if = , 1 if > , -1 if < )
	; Date:		07-02-1997
	;=========================================================
	.global cmptqf3

cmptqf3:	; .proc r3 , r2 , r1 , sp(0..+2)

	move	a,	r3
	jzs	.L_cmptqf3_a0
	move	a,	(i3, 0)
	jzs	.L_cmptqf3_b0
	; Compare signs ( A<0 & B>=0 => A<B, A>=0 & B<0 => A>B )
	move	a,	(i3, 1)
	xor	a,	r2
	tstb	a,	#7
	jzc	.L_cmptqf3_diffs		; Signs are different
	; Compare exponents
	cmp	r3,	(i3, 0)
	jzc	.L_cmptqf3_diff
	; Compare Mantissa (signs are equal)
	cmp	r2,	(i3, 1)		; Compare AH BH
	jzc	.L_cmptqf3_diff
	cmp	r1,	(i3, 2)		; Compare AL BL
	jzc	.L_cmptqf3_diff
	; A = B, return 0
.L_cmptqf3_equal:
	move	r0,	#0x00
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	; A <> B
.L_cmptqf3_diff:
	shrc	a			; Get c (c=1 => |A| < |B|)
.L_cmptqf3_diffs:
	; if diff. signs: B<0 => A>B  (a is 80, => tstb not sign B)
	; if diff. exp/mant.: B<0 & c=1 => A>B, B>0 & c=1 => A<B
	;                     B<0 & c=0 => A<B, B>0 & c=0 => A>B
	xor	a,	(i3, 1)
	tstb	a,	#7
	jzc	.L_cmptqf3_asmall
	; A > B, return 1
.L_cmptqf3_agreat:
	move	r0,	#0x01
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_cmptqf3_a0:
	move	a,	(i3, 0)
	jzs	.L_cmptqf3_equal
	shl	a,	(i3, 1)
	jcs	.L_cmptqf3_agreat
	; A < B, return -1
.L_cmptqf3_asmall:
	move	r0,	#0xFF
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_cmptqf3_b0:
	shl	a,	r2
	jcc	.L_cmptqf3_agreat
	jump	.L_cmptqf3_asmall
#endif /*Lcmptqf3*/

#ifdef Lcmpunshi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Unsigned Integer Comparison
	;
	; Version 5.0
	;
	; Function:	Cmp (A , B)
	;		A: r1:r0 ,  B: r3, r2
	; Result:	r0 ( 0 if = , 1 if > , -1 if < )
	; Date:		07-02-1997
	;=========================================================
	.global cmpunshi3

cmpunshi3:	; .proc r3 , r2 , r1 , r0

	cmp	r1,	r3		; Compare AH BH
	jzc	.L_cmpunshi3_diff
	subd	r0,	r2		; Compare AL BL
	jzc	.L_cmpunshi3_diff
	; A = B, return 0
.L_cmpunshi3_equal:
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	; A <> B
.L_cmpunshi3_diff:
	jcs	.L_cmpunshi3_asmall
	; A > B, return 1
	move	r0,	#0x01
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	; A < B, return -1
.L_cmpunshi3_asmall:
	move	r0,	#0xFF
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lcmpunshi3*/

#ifdef Lcmpunssi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Unsigned Long Comparison
	;
	; Version 5.1
	;
	; Function:	Cmp (A , B)
	;		A: r3:r2:r1:r0 ,  B: SP+0..+3
	; Result:	r0 ( 0 if = , 1 if > , -1 if < )
	; Date:		19-02-1997
	;=========================================================
	.global cmpunssi3

cmpunssi3:	; .proc r3 , r2 , r1 , r0 , sp(+0..+3)

	cmp	r3,	(i3, 0)		; Compare A3 B3
	jzc	.L_cmpunssi3_diff
	cmp	r2,	(i3, 1)		; Compare A2 B2
	jzc	.L_cmpunssi3_diff
	cmp	r1,	(i3, 2)		; Compare A1 B1
	jzc	.L_cmpunssi3_diff
	subd	r0,	(i3, 3)		; Compare A0 B0
	jzc	.L_cmpunssi3_diff
	; A = B, return 0
.L_cmpunssi3_end:
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	; A <> B
.L_cmpunssi3_diff:
	jcs	.L_cmpunssi3_asmall
	; A > B, return 1
	move	r0,	#0x01
	jump	.L_cmpunssi3_end

	; A < B, return -1
.L_cmpunssi3_asmall:
	move	r0,	#0xFF
	jump	.L_cmpunssi3_end
#endif /*Lcmpunssi3*/

#ifdef Ldivmodhi4
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Integer Division
	;
	; Version 5.1
	;
	; Function:	AH:AL / BH:BL
	;		A: r1:r0,	  B: SP(+0..+1)
	; Result:	quotien:	r1:r0
	;		remainder:	r3:r2
	; Date:		19-02-1997
	;=========================================================
	.global divmodhi4

divmodhi4:	; .proc r1, r0, sp(+0..+1)

	move	-(i3),	i0h
	; Take ABS of B and test if B = 0
	cpl2	r2,	(i3, 2)
	move	r3,	(i3, 1)
	cpl2c	i0h,	r3
	jcs	.L_divmodhi4_DZ		; c = 1 => B = 0
	tstb	r3,	#7
	jzs	.L_divmodhi4_Bpos
	move	(i3, 2), r2
	move	(i3, 1), i0h
.L_divmodhi4_Bpos:
	; Generate sign
	xor	r3,	r1
	; Save signs
	move	-(i3),	r3
	move	-(i3),	r1
	; Take ABS of A
	tstb	r1,	#7
	jzs	.L_divmodhi4_Apos
	cpl2	r0
	cpl2c	r1
.L_divmodhi4_Apos:
	; Init remainder
	move	r2,	#0x00
	move	r3,	#0x00
	; Init Loop Counter (bits 15..0)
	move	i0h,	#0x0F
.L_divmodhi4_loop:
	shl	r0			; Shift Quotien
	shlc	r1
	shlc	r2			; Shift Remainder
	shlc	r3
	subs	r2,	(i3, 0x4)	; Compare
	subsc	r3,	(i3, 0x3)
	jcs	.L_divmodhi4_incres
.L_divmodhi4_noinc:
	dec	i0h			; Dec counter
	jcc	.L_divmodhi4_restor
	shl	r0			; Shift Quotien
	shlc	r1
	shlc	r2			; Shift Remainder
	shlc	r3
	add	r2,	(i3, 0x4)	; Restore if <
	addc	r3,	(i3, 0x3)
	jcc	.L_divmodhi4_noinc
.L_divmodhi4_incres:
	setb	r0,	#0
	dec	i0h
	jcs	.L_divmodhi4_loop
	jump	.L_divmodhi4_done
.L_divmodhi4_restor:
	add	r2,	(i3, 0x4)	; Restore remainder
	addc	r3,	(i3, 0x3)
.L_divmodhi4_done:
	shl	a,	(i3)+		; Set remainder sign
	jcc	.L_divmodhi4_remstr
	cpl2	r2
	cpl2c	r3
.L_divmodhi4_remstr:
	shl	a,	(i3)+		; Set result sign
	jcc	.L_divmodhi4_chkOV
	cpl2	r0
	cpl2c	r1
.L_divmodhi4_end:
	move	i0h,	(i3)+		; Restore registers
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_divmodhi4_chkOV:
	tstb	r1,	#7		; check for minint
	jzs	.L_divmodhi4_end
	; only possible overflow is minlog DIV -1, remainder already 0
	.ifdef	error_routine
.L_divmodhi4_OV:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x23		; load error code (long OV)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x23		; load error code (long OV)
	call	matherr
	.endif
	jump	.L_divmodhi4_end
.L_divmodhi4_DZ:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x21		; load error code (long DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x21		; load error code (long DZ)
	call	matherr
	.endif
	jump	.L_divmodhi4_end
	.else
.L_divmodhi4_OV:
	move	r1,	#0x7F		; sat. to maxlong
	move	r0,	#0xFF
	jump	.L_divmodhi4_end
.L_divmodhi4_DZ:
	; Y tested to zero => becomes remainder = 0
	shl	a,	r1
	jcc	.L_divmodhi4_OV
	move	r1,	#0x80		; sat. to minlong
	move	r0,	#0x00
	jump	.L_divmodhi4_end
	.endif
#endif /*Ldivmodhi4*/

#ifdef Ldivmodqi4
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Char Division
	;
	; Version 5.0
	;
	; Function:	A / B
	;		A: r0,	  B: r1
	; Result:	quotien:	r0
	;		remainder:	r2
	; Date:		30-01-1997
	;=========================================================
	.global divmodqi4

divmodqi4:	; .proc r1, r0

	; Take ABS of B and test if B = 0
	move	r2,	r1
	jzs	.L_divmodqi4_DZ		; c = 1 => B = 0
	tstb	r1,	#7
	jzs	.L_divmodqi4_Bpos
	cpl2	r1
.L_divmodqi4_Bpos:
	; Generate sign
	xor	r2,	r0
	; Save signs
	move	-(i3),	r2
	move	-(i3),	r0
	; Take ABS of A
	tstb	r0,	#7
	jzs	.L_divmodqi4_Apos
	cpl2	r0
.L_divmodqi4_Apos:
	; Init remainder
	move	r2,	#0x00
	; Init Loop Counter (bits 7..0)
	move	r3,	#0x07
.L_divmodqi4_loop:
	shl	r0			; Shift Quotien
	shlc	r2			; Shift Remainder
	subs	r2,	r1		; Compare
	jcs	.L_divmodqi4_incres
.L_divmodqi4_noinc:
	dec	r3			; Dec counter
	jcc	.L_divmodqi4_restor
	shl	r0			; Shift Quotien
	shlc	r2			; Shift Remainder
	add	r2,	r1		; Restore if <
	jcc	.L_divmodqi4_noinc
.L_divmodqi4_incres:
	setb	r0,	#0
	dec	r3
	jcs	.L_divmodqi4_loop
	jump	.L_divmodqi4_done
.L_divmodqi4_restor:
	add	r2,	r1		; Restore remainder
.L_divmodqi4_done:
	shl	a,	(i3)+		; Set remainder sign
	jcc	.L_divmodqi4_remstr
	cpl2	r2
.L_divmodqi4_remstr:
	shl	a,	(i3)+		; Set result sign
	jcc	.L_divmodqi4_chkOV
	cpl2	r0
.L_divmodqi4_end:
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_divmodqi4_chkOV:
	tstb	r0,	#7		; check for minint
	jzs	.L_divmodqi4_end
	; only possible overflow is minlog DIV -1, remainder already 0
	.ifdef	error_routine
.L_divmodqi4_OV:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x13		; load error code (long OV)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	rets
	.else
	move	a,	#0x13		; load error code (long OV)
	call	matherr
	ret
	.endif
.L_divmodqi4_DZ:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x11		; load error code (long DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	rets
	.else
	move	a,	#0x11		; load error code (long DZ)
	call	matherr
	ret
	.endif
	.else
.L_divmodqi4_OV:
	move	r0,	#0x7F		; sat. to maxlong
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
.L_divmodqi4_DZ:
	; Y tested to zero => becomes remainder = 0
	shl	a,	r0
	jcc	.L_divmodqi4_OV
	move	r0,	#0x80		; sat. to minlong
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
	.endif
#endif /*Ldivmodqi4*/

#ifdef Ldivmodsi4
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Long Division
	;
	; Version 5.1
	;
	; Function:	AH1:AH2:AL1:AL2 / BH1:BH2:BL1:BL2
	;		A: r3:r2:r1:r0,	  B: SP(+0..+3)
	; Result:	quotien:	r3:r2:r1:r0
	;		remainder:	SP(+0..+3)
	; Date:		03-02-1997
	;=========================================================
	.global divmodsi4

divmodsi4:	; .proc r3, r2, r1, r0, sp(+0..+3)

	move	-(i3),	i0h
	move	-(i3),	i0l
	move	-(i3),	i1h
	move	-(i3),	i1l
	move	-(i3),	i2h
	; Take ABS of B and test if B = 0
	cpl2	i0l,	(i3, 8)
	cpl2c	i1h,	(i3, 7)
	cpl2c	i1l,	(i3, 6)
	move	i0h,	(i3, 5)
	cpl2c	i2h,	i0h
	jcs	.L_divmodsi4_DZ		; c = 1 => B = 0
	tstb	i0h,	#7
	jzs	.L_divmodsi4_Bpos
	move	(i3, 8), i0l
	move	(i3, 7), i1h
	move	(i3, 6), i1l
	move	(i3, 5), i2h
.L_divmodsi4_Bpos:
	; Generate sign
	xor	i0h,	r3
	; Save signs
	move	-(i3),	i0h
	move	-(i3),	r3
	; Take ABS of A
	tstb	r3,	#7
	jzs	.L_divmodsi4_Apos
	cpl2	r0
	cpl2c	r1
	cpl2c	r2
	cpl2c	r3
.L_divmodsi4_Apos:
	; Init remainder
	move	i0h,	#0x00
	move	i0l,	#0x00
	move	i1h,	#0x00
	move	i1l,	#0x00
	; Init Loop Counter (bits 31..0)
	move	i2h,	#0x1F
.L_divmodsi4_loop:
	shl	r0			; Shift Quotien
	shlc	r1
	shlc	r2
	shlc	r3
	shlc	i1l			; Shift Remainder
	shlc	i1h
	shlc	i0l
	shlc	i0h
	subs	i1l,	(i3, 0xA)	; Compare
	subsc	i1h,	(i3, 0x9)
	subsc	i0l,	(i3, 0x8)
	subsc	i0h,	(i3, 0x7)
	jcs	.L_divmodsi4_incres
.L_divmodsi4_noinc:
	dec	i2h			; Dec counter
	jcc	.L_divmodsi4_restor
	shl	r0			; Shift Quotien
	shlc	r1
	shlc	r2
	shlc	r3
	shlc	i1l			; Shift Remainder
	shlc	i1h
	shlc	i0l
	shlc	i0h
	add	i1l,	(i3, 0xA)	; Restore if <
	addc	i1h,	(i3, 0x9)
	addc	i0l,	(i3, 0x8)
	addc	i0h,	(i3, 0x7)
	jcc	.L_divmodsi4_noinc
.L_divmodsi4_incres:
	setb	r0,	#0
	dec	i2h
	jcs	.L_divmodsi4_loop
	jump	.L_divmodsi4_done
.L_divmodsi4_restor:
	add	i1l,	(i3, 0xA)	; Restore remainder
	addc	i1h,	(i3, 0x9)
	addc	i0l,	(i3, 0x8)
	addc	i0h,	(i3, 0x7)
.L_divmodsi4_done:
	shl	a,	(i3)+		; Set remainder sign
	jcc	.L_divmodsi4_remstr
	cpl2	i1l
	cpl2c	i1h
	cpl2c	i0l
	cpl2c	i0h
.L_divmodsi4_remstr:
	move	(i3, 9), i1l		; place remainder in stack
	move	(i3, 8), i1h
	move	(i3, 7), i0l
	move	(i3, 6), i0h
	shl	a,	(i3)+		; Set result sign
	jcc	.L_divmodsi4_chkOV
	cpl2	r0
	cpl2c	r1
	cpl2c	r2
	cpl2c	r3
.L_divmodsi4_end:
	move	i2h,	(i3)+		; Restore registers
	move	i1l,	(i3)+
	move	i1h,	(i3)+
	move	i0l,	(i3)+
	move	i0h,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_divmodsi4_chkOV:
	tstb	r3,	#7		; check for minint
	jzs	.L_divmodsi4_end
	; only possible overflow is minlog DIV -1, remainder already 0
	.ifdef	error_routine
.L_divmodsi4_OV:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x33		; load error code (long OV)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x33		; load error code (long OV)
	call	matherr
	.endif
	jump	.L_divmodsi4_end
.L_divmodsi4_DZ:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x31		; load error code (long DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x31		; load error code (long DZ)
	call	matherr
	.endif
	jump	.L_divmodsi4_end
	.else
.L_divmodsi4_OV:
	move	r3, 	#0x7F		; sat. to maxlong
	move	r2,	#0xFF
	move	r1,	#0xFF
	move	r0,	#0xFF
	jump	.L_divmodsi4_end
.L_divmodsi4_DZ:
	; Y tested to zero => becomes remainder = 0
	shl	a,	r3
	jcc	.L_divmodsi4_OV
	move	r3,	#0x80		; sat. to minlong
	move	r2,	#0x00
	move	r1,	#0x00
	move	r0,	#0x00
	jump	.L_divmodsi4_end
	.endif
#endif /*Ldivmodsi4*/

#ifdef Ldivsf3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Floating Point Division (32 bits)
	;
	; Version 5.2
	;
	; Function:	(Aexp:AH:AM:AL) / (Bexp:BH:BM:BL)
	;		A: r3:r2:r1:r0 ,  B: SP+0..3
	; Result:	r3:r2:r1:r0
	; Date:		19-02-1997
	;=========================================================
	.global divsf3

divsf3:		; .proc r3, r2, r1, r0, sp(+0..+3)

	move	-(i3),	i0h
	move	-(i3),	i0l
	move	-(i3),	i1h
	move	-(i3),	i1l
	; Generate sign
	move	i1h,	(i3, 5)
	xor	i1l,	r2,	i1h
	or	i1l,	#0x7F
	; Check div by 0
	move	a,	(i3, 4)		; load Bexp
	jzs	.L_divsf3_DZ		; if Bexp=0 division by 0 (OV)
	; Check A = 0
	move	a,	r3
	jzs	.L_divsf3_zero
	; set mantissa A < mantissa B
	move	i0h,	#0x00
	move	i0l,	#bias		; load bias for alignement
	setb	r2,	#7		; MSB of A explicit
	setb	i1h,	#7
	cmp	r2,	i1h
	jlt	.L_divsf3_expsub
	jzc	.L_divsf3_shifta
	cmp	r1,	(i3, 6)
	jlt	.L_divsf3_expsub
	jzc	.L_divsf3_shifta
	cmp	r0,	(i3, 7)
	jlt	.L_divsf3_expsub
	; if not shift right mantissa A
.L_divsf3_shifta:
	shr	r2
	shrc	r1
	shrc	r0
	shrc	i0h			; keep LSB
	inc	i0l			; inc bias (not exp to avoid OV)
	; substract exponents
.L_divsf3_expsub:
	subs	r3,	(i3, 4)		; Aexp-Bexp
	jcs	.L_divsf3_aegebe		; c=1 =>  Aexp >= Bexp
	add	r3,	i0l		; add bias
	jzs	.L_divsf3_UN
	jcs	.L_divsf3_initdiv
.L_divsf3_UN:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x54		; load error code (double UN)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x54		; load error code (double UN)
	call	matherr
	.endif
	jump	.L_divsf3_end
	.endif
.L_divsf3_zero:
	move	r3,	#0x00		; sat. to zero
	jump	.L_divsf3_end
.L_divsf3_aegebe:
	add	r3,	i0l		; add bias
	jcs	.L_divsf3_OV
.L_divsf3_initdiv:
	; Divide mantissa
	move	(i3, 5), i1h
	move	(i3, 4), i1l		; save sign
	move	i1h,	#0x00
	move	i1l,	#0x00
	move	i0l,	#0x17		; loop from 17 to 0 (24 bits)
.L_divsf3_mantdiv:
	shl	i1h
	shlc	i1l
	shlc	i0h
	shlc	r0
	shlc	r1
	shlc	r2
	jcs	.L_divsf3_submant
	subs	r0,	(i3, 7)
	subsc	r1,	(i3, 6)
	subsc	r2,	(i3, 5)
	jcs	.L_divsf3_incres
	add	r0,	(i3, 7)
	addc	r1,	(i3, 6)
	addc	r2,	(i3, 5)
	dec	i0l
	jcs	.L_divsf3_mantdiv
	jump	.L_divsf3_round
.L_divsf3_submant:
	subs	r0,	(i3, 7)
	subsc	r1,	(i3, 6)
	subsc	r2,	(i3, 5)
.L_divsf3_incres:
	setb	i1h,	#0
	dec	i0l
	jcs	.L_divsf3_mantdiv
.L_divsf3_round:
	shl	r0
	shlc	r1
	shlc	r2
	jcs	.L_divsf3_doround
	subs	r0,	(i3, 7)
	subsc	r1,	(i3, 6)
	subsc	r2,	(i3, 5)
.L_divsf3_doround:
	incc	r0, i1h
	incc	r1, i1l
	incc	r2, i0h
	; set sign
	and	r2,	(i3, 4)
.L_divsf3_end:
	move	i1l, (i3)+
	move	i1h, (i3)+
	move	i0l, (i3)+
	move	i0h, (i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	.ifdef	error_routine
.L_divsf3_DZ:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x51	; load error code (double DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x51	; load error code (double DZ)
	call	matherr
	.endif
	jump	.L_divsf3_end
.L_divsf3_OV:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x53	; load error code (double OV)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x53	; load error code (double OV)
	call	matherr
	.endif
	jump	.L_divsf3_end
	.else
.L_divsf3_DZ:
.L_divsf3_OV:
	move	r3,	#0xFF
	move	r2,	#0xFF
	move	r1,	#0xFF
	move	r0,	#0xFF
	and	r2,	i1l		; set sign
	jump	.L_divsf3_end
	.endif
#endif /*Ldivsf3*/

#ifdef Ldivtqf3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Floating Point Division (24 bits)
	;
	; Version 5.1
	;
	; Function:	(Aexp:AH:AL) / (Bexp:BH:BL)
	;		A: r3:r2:r1 ,  B: SP+0..+2
	; Result:	r3:r2:r1
	; Date:		03-02-1997
	;=========================================================
	.global divtqf3

divtqf3:	; .proc r3, r2, r1, sp(+0..+2)

	move	-(i3),	i0h
	move	-(i3),	i0l
	; Generate sign
	move	i0l,	(i3, 3)
	xor	i0h,	r2,	i0l
	or	i0h,	#0x7F
	; Check div by 0
	move	a,	(i3, 2)		; load Bexp
	jzs	.L_divtqf3_DZ		; if Bexp=0 division by 0 (OV)
	; Check A = 0
	move	a,	r3
	jzs	.L_divtqf3_zero
	; set mantissa A < mantissa B
	setb	r2,	#7		; MSB of A explicit
	setb	i0l,	#7
	move	(i3, 3), i0l
	move	i0l,	#bias		; load bias for alignement
	move	r0,	#0x00
	cmp	r2,	(i3, 3)
	jlt	.L_divtqf3_expsub
	jzc	.L_divtqf3_shifta
	cmp	r1,	(i3, 4)
	jlt	.L_divtqf3_expsub
	; if not shift right mantissa A
.L_divtqf3_shifta:
	shr	r2
	shrc	r1
	shrc	r0			; keep LSB
	inc	i0l			; inc bias (not exp to avoid OV)
	; substract exponents
.L_divtqf3_expsub:
	subs	r3,	(i3, 2)		; Aexp-Bexp
	jcs	.L_divtqf3_aegebe		; c=1 =>  Aexp >= Bexp
	add	r3,	i0l		; add bias
	jzs	.L_divtqf3_UN
	jcs	.L_divtqf3_initdiv
.L_divtqf3_UN:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x44		; load error code (float UN)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x44		; load error code (float UN)
	call	matherr
	.endif
	jump	.L_divtqf3_end
	.endif
.L_divtqf3_zero:
	move	r3,	#0x00		; sat. to zero
	jump	.L_divtqf3_end
.L_divtqf3_aegebe:
	add	r3,	i0l		; add bias
	jcs	.L_divtqf3_OV
.L_divtqf3_initdiv:
	; Divide mantissa
	move	(i3, 2), i0h		; save sign
	move	i0h,	#0x00
	move	i0l,	#0x0F		; loop from 15 to 0 (16 bits)
.L_divtqf3_mantdiv:
	shl	i0h
	shlc	r0
	shlc	r1
	shlc	r2
	jcs	.L_divtqf3_submant
	subs 	r1,	(i3, 4)
	subsc	r2,	(i3, 3)
	jcs	.L_divtqf3_incres
	add 	r1,	(i3, 4)
	addc	r2,	(i3, 3)
	dec	i0l
	jcs	.L_divtqf3_mantdiv
	jump	.L_divtqf3_round
.L_divtqf3_submant:
	subs 	r1,	(i3, 4)
	subsc	r2,	(i3, 3)
.L_divtqf3_incres:
	setb	i0h,	#0
	dec	i0l
	jcs	.L_divtqf3_mantdiv
.L_divtqf3_round:
	shl 	r1
	shlc	r2
	jcs	.L_divtqf3_doround
	subs 	r1,	(i3, 4)
	subsc	r2,	(i3, 3)
.L_divtqf3_doround:
	incc	r1,	i0h
	incc	r2,	r0
	; set sign
	and	r2,	(i3, 2)
.L_divtqf3_end:
	move	i0l,	(i3)+
	move	i0h,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	.ifdef	error_routine
.L_divtqf3_DZ:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x41	; load error code (float DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x41	; load error code (float DZ)
	call	matherr
	.endif
	jump	.L_divtqf3_end
.L_divtqf3_OV:
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x43	; load error code (float OV)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x43	; load error code (float OV)
	call	matherr
	.endif
	jump	.L_divtqf3_end
	.else
.L_divtqf3_DZ:
.L_divtqf3_OV:
	move	r3,	#0xFF
	move	r2,	#0xFF
	move	r1,	#0xFF
	and	r2,	i0h		; set sign
	jump	.L_divtqf3_end
	.endif
#endif /*Ldivtqf3*/

#ifdef Lfix_truncsfhi2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Double to Signed Integer Conversion
	;
	; Version 5.1
	;
	; Function:	Int(r3:r2:r1:r0)
	; Result:	r1:r0
	; Date:		11-02-1997
	;
	; Modified:	24-04-1997	Eliminated rounding
	;=========================================================
	.global	fix_truncsfhi2

fix_truncsfhi2:
	; check if 0
	move	a,	r3
	jzs	.L_fix_truncsfhi2_zero
	; If exponent < 0 => -1 << x << 1 => result = 0
	add	r3,	#bias
	jcc	.L_fix_truncsfhi2_zero
	jzs	.L_fix_truncsfhi2_zero  ; FRa sept 10 1997
	; save highbyte for sign
;;	move	-(i3),	r2
;; replaced by
	move	r0,	r2
;; end modif
	setb	r2,	#7		; make MSB explicit
	; If exponent > 16 => x > maxlong or x < minlong
	subd	r3,	#0x10
	jcc	.L_fix_truncsfhi2_OV
	; exp = 16  => no shift
	jzs	.L_fix_truncsfhi2_round
	cmp	r3,	#0x08
	jlt	.L_fix_truncsfhi2_shl1
	subs	r3,	#0x08
;;	move	r0,	r1
	move	r1,	r2
	move	r2,	#0x00
;; end
	move	a,	r3
	jzs	.L_fix_truncsfhi2_round
.L_fix_truncsfhi2_shl1:
	shr	r2			; shift one bit to the right
	shrc	r1
;;	shrc	r0
	dec	r3			; decrement exp
	jzc	.L_fix_truncsfhi2_shl1	; continue until exp = 0
.L_fix_truncsfhi2_round:
;;	shl	r0
;;	incc	r0,	r1
;;	incc	r1,	r2		; inc overflow not possible
	; set sign
;;	shl	a,	(i3)
;; replaced by (24-04-1997)
	shl	a,	r0
;; end modif
	jcc	.L_fix_truncsfhi2_pos
;;	cpl2	r0
;;	cpl2c	r1
;; replaced by (24-04_1997)
	cpl2	r1
	cpl2c	r2
;; end modif
.L_fix_truncsfhi2_pos:
	; check for overflow
;;	move	a,	r1
;;	xor	a,	(i3)+
;; replace by (24-04-1997)
	xor	a,	r2,	r0
;; end modif
	tstb	a,	#7
	jzc	.L_fix_truncsfhi2_max
;; added (24-04-1997)
	move	r0,	r1
	move	r1,	r2
;; end
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_fix_truncsfhi2_OV:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x23
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	rets
	.else
	move	a,	#0x23
	call	matherr
	ret
	.endif
	.else
;;	shl	a,	(i3)+		; test sign
;; replaced by (24-04-1997)
	shl	a,	r0
;; end modif
	jcc	.L_fix_truncsfhi2_max
	move	r1,	#0x80		; saturate to minint
	jump	.L_fix_truncsfhi2_zero2
.L_fix_truncsfhi2_max:
	move	r1,	#0x7F		; saturate to maxint
	move	r0,	#0xFF
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
	.endif

.L_fix_truncsfhi2_zero:
	move	r1,	#0x00
.L_fix_truncsfhi2_zero2:
	move	r0,	#0x00
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lfix_truncsfhi2*/

#ifdef Lfix_truncsfqi2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Double to Signed Char Conversion
	;
	; Version 5.1
	;
	; Function:	Char(r3:r2:r1:r0)
	; Result:	r0
	; Date:		11-02-1997
	;
	; Modified:	24-04-1997	remove rounding
	; Modified:	10-06-1997	remove saturation
	;=========================================================
	.global	fix_truncsfqi2

fix_truncsfqi2:
	; check if 0
;;	move	a,	r3
;; 	jzs	.L_fix_truncsfqi2_zero
	; If exponent < 0 => -1 << x << 1 => result = 0
	add	r3,	#bias
	jcc	.L_fix_truncsfqi2_zero
	jzs	.L_fix_truncsfqi2_zero  ; FRa sept 10 1997
	; save highbyte for sign
	move	-(i3),	i0l
	move	-(i3),	i0h
	move	i0h,	#0x00
	move	i0l,	r2
	setb	r2,	#7
	; If exponent > 8 => x > maxlong or x < minlong
;;	subd	r3,	#0x08
;;	jcc	.L_fix_truncsfqi2_OV
	; exp = 8  => no shift
;;	jzs	.L_fix_truncsfqi2_round
.L_fix_truncsfqi2_shl1:
	shl	r0			; shift one bit to the left
	shlc	r1
	shlc	r2
	shlc	i0h
	dec	r3			; decrement exp
	jzc	.L_fix_truncsfqi2_shl1	; continue until exp = 0
;;.L_fix_truncsfqi2_round:
;;	shl	r1
;;	incc	r0			; inc overflow not possible
	; set sign
	shl	a,	i0l
	jcc	.L_fix_truncsfqi2_pos
	cpl2	i0h
.L_fix_truncsfqi2_pos:
	; check for overflow
;;	xor	a,	r2,	r0
;;	tstb	a,	#7
;;	jzc	.L_fix_truncsfqi2_max
	move	r0,	i0h
	move	i0h,	(i3)+
	move	i0l,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

;;.L_fix_truncsfqi2_OV:
;;	.ifdef	error_routine
;;	move	a,	#0x13
;;	call	matherr
;;	ret
;;	.else
;;	shl	a,	r2		; test sign
;;	jcc	.L_fix_truncsfqi2_max
;;	move	r0,	#0x80		; saturate to minchar
;;	ret
;;.L_fix_truncsfqi2_max:
;;	move	r0,	#0x7F		; saturate to maxchar
;;	ret
;;	.endif

.L_fix_truncsfqi2_zero:
	move	r0,	#0x00
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lfix_truncsfqi2*/

#ifdef Lfix_truncsfsi2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Double to Signed Long Conversion
	;
	; Version 5.1
	;
	; Function:	Long(r3:r2:r1:r0)
	; Result:	r3:r2:r1:r0
	; Date:		11-02-1997
	;
	; Modified	24-04-1997	Eliminated rounding
	;=========================================================
	.global	fix_truncsfsi2

fix_truncsfsi2:
	move	-(i3),	i0h		; save i0h
;;	move	-(i3),	i0l		; save i0l
	; check if 0
	move	a,	r3
	jzs	.L_fix_truncsfsi2_zero
	; If exponent < 0 => -1 << x << 1 => result = 0
	add	r3,	#bias
	jcc	.L_fix_truncsfsi2_zero
	jzs	.L_fix_truncsfsi2_zero  ; FRa sept 10 1997
	; save highbyte for sign
	move	-(i3),	r2
	move	i0h,	#0x00
;;	move	i0l,	#0x00
	setb	r2,	#7		; make MSB explicit
	; If exponent > 32 => x > maxlong or x < minlong
	subd	r3,	#0x20
	jcc	.L_fix_truncsfsi2_OV
	; exp = 32  => no shift
	jzs	.L_fix_truncsfsi2_round
	cmp	r3,	#0x08
	jlt	.L_fix_truncsfsi2_shl1
	cmp	r3,	#0x10
	jlt	.L_fix_truncsfsi2_shl8
	cmp	r3,	#0x18
	jlt	.L_fix_truncsfsi2_shl16
	subs	r3,	#0x18
	move	i0h,	r2
;;	move	i0l,	r1
	move	r0,	#0x00
.L_fix_truncsfsi2_chk_exp2:
	move	r1,	#0x00
.L_fix_truncsfsi2_chk_exp1:
	move	r2,	#0x00
	move	a,	r3
	jzs	.L_fix_truncsfsi2_round
.L_fix_truncsfsi2_shl1:
	shr	r2			; shift one bit to the right
	shrc	r1
	shrc	r0
	shrc	i0h
;;	shrc	i0l			; extension for rounding
	dec	r3			; decrement exp
	jzc	.L_fix_truncsfsi2_shl1	; continue until exp = 0
.L_fix_truncsfsi2_round:
;;	shl	i0l
;;	incc	i0h
;;	incc	r0
;;	incc	r1
;;	incc	r2		; inc overflow not possible
	; set sign
	shl	a,	(i3)
	jcc	.L_fix_truncsfsi2_pos
	cpl2	i0h
	cpl2c	r0
	cpl2c	r1
	cpl2c	r2
.L_fix_truncsfsi2_pos:
	; check for overflow
	move	r3,	r2
	xor	a,	(i3)+
	tstb	a,	#7
	jzc	.L_fix_truncsfsi2_max
	move	r2,	r1
	move	r1,	r0
	move	r0,	i0h
.L_fix_truncsfsi2_end:
;;	move	i0l,	(i3)+
	move	i0h,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_fix_truncsfsi2_OV:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x33
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x33
	call	matherr
	.endif
	jump	.L_fix_truncsfsi2_end
	.else
	shl	a,	(i3)+		; test sign
	jcc	.L_fix_truncsfsi2_max
	move	r3,	#0x80		; saturate to minlong
	jump	.L_fix_truncsfsi2_zero2
.L_fix_truncsfsi2_max:
	move	r3,	#0x7F		; saturate to maxlong
	move	r2,	#0xFF
	move	r1,	#0xFF
	move	r0,	#0xFF
	jump	.L_fix_truncsfsi2_end
	.endif

.L_fix_truncsfsi2_zero:
	move	r3,	#0x00
.L_fix_truncsfsi2_zero2:
	move	r2,	#0x00
	move	r1,	#0x00
	move	r0,	#0x00
	jump	.L_fix_truncsfsi2_end

.L_fix_truncsfsi2_shl8:
	subs	r3,	#0x08
	move	i0h,	r0
	move	r0,	r1
	move	r1,	r2
	jump	.L_fix_truncsfsi2_chk_exp1

.L_fix_truncsfsi2_shl16:
	subs	r3,	#0x10
;;	move	i0l,	r0
	move	i0h,	r1
	move	r0,	r2
	jump	.L_fix_truncsfsi2_chk_exp2
#endif /*Lfix_truncsfsi2*/

#ifdef Lfixuns_truncsfhi2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Double to Unsigned Integer Conversion
	;
	; Version 5.1
	;
	; Function:	Int(r3:r2:r1:r0)
	; Result:	r1:r0
	; Date:		11-02-1997
	;=========================================================
	.global fixuns_truncsfhi2

fixuns_truncsfhi2:
	move	-(i3),	i0l		; save i0l

   move  i0l, #0x00
	; check for A < 0
	tstb	r2,	#7
	jzs	.L_fixuns_truncsfsi2_start
	; Mark as negativ value.
	move  i0l, #0x01

.L_fixuns_truncsfsi2_start:

	; check if 0
	move	a,	r3
	jzs	.L_fixuns_truncsfhi2_zero
	; If exponent < 0 => -1 << x << 1 => result = 0
	add	r3,	#bias
	jcc	.L_fixuns_truncsfhi2_zero
	jzs	.L_fixuns_truncsfhi2_zero ; FRa sept 10 1997
	setb	r2,	#7		; make MSB explicit
	; If exponent > 16 => x > maxlong or x < minlong
	subd	r3,	#0x10
	jcc	.L_fixuns_truncsfhi2_OV
	; exp = 16  => no shift
	jzs	.L_fixuns_truncsfhi2_round
	cmp	r3,	#0x08
	jlt	.L_fixuns_truncsfhi2_shl1
	subs	r3,	#0x08
;;	move	r0,	r1
	move	r1,	r2
	move	r2,	#0x00
	move	a,	r3
	jzs	.L_fixuns_truncsfhi2_round
.L_fixuns_truncsfhi2_shl1:
	shr	r2			; shift one bit to the right
	shrc	r1
;;	shrc	r0
	dec	r3			; decrement exp
	jzc	.L_fixuns_truncsfhi2_shl1	; continue until exp = 0
.L_fixuns_truncsfhi2_round:
;;	shl	r0
;;	incc	r0,	r1
;;	incc	r1,	r2		; inc overflow not possible
;; replaced by
	move	r0,	r1
	move	r1,	r2
	
   ; Two's complementation for negativ value.
   cmp   i0l, #0x01
   jne   .L_fixuns_truncsfhi2_end
   cpl2  r0
   cpl2c r1

;; end
.L_fixuns_truncsfhi2_end:
	move	i0l,	(i3)+

	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_fixuns_truncsfhi2_OV:
.ifdef	error_routine
 .ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x73
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
 .else
	move	a,	#0x73
	call	matherr
 .endif
   jump  .L_fixuns_truncsfhi2_end
.else
	move	r1,	#0xFF		; saturate to maxint
	move	r0,	#0xFF
   jump  .L_fixuns_truncsfhi2_end
.endif

.L_fixuns_truncsfhi2_zero:
	move	r1,	#0x00
	move	r0,	#0x00
   jump  .L_fixuns_truncsfhi2_end

#endif /*Lfixuns_truncsfhi2*/

#ifdef Lfixuns_truncsfqi2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Double to Unsigned Char Conversion
	;
	; Version 5.1
	;
	; Function:	Char(r3:r2:r1:r0)
	; Result:	r0
	; Date:		12-02-1997
	;
	; Modified	10-06-1997	Removed saturation
	;=========================================================
	.global fixuns_truncsfqi2

fixuns_truncsfqi2:
	move	-(i3),	i0l		; save i0l

   move  i0l, #0x00
	; check for A < 0
	tstb	r2,	#7
	jzs	.L_fixuns_truncsfqi2_start
	; Mark as negativ value.
	move  i0l, #0x01

.L_fixuns_truncsfqi2_start:
	; check if 0
;;	move	a,	r3
;;	jzs	.L_fixuns_truncsfqi2_zero
	; If exponent < 0 => -1 << x << 1 => result = 0
	add	r3,	#bias
	jcc	.L_fixuns_truncsfqi2_zero
	jzs	.L_fixuns_truncsfqi2_zero ; FRa sept 10 1997
	setb	r2,	#7		; make MSB explicit
	move	-(i3),	i0h
	move	i0h,	#0x00
	; If exponent > 8 => x > maxlong or x < minlong
;;	subd	r3,	#0x08
;;	jcc	.L_fixuns_truncsfqi2_OV
	; exp = 8  => no shift
;;	jzs	.L_fixuns_truncsfqi2_round
.L_fixuns_truncsfqi2_shl1:
	shl	r0			; shift one bit to the left
	shlc	r1
	shlc	r2
	shlc	i0h
	dec	r3			; decrement exp
	jzc	.L_fixuns_truncsfqi2_shl1	; continue until exp = 0
;;.L_fixuns_truncsfqi2_round:
;;	shl	r1
;;	incc	r0,	r2		; inc overflow not possible
;; replaced by
	move	r0,	i0h
	move	i0h,	(i3)+
	
   ; Two's complementation for negativ value.
   cmp   i0l, #0x01
   jne   .L_fixuns_truncsfqi2_end
   cpl2  r0

.L_fixuns_truncsfqi2_end:
	move	i0l,	(i3)+

;; end
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

;;.L_fixuns_truncsfqi2_OV:
;;	.ifdef	error_routine
;;	move	a,	#0x63
;;	call	matherr
;;	ret
;;	.else
;;	move	r0,	#0xFF		; saturate to maxchar
;;	ret
;;	.endif

.L_fixuns_truncsfqi2_zero:
	move	r0,	#0x00
	jump  .L_fixuns_truncsfqi2_end

#endif /*Lfixuns_truncsfqi2*/

#ifdef Lfixuns_truncsfsi2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Double to Unsigned Long Conversion
	;
	; Version 5.1
	;
	; Function:	Long(r3:r2:r1:r0)
	; Result:	r3:r2:r1:r0
	; Date:		11-02-1997
	;=========================================================
	.global fixuns_truncsfsi2

fixuns_truncsfsi2:
__fixunstqfsi:
	move	-(i3),	i0h		; save i0h
	move	-(i3),	i0l		; save i0l

   move  i0l, #0x00
	; check for A < 0
	tstb	r2,	#7
	jzs	.L_fixuns_truncsfsi2_start
	; Mark as negativ value.
	move  i0l, #0x01

.L_fixuns_truncsfsi2_start:
	; check if 0
	move	a,	r3
	jzs	.L_fixuns_truncsfsi2_zero
	; If exponent < 0 => -1 << x << 1 => result = 0
	add	r3,	#bias
	jcc	.L_fixuns_truncsfsi2_zero
	jzs	.L_fixuns_truncsfsi2_zero ; FRa sept 10 1997
	move	i0h,	#0x00
;;	move	i0l,	#0x00
	setb	r2,	#7		; make MSB explicit
	; If exponent > 32 => x > maxlong or x < minlong
	subd	r3,	#0x20
	jcc	.L_fixuns_truncsfsi2_OV
	; exp = 32  => no shift
	jzs	.L_fixuns_truncsfsi2_round
	cmp	r3,	#0x08
	jlt	.L_fixuns_truncsfsi2_shl1
	cmp	r3,	#0x10
	jlt	.L_fixuns_truncsfsi2_shl8
	cmp	r3,	#0x18
	jlt	.L_fixuns_truncsfsi2_shl16
	subs	r3,	#0x18
	move	i0h,	r2
;;	move	i0l,	r1
	move	r0,	#0x00
.L_fixuns_truncsfsi2_chk_exp2:
	move	r1,	#0x00
.L_fixuns_truncsfsi2_chk_exp1:
	move	r2,	#0x00
	move	a,	r3
	jzs	.L_fixuns_truncsfsi2_round
.L_fixuns_truncsfsi2_shl1:
	shr	r2			; shift one bit to the right
	shrc	r1
	shrc	r0
	shrc	i0h
;;	shrc	i0l			; extension for rounding
	dec	r3			; decrement exp
	jzc	.L_fixuns_truncsfsi2_shl1	; continue until exp = 0
.L_fixuns_truncsfsi2_round:
;;	shl	i0l
;;	incc	i0h
;;	incc	r0
;;	incc	r1
;;	incc	r3,	r2		; inc overflow not possible
;; replaced by
	move	r3,	r2
;; end
	move	r2,	r1
	move	r1,	r0
	move	r0,	i0h
   
   ; Two's complementation for negativ value.
   cmp   i0l, #0x01
   jne   .L_fixuns_truncsfsi2_end
   cpl2  r0
   cpl2c r1
   cpl2c r2
   cpl2c r3

.L_fixuns_truncsfsi2_end:
	move	i0l,	(i3)+
	move	i0h,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_fixuns_truncsfsi2_OV:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x83
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x83
	call	matherr
	.endif
	jump	.L_fixuns_truncsfsi2_end
	.else
	move	r3,	#0xFF		; saturate to maxlong
	move	r2,	#0xFF
	move	r1,	#0xFF
	move	r0,	#0xFF
	jump	.L_fixuns_truncsfsi2_end
	.endif

.L_fixuns_truncsfsi2_zero:
	move	r3,	#0x00
	move	r2,	#0x00
	move	r1,	#0x00
	move	r0,	#0x00
	jump	.L_fixuns_truncsfsi2_end

.L_fixuns_truncsfsi2_shl8:
	subs	r3,	#0x08
	move	i0h,	r0
	move	r0,	r1
	move	r1,	r2
	jump	.L_fixuns_truncsfsi2_chk_exp1

.L_fixuns_truncsfsi2_shl16:
	subs	r3,	#0x10
;;	move	i0l,	r0
	move	i0h,	r1
	move	r0,	r2
	jump	.L_fixuns_truncsfsi2_chk_exp2
#endif /*Lfixuns_truncsfsi2*/

#ifdef Lfloathisf2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Integer to Double Conversion
	;
	; Version 5.2
	;
	; Function:	Float(r2:r1)
	; Result:	r3:r2:r1:r0
	;
	; Signed if   a <> 0
	; Unsigned if a = 0
	;
	; Date:	10-02-1997
	;=========================================================
	.global floathisf2

floathisf2:	; .proc r2, r1

	move	r0,	a
	jzs	.L_floathisf2_pos
	; Save sign
	move	r0,	r2
	; ABS (mantissa is unsigned)
	tstb	r2,	#7
	jzs	.L_floathisf2_pos
	cpl2	r1
	cpl2c	r2
.L_floathisf2_pos:
	; Initialize exponent (at 16 + 1 because loop _sh_bit
	;                      always done at least 1)
	move	r3,	#bias+0x11
	; Check for 0 byte
	move	a,	r2
	jzc	.L_floathisf2_sh_bit	; MSB <> 0
	move	r2,	r1
	jzs	.L_floathisf2_zero	; Integer = 0
	; 3 high byte = 0, => . byte4 00 00 00 , and exp = 8 (+1)
	move	r3,	#bias+0x09
	move	r1,	#0x00
	; Shift mantissa left until carry is one
	; (=> implies exponent is dec one time too much)
.L_floathisf2_sh_bit:
	dec	r3
	shl	r1
	shlc	r2
	jcc	.L_floathisf2_sh_bit
	; Shift sign inside mantissa in place of MSB
	shl	a,	r0
	shrc	r2
	shrc	r1
	move	r0,	#0x00
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_floathisf2_zero:
	move	r3,	#0x00		; exp = 0
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lfloathisf2*/

#ifdef Lfloatqisf2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Char to Double Conversion
	;
	; Version 5.2
	;
	; Function:	Float(r0)
	; Result:	r3:r2:r1:r0
	;
	; Signed if a <> 0
	; Unsigned if a = 0
	;
	; Date:	10-02-1997
	;=========================================================
	.global floatqisf2

floatqisf2:	; .proc r2

	jzc	.L_floatqisf2_signed
	move	r2,	r0
	move	r0,	#0x00
	jump	.L_floatqisf2_pos
.L_floatqisf2_signed:
	; Save sign
	move	r2,	r0
	; ABS (mantissa is unsigned)
	tstb	r0,	#7
	jzs	.L_floatqisf2_pos
	cpl2	r2
.L_floatqisf2_pos:
	; Check for 0 byte
	move	a,	r2
	jzs	.L_floatqisf2_zero	; Integer = 0
	; Initialize exponent (at 8 + 1 because loop _sh_bit
	;                      always done at least 1)
	move	r3,	#bias+0x09
	; Shift mantissa left until carry is one
	; (=> implies exponent is dec one time too much)
.L_floatqisf2_sh_bit:
	dec	r3
	shl	r2
	jcc	.L_floatqisf2_sh_bit
	; Shift sign inside mantissa in place of MSB
	shl	a,	r0
	shrc	r2
	move	r0,	#0x00
	move	r1,	#0x00
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_floatqisf2_zero:
	move	r3,	#0x00		; exp = 0
	move  r2,   r3                      ;SC011029, bug Bruce Denning for O2Micro
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lfloatqisf2*/

#ifdef Lfloatsisf2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed/Unsigned Long to Double Conversion
	;
	; Version 5.2
	;
	; Function:	Float(r3:r2:r1:r0)	
	; Result:	r3:r2:r1:r0
	;
	; Signed if a <> 0
	; Unsigned if a = 0
	;
	; Date:		10-02-1997
	;=========================================================
	.global floatsisf2

floatsisf2:	; .proc r3, r2, r1, r0

	move	-(i3),	i0l

	; Check if Long is Signed (a <> 0) or Unsigned (a = 0)
	jzs	.L_floatsisf2_unsigned

	; Save sign in stack
	move	-(i3),	r3

	; ABS (mantissa is unsigned)
	tstb	r3,	#7
	jzs	.L_floatsisf2_pos
	cpl2	i0l,	r0
	cpl2c	r0,	r1
	cpl2c	r1,	r2
	cpl2c	r2,	r3
.L_floatsisf2_abs:

	; Initialize exponent (at 32 + 1 because loop _sh_bit
	;                      always done at least 1)
	move	r3,	#bias+0x21
	; Check for 0 byte
	move	a,	r2
	jzc	.L_floatsisf2_sh_bit	; MSB <> 0
	move	r2,	r1
	jzc	.L_floatsisf2_r1zero	; MSB only = 0
	move	r2,	r0
	jzc	.L_floatsisf2_r0zero	; 2 high byte = 0
	move	r2,	i0l
	jzs	.L_floatsisf2_zero	; Long = 0
	; 3 high byte = 0, => . byte4 00 00 00 , and exp = 8 (+1)
	move	r3,	#bias+0x09
.L_floatsisf2_norm_i0l:
	move	i0l,	#0x00
	; Shift mantissa left until carry is one
	; (=> implies exponent is dec one time too much)
.L_floatsisf2_sh_bit:
	dec	r3
	shl	i0l
	shlc	r0
	shlc	r1
	shlc	r2
	jcc	.L_floatsisf2_sh_bit
	; Shift sign inside mantissa in place of MSB
	shl	a,	(i3)+
	shrc	r2
	shrc	r1
	shrc	r0
.L_floatsisf2_store:
	move	i0l,	(i3)+		; restore registers
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

	; => . byte2 byte3 byte4 00 , and exp = 24 (+1)
.L_floatsisf2_r1zero:
	move	r1,	r0
	move	r0,	i0l
	move	r3,	#bias+0x19
	jump	.L_floatsisf2_norm_i0l

	; => . byte3 byte4 00 00 , and exp = 16 (+1)
.L_floatsisf2_r0zero:
	move	r1,	i0l
	move	r0,	#0x00
	move	r3,	#bias+0x11
	jump	.L_floatsisf2_norm_i0l

.L_floatsisf2_zero:
	move	r3,	#0x00		; exp = 0
	move	a,	(i3)+		; discard sign
	jump	.L_floatsisf2_store

.L_floatsisf2_unsigned:
	move	-(i3),	a
.L_floatsisf2_pos:
	move	i0l,	r0
	move	r0,	r1
	move	r1,	r2
	move	r2,	r3
	jump	.L_floatsisf2_abs
#endif /*Lfloatsisf2*/

#ifdef Lftruncsf2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Truncate Double
	;
	; Version 5.1
	;
	; Function:	Trunc(r3:r2:r1:r0)
	; Result:	r3:r2:r1:r0
	; Date:		11-02-1997
	;=========================================================
	.global	ftruncsf2

ftruncsf2:
	; if exponent <= bias, |number| < 1, result is 0
	cmp	r3,	#bias
	jle	.L_ftruncsf2_zero
	; If exponent >= 24 no trunc
	cmp	r3,	#(0x18+bias)
	jge	.L_ftruncsf2_end
	move	-(i3),	r3		; save epxonent
	move	-(i3),	i0l		; save i0l
	move	i0l,	#0xFF
	cmp	r3,	#(0x10+bias)
	jge	.L_ftruncsf2_startshl16
	cmp	r3,	#(0x08+bias)
	jge	.L_ftruncsf2_startshl8
	subd	r3,	#(0x08+bias)
.L_ftruncsf2_shl1:
	shl	i0l
	dec	r3
	jzc	.L_ftruncsf2_shl1
	and	r0,	i0l		; trunc r0
	jump	.L_ftruncsf2_endshl1

.L_ftruncsf2_startshl8:
	subd	r3,	#(0x10+bias)
	jzs	.L_ftruncsf2_andshl8
.L_ftruncsf2_shl8:
	shl	i0l
	dec	r3
	jzc	.L_ftruncsf2_shl8
.L_ftruncsf2_andshl8:
	and	r1,	i0l		; trunc r1 (r0 = 0)
	jump	.L_ftruncsf2_endshl8

.L_ftruncsf2_startshl16:
	subd	r3,	#(0x18+bias)
	jzs	.L_ftruncsf2_andshl16
.L_ftruncsf2_shl16:
	shl	i0l
	dec	r3
	jzc	.L_ftruncsf2_shl16
.L_ftruncsf2_andshl16:
	and	r2,	i0l		; trunc r2 (r1, r0 = 0)
	move	r1,	#0x00
.L_ftruncsf2_endshl8:
	move	r0,	#0x00
.L_ftruncsf2_endshl1:
	move	i0l,	(i3)+
	move	r3,	(i3)+
.L_ftruncsf2_end:
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_ftruncsf2_zero:
	move	r3,	#0x00
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lftruncsf2*/

#ifdef Lmodqi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Char Modulo
	;
	; Version 5.0
	;
	; Function:	A / B
	;		A: r0,	  B: r1
	; Result:	remainder:	r2
	; Date:		30-01-1997
	;=========================================================
	.global modqi3

modqi3:		; .proc r1, r0
	; Take ABS of B and test if B = 0
	move	r2,	r1
	jzs	.L_modqi3_DZ		; c = 1 => B = 0
	tstb	r1,	#7
	jzs	.L_modqi3_Bpos
	cpl2	r1
.L_modqi3_Bpos:
	; Save sign
	move	-(i3),	r0
	; Take ABS of A
	tstb	r0,	#7
	jzs	.L_modqi3_Apos
	cpl2	r0
.L_modqi3_Apos:
	; Init remainder
	move	r2,	#0x00
	; Init Loop Counter (bits 7..0)
	move	r3,	#0x07
.L_modqi3_loop:
	shl	r0			; Shift Quotien
	shlc	r2			; Shift Remainder
	subs	a,	r1,	r2	; Compare Rem. & Div.
	cmvs	r2,	a		; if >= then sub
	dec	r3			; count
	jcs	.L_modqi3_loop
	shl	a,	(i3)+		; Set remainder sign
	jcc	.L_modqi3_end
	cpl2	r2
.L_modqi3_end:
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_modqi3_DZ:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x11		; load error code (long DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x11		; load error code (long DZ)
	call	matherr
	.endif
	.endif
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lmodqi3*/

#ifdef Lmovstrhi
	;=========================================================
	; Coolrisc 816  Subroutine
	; Move String
	;
	; Version 5.0
	;
	; Function: Move Addr(r3:r2) Length SP(+0) To Addr(r1:r0)
	; Result:	
	; Date:		12-02-1997
	;=========================================================
	.global	movstrhi

movstrhi:
	move	-(i3),	i0h	; Save indexes
	move	-(i3),	i0l
	move	-(i3),	i1h
	move	-(i3),	i1l
	move	i0h,	r1	; Start address of strings
	move	i0l,	r0
	move	i1h,	r3
	move	i1l,	r2
	move	r0,	(i3, 4)	; Init counter
.L_movstrhi_loop:
	move	r1,	(i1)+	; Read 1 Integer
	move	r2,	(i1)+
	move	(i0)+,	r1	; Write 1 Integer
	move	(i0)+,	r2
	dec	r0		; Dec counter until 0
	jzc	.L_movstrhi_loop
	move	i1l,	(i3)+	; Restore indexes
	move	i1h,	(i3)+
	move	i0l,	(i3)+
	move	i0h,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lmovstrhi*/

#ifdef Lmulhi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Integer Multiplication (truncated result)
	;
	; Version 5.0
	;
	; Function:   (AH:AL)  * (BH:BL)
	;            A: r1, r0	 B: r3, r2
	; Result:    r1:r0
	; Date:      06-02-1997
	;=========================================================
	.global mulhi3

mulhi3:        ; .proc r1, r0, r3, r2

	mul	a,	r3,	r0	; BH * AL
	move	r3,	a
	mul	a,	r2,	r1	; BL * AH
	add	r1,	r3,	a
	mul	r2,	r0		; BL * AL
	move	r0,	a
	add	r1,	r2
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lmulhi3*/

#ifdef Lmulhisi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Integer Multiplication
	;
	; Version 5.0
	;
	; Function:   (AH:AL)  * (BH:BL)
	;            A: r1, r0	 B: r3, r2
	; Result:    r3, r2, r1, r0
	; Date:      06-02-1997
	;=========================================================
	.global mulhisi3

mulhisi3:	; .proc r1, r0, r3, r2

	move	-(i3),	r3
	move	-(i3),	r1
	move	-(i3),	r0
	mul	r1,	r2,	r0
	move	-(i3),	a
	mul	r0,	r0,	r3
	add	r1,	a
	mul	r3,	(i3, 2)
	addc	r0,	a
	incc	r3
	shl	a,	(i3, 2)
	jcc	.L_mulhisi3_Apos
	subs	r0,	r2
	subsc	r3,	(i3, 3)
.L_mulhisi3_Apos:
	shl	a,	(i3, 3)
	jcc	.L_mulhisi3_Bpos
	subs	r0,	(i3, 1)
	subsc	r3,	(i3, 2)
.L_mulhisi3_Bpos:
	mul	r2,	(i3, 2)
	add	r1,	a
	addc	r2,	r0
	incc	r3
	move	r0,	(i3, 4)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lmulhisi3*/

#ifdef Lmulsf3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Floating Point Multiplication (32 bits)
	;
	; Version 5.1
	;
	; Function: (Aexp:AH:AM:AL) * (Bexp:BH:BM:BL)
	;            A: r3:r2:r1:r0,   B: SP+0..+3
	; Result:    r3:r2:r1:r0
	; Date:      03-02-1997
	;=========================================================
	.global mulsf3

mulsf3:		; .proc r3, r2, r1, r0, sp(+0..+3) 

	move	-(i3),	i0h		; save used regs
	move	-(i3),	i0l
	move	-(i3),	i1h
	move	-(i3),	i1l
	; get result sign
	move	a,	(i3, 5)		; load BH
	xor	a,	r2		; determine sign (AH XOR BH)
	or	a,	#0x7F		; => s1111111
	move	-(i3),	a
	; check operands = 0
	move	a,	(i3, 5)
	jzs	.L_mulsf3_zero		; result is zero
	move	a,	r3
	jzs	.L_mulsf3_zero		; result is zero
	; get result exponent (exp1 + exp2 - bias)
	add	r3,	#bias
	jcc	.L_mulsf3_negexp		; if not carry , check for underflow
	add	r3,	(i3, 5)		; exp1+exp2
	jcc	.L_mulsf3_svexp		; if carry then overflov
.L_mulsf3_OV:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x53		; load error code (double OV)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x53		; load error code (double OV)
	call	matherr
	.endif
	.else
	move	r2,	#0xFF
	move	r1,	#0xFF
	move	r0,	#0xFF
	move	r3,	#0xFF
	.endif
	jump	.L_mulsf3_ok
.L_mulsf3_negexp:
	add	r3,	(i3, 5)		; exp1+exp2
	jcc	.L_mulsf3_UN		; if no carry OR 0 then underflow
	jzs	.L_mulsf3_UN
.L_mulsf3_svexp:
	move	(i3, 5), r3

	setb	r2,	#7		; set MSB explicit

	; multiply mantissa
	move	r3,	(i3, 8)
	mul	i0l,	r3,	r0	; AL * BL
	shl	a
	;  00  00  00  00 i0l  --
	mul	i1h,	r3,	r1	; AM * BL
	addc	i0l,	a
	;  00  00  00 i1h i0l  --
	mul	i1l,	r3,	r2	; AH * BL
	addc	i1h,	a
	incc	i1l
	;  00  00 i1l i1h i0l  --
	move	r3,	(i3, 7)
	mul	i0h,	r3,	r0	; AL * BM
	add	i0l,	a
	addc	i1h,	i0h
	;  00  00 i1l i1h  --  --
	mul	i0h,	r3,	r2	; AH * BM
	addc	i1l,	a
	incc	i0h			; co = 0 always
	shl	a,	i0l		; round
	;  00 i0h i1l i1h  --  --
	mul	r3,	r1		; AM * BM
	addc	i1h,	a
	addc	i1l,	r3
	;  00 i0h i1l i1h  --  --
	move	i0l,	(i3, 6)
	setb	i0l,	#7		; set MSB explicit
	mul	r2,	i0l		; AH * BH
	addc	i0h,	a
	incc	r2			; co = 0 always
	;  r2 i0h i1l i1h  --  --
	mul	r0,	i0l		; AL * BH
	add	i1h,	a
	addc	r0,	i1l
	incc	i0h
	incc	r2			; co = 0 always
	;  r2 i0h  r0 i1h  --  --
	mul	r1,	i0l		; AM * BH
	add	r0,	a
	addc	r1,	i0h
	incc	r2			; co = 0 always
	;  r2  r1  r0 i1h  --  --
	move	r3,	(i3, 5)
	tstb	r2,	#7		; check normalization
	jzc	.L_mulsf3_round
	; normalise (MSB must be 1)
	shl	i1h
	shlc	r0
	shlc	r1
	shlc	r2
	dec	r3			; decrement exponent
	jzs	.L_mulsf3_UN		; if 0 => underflow
	; round
.L_mulsf3_round:
	shl	i1h
	incc	r0
	incc	r1
	incc	r2
	jcc	.L_mulsf3_ok		; check overflow
	shrc	r2
	shrc	r1
	shrc	r0
	inc	r3
	jcs	.L_mulsf3_OV
.L_mulsf3_ok:
	; insert sign ( s1111111 AND r2, with MSB of r2 = 1 !)
	and	r2,	(i3)+
.L_mulsf3_end:
	move	i1l,	(i3)+
	move	i1h,	(i3)+
	move	i0l,	(i3)+
	move	i0h,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_mulsf3_UN:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x54		; load error code (double UN)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x54		; load error code (double UN)
	call	matherr
	.endif
	jump	.L_mulsf3_ok
	.endif				; ifdef false => _UN = _zero
	; result is zero
.L_mulsf3_zero:
	move	r3,	#0x00
	jump	.L_mulsf3_ok
#endif /*Lmulsf3*/

#ifdef Lmulsi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Long Multiplication (truncated result)
	;
	; Version 5.0
	;
	; Function: (A3:A2:A1:A0) * (B3:B2:B1:B0)
	;            A: SP+4..+7    B: SP+0..+3
	; Result:    r3:r2:r1:r0
	; Date:      06-02-1997
	;=========================================================
	.global mulsi3	
	
mulsi3:		; .proc sp(+0..+7)

	move	-(i3),	i0h		; save used regs
	move	-(i3),	i0l
	move	-(i3),	i1h
	move	-(i3),	i1l
	move	i0l,	(i3, 7)
	move	i0h,	(i3, 11)
	mul	r1,	i0h,	i0l	; B0 * A0
	move	r0,	a
	move	i1h,	(i3, 10)
	mul	r2,	i1h,	i0l	; B0 * A1
	add	r1,	a
	move	i1l,	(i3, 9)
	mul	r3,	i1l,	i0l	; B0 * A2
	addc	r2,	a
	mul	i0l,	(i3, 8)		; B0 * A3
	addc	r3,	a
	move	i0l,	(i3, 6)
	mul	i1h,	i0l		; B1 * A1
	add	r2,	a
	addc	r3,	i1h
	mul	i1h	i0h,	i0l	; B1 * A0
	add	r1,	a
	addc	r2,	i1h
	mul	i0l,	(i3, 9)		; B1 * A2
	addc	r3,	a
	move	i0l,	(i3, 5)
	mul	i1h,	i0h,	i0l	; B2 * A0
	add	r2,	a
	addc	r3,	i1h
	mul	i0l,	(i3, 10)	; B2 * A1
	add	r3,	a
	mul	i0h,	(i3, 4)		; B3 * A0
	add	r3,	a
	move	i1l,	(i3)+
	move	i1h,	(i3)+
	move	i0l,	(i3)+
	move	i0h,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lmulsi3*/

#ifdef Lmultqf3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Floating Point Multiplication (24 bits)
	;
	; Version 5.1
	;
	; Function: (Aexp:AH:AL) * (Bexp:BH:BL)
	;            A: r3:r2:r1,   B: SP+0..+2
	; Result:    r3:r2:r1
	; Date:      03-02-1997
	;=========================================================
	.global multqf3

multqf3:	; .proc r3, r2, r1, sp(+0..+2)

	move	-(i3),	i0h		; save used regs
	; get result sign
	move	a,	(i3, 2)		; load BH
	xor	a,	r2		; determine sign (AH XOR BH)
	or	a,	#0x7F		; => s1111111
	move	-(i3),	a
	; check operands = 0
	move	a,	(i3, 2)
	jzs	.L_multqf3_zero		; result is zero
	move	a,	r3
	jzs	.L_multqf3_zero		; result is zero
	; get result exponent (exp1 + exp2 - bias)
	add	r3,	#bias
	jcc	.L_multqf3_negexp	; if not carry , check for underflow
	add	r3,	(i3, 2)		; exp1+exp2
	jcc	.L_multqf3_svexp		; if carry then overflov
.L_multqf3_OV:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x43		; load error code (double OV)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x43		; load error code (double OV)
	call	matherr
	.endif
	.else
	move	r2,	#0xFF
	move	r1,	#0xFF
	move	r3,	#0xFF
	.endif
	jump	.L_multqf3_ok
.L_multqf3_negexp:
	add	r3,	(i3, 2)		; exp1+exp2
	jcc	.L_multqf3_UN		; if no carry OR 0 then underflow
	jzs	.L_multqf3_UN
.L_multqf3_svexp:
	move	(i3, 2), r3

	setb	r2,	#7		; set MSB explicit

	; multiply mantissa
	move	r3,	(i3, 4)
	mul	r0,	r3,	r1	; AL * BL
	shl	a
	;  00  00 r0  --
	mul	i0h,	r3,	r2	; AH * BL
	addc	r0,	a
	;  00  i0h r0  --
	move	r3,	(i3, 3)
	setb	r3,	#7		; set MSB explicit
	mul	r2,	r3		; AH * BH
	addc	i0h,	a
	incc	r2
	;  r2  i0h r0  --
	mul	r1,	r3		; AL * BH
	add	r0,	a
	addc	r1,	i0h
	incc	r2
	;  r2  r1  r0  --
	move	r3,	(i3, 2)
	tstb	r2,	#7		; check normalization
	jzc	.L_multqf3_round
	; normalise (MSB must be 1)
	shl	r0
	shlc	r1
	shlc	r2
	dec	r3			; decrement exponent
	jzs	.L_multqf3_UN		; if 0 => underflow
	; round
.L_multqf3_round:
	shl	r0
	incc	r1
	incc	r2
	jcc	.L_multqf3_ok		; check overflow
	shrc	r2
	shrc	r1
	inc	r3
	jcs	.L_multqf3_OV
.L_multqf3_ok:
	; insert sign ( s1111111 AND r2, with MSB of r2 = 1 !)
	and	r2,	(i3)+
	move	i0h,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_multqf3_UN:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x44		; load error code (double UN)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x44		; load error code (double UN)
	call	matherr
	.endif
	jump	.L_multqf3_ok
	.endif				; ifdef false => _UN = _zero
	; result is zero
.L_multqf3_zero:
	move	r3,	#0x00
	jump	.L_multqf3_ok
#endif /*Lmultqf3*/

#ifdef Ludivmodhi4
	;=========================================================
	; Coolrisc 816  Subroutine
	; Unsigned Integer Division
	;
	; Version 5.0
	;
	; Function:	AH:AL / BH:BL
	;		A: r1:r0,	B: SP(+0..+1)
	; Result:	quotien:	r1:r0
	;		remainder:	r3:r2
	; Date:		30-01-1997
	;=========================================================
	.global udivmodhi4

udivmodhi4:	; .proc r1, r0, sp(+0..+1)

	; save temp registers
	move	-(i3),	i0h
	; Test if B = 0
	move	r2,	(i3, 1)
	or	r2,	(i3, 2)
	jzs	.L_udivmodhi4_DZ
	; Init remainder
	move	r2,	#0x00
	move	r3,	#0x00
	; Init Loop Counter (bits 15..0)
	move	i0h,	#0x0F
.L_udivmodhi4_loop:
	shl	r0			; Shift Quotien
	shlc	r1
	shlc	r2			; Shift Remainder
	shlc	r3
	subs	r2,	(i3, 0x2)	; Compare
	subsc	r3,	(i3, 0x1)
	jcs	.L_udivmodhi4_incres
	add	r2,	(i3, 0x2)	; Restore if <
	addc	r3,	(i3, 0x1)
	dec	i0h			; Dec counter
	jcs	.L_udivmodhi4_loop
	jump	.L_udivmodhi4_done
.L_udivmodhi4_incres:
	setb	r0,	#0
	dec	i0h
	jcs	.L_udivmodhi4_loop
.L_udivmodhi4_done:
	move	i0h,	(i3)+		; Restore registers
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_udivmodhi4_DZ:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x71		; load error code (long DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x71		; load error code (long DZ)
	call	matherr
	.endif
	.else
	move	r3,	#0x00		; sat. to maxlong
	move	r1,	#0xFF
	move	r0,	#0xFF
	.endif
	jump	.L_udivmodhi4_done
#endif /*Ludivmodhi4*/

#ifdef Ludivmodqi4
	;=========================================================
	; Coolrisc 816  Subroutine
	; Unsigned Char Division
	;
	; Version 5.0
	;
	; Function:	A / B
	;		A: r0,	B: r1
	; Result:	quotien:	r0
	;		remainder:	r2
	; Date:		30-01-1997
	;=========================================================
	.global udivmodqi4

udivmodqi4:	; .proc r1, r0

	; Init remainder
	move	r2,	#0x00
	; Test if B = 0
	move	a,	r1
	jzs	.L_udivmodqi4_DZ
	; Init Loop Counter (bits 7..0)
	move	r3,	#0x07
.L_udivmodqi4_loop:
	shl	r0			; Shift Quotien
	shlc	r2			; Shift Remainder
	subs	a,	r1,	r2	; Compare Rem. & Div.
	cmvs	r2,	a		; if >= then sub
	incc	r0			; if >= then quo + 1
	dec	r3			; count
	jcs	.L_udivmodqi4_loop
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_udivmodqi4_DZ:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x61		; load error code (long DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x61		; load error code (long DZ)
	call	matherr
	.endif
	.else
	move	r0,	#0xFF
	.endif
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Ludivmodqi4*/

#ifdef Ludivmodsi4
	;=========================================================
	; Coolrisc 816  Subroutine
	; Unsigned Long Division
	;
	; Version 5.1
	;
	; Function:	AH1:AH2:AL1:AL2 / BH1:BH2:BL1:BL2
	;		A: r3:r2:r1:r0,	  B: SP(+0..+3)
	; Result:	quotien:	r3:r2:r1:r0
	;		remainder:	SP(+0..+3)
	; Date:		03-02-1997
	;=========================================================
	.global udivmodsi4

udivmodsi4:	; .proc r3, r2, r1, r0, sp(+0..+3)

	move	-(i3),	i0l
	; Take ABS of B and test if B = 0
	move	i0l,	(i3, 1)
	or	i0l,	(i3, 2)
	or	i0l,	(i3, 3)
	or	i0l,	(i3, 4)
	jzs	.L_udivmodsi4_DZ
	; save temp registers
	move	-(i3),	i0h
	move	-(i3),	i1h
	move	-(i3),	i1l
	move	-(i3),	i2h
	; Init remainder
	move	i0h,	#0x00
	move	i0l,	#0x00
	move	i1h,	#0x00
	move	i1l,	#0x00
	; Init Loop Counter (bits 31..0)
	move	i2h,	#0x1F
.L_udivmodsi4_loop:
	shl	r0			; Shift Quotien
	shlc	r1
	shlc	r2
	shlc	r3
	shlc	i1l			; Shift Remainder
	shlc	i1h
	shlc	i0l
	shlc	i0h
	subs	i1l,	(i3, 0x8)	; Compare
	subsc	i1h,	(i3, 0x7)
	subsc	i0l,	(i3, 0x6)
	subsc	i0h,	(i3, 0x5)
	jcs	.L_udivmodsi4_incres
	add	i1l,	(i3, 0x8)	; Restore if <
	addc	i1h,	(i3, 0x7)
	addc	i0l,	(i3, 0x6)
	addc	i0h,	(i3, 0x5)
	dec	i2h			; Dec counter
	jcs	.L_udivmodsi4_loop
	jump	.L_udivmodsi4_done
.L_udivmodsi4_incres:
	setb	r0,	#0
	dec	i2h
	jcs	.L_udivmodsi4_loop
.L_udivmodsi4_done:
	move	(i3, 8), i1l		; place remainder in stack
	move	(i3, 7), i1h
	move	(i3, 6), i0l
	move	(i3, 5), i0h
	move	i2h,	(i3)+		; Restore registers
	move	i1l,	(i3)+
	move	i1h,	(i3)+
	move	i0h,	(i3)+
.L_udivmodsi4_end:
	move	i0l,	(i3)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_udivmodsi4_DZ:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x81		; load error code (long DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x81		; load error code (long DZ)
	call	matherr
	.endif
	.else
	move	r3,	#0xFF		; sat. to maxlong
	move	r2,	#0xFF
	move	r1,	#0xFF
	move	r0,	#0xFF
	; B = 0 becomes remainder = 0
	.endif
	jump	.L_udivmodsi4_end
#endif /*Ludivmodsi4*/

#ifdef Lumodqi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Signed Char Modulo
	;
	; Version 5.0
	;
	; Function:	A / B
	;		A: r0,	  B: r1
	; Result:	remainder:	r2
	; Date:		30-01-1997
	;=========================================================
	.global umodqi3

umodqi3:	; .proc r1, r0

	; Take ABS of B and test if B = 0
	move	r2,	r1
	jzs	.L_umodqi3_DZ		; c = 1 => B = 0
	; Init remainder
	move	r2,	#0x00
	; Init Loop Counter (bits 7..0)
	move	r3,	#0x07
.L_umodqi3_loop:
	shl	r0			; Shift Quotien
	shlc	r2			; Shift Remainder
	subs	a,	r1,	r2	; Compare Rem. & Div.
	cmvs	r2,	a		; if >= then sub
	dec	r3			; count
	jcs	.L_umodqi3_loop
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif

.L_umodqi3_DZ:
	.ifdef	error_routine
	.ifdef	SOFTLIB
	move	-(i3),	ipl
	move	-(i3),	iph
	move	a,	#0x61		; load error code (long DZ)
	calls	matherr
	move	iph,	(i3)+
	move	ipl,	(i3)+
	.else
	move	a,	#0x61		; load error code (long DZ)
	call	matherr
	.endif
	.endif
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lumodqi3*/

#ifdef Lumulhisi3
	;=========================================================
	; Coolrisc 816  Subroutine
	; Unsigned Integer Multiplication
	;
	; Version 5.0
	;
	; Function:   (AH:AL)  * (BH:BL)
	;            A: r1, r0	 B: r3, r2
	; Result:    r3, r2, r1, r0
	; Date:      06-02-1997
	;=========================================================
	.global umulhisi3

umulhisi3:	; .proc r1, r0, r3, r2

	move	-(i3),	r1
	mul	r1,	r2,	r0	; AL * BL
	move	-(i3),	a
	mul	r0,	r3		; AL * BH
	add	r1,	a
	mul	r3,	(i3, 1)		; AH * BH
	addc	r0,	a
	incc	r3
	mul	r2,	(i3, 1)		; AH * BL
	add	r1,	a
	addc	r2,	r0
	incc	r3
	move	r0,	(i3, 2)+
	.ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lumulhisi3*/

#ifdef L_bswapsi2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Unsigned Integer swap

   .global bswapsi2

bswapsi2:
   ; Function:	AL1:AL2
   ;		A: r1:r0

   move  -(i3), r1
   move  r1, r0
   move  r0, (i3)+
   
   .ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lbswapsi2*/


#ifdef L_bswapdi2
	;=========================================================
	; Coolrisc 816  Subroutine
	; Unsigned Long Swap

   .global bswapdi2

bswapdi2:
   ; Function:	AH1:AH2:AL1:AL2
   ;		A: r3:r2:r1:r0

   move  -(i3), r1
   move  -(i3), r0
   move  r1, r2
   move  r0, r3
   move  r3, (i3)+
   move  r2, (i3)+
   
   .ifdef	SOFTLIB
	rets
	.else
	ret
	.endif
#endif /*Lbswapdi2*/
