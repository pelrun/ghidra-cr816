#ifdef TREE_CODE
extern void c816_pr_interrupt( struct cpp_reader* pfile ATTRIBUTE_UNUSED );

extern void c816_pr_output( struct cpp_reader* pfile ATTRIBUTE_UNUSED );
#endif

extern rtx
function_arg(int cum, enum machine_mode mode, tree type, int named)  ;


#if defined  RTX_CODE   
/*so that we don't get any error like :
type of formal parameter 1 is incomplete or
enum rtx_code' declared inside parameter list*/
									  
extern rtx  gen_rtx (enum rtx_code , enum machine_mode , ...);

#endif 

#if 0 /* SC pour V4 */

extern int
immediate_inc_operand( rtx ,  enum machine_mode      );


extern int
data_reg_operand(rtx , enum machine_mode );


extern int
data_reg1_operand(rtx , enum machine_mode ) ;


extern int
data_reg2_operand(rtx , enum machine_mode );

extern int
data_reg3_operand(rtx , enum machine_mode );

extern int
romidx_operand(rtx , enum machine_mode );

extern int
commutative_operator(rtx , enum machine_mode );
#endif

extern int cool_address_cost (rtx  , unsigned char  ) ;


extern const char *
output_libcall(rtx insn, rtx *operands, int n_par_r, int n_par_s,
int commutative, const char *_template, int fsub, int no_call,
int alt_reg) ;

 extern const char *
output_not(rtx insn, rtx *operands) ;

extern  const char* output_move(rtx insn, rtx *operands)  ;
