(define_register_constraint "a" "RAMIDX_REGS"
  "RAM index registers")

(define_register_constraint "z" "REG0_0_REGS"
   "reg0 0")

(define_register_constraint "y" "REG3_3_REGS"
   "reg3 3")

(define_register_constraint "b" "REG1_1_REGS"
   "reg1 1")

(define_register_constraint "w" "REG0_1_REGS"
   "reg0 1")

(define_register_constraint "e" "REG2_3_REGS"
   "reg2 3")

(define_register_constraint "c" "REG0_2_REGS"
   "reg0 2")

(define_register_constraint "f" "DATA_REGS"
   "data registers")

(define_register_constraint "x" "ROMIDX_REGS"
   "ROM index registers")

(define_constraint "I"
  "Integer constant -1/1."
  (and (match_code "const_int")
       (match_test "ival == -1 || ival == 1")))

(define_constraint "J"
  "-64 to 64 (auto[inc,dec] range)"
  (and (match_code "const_int")
       (match_test "ival >= -64 && ival <= 64")))

(define_constraint "K"
  "4-bit value"
  (and (match_code "const_int")
       (match_test "(ival & ~0xf) == 0")))

(define_constraint "L"
  "7-bit value"
  (and (match_code "const_int")
       (match_test "(ival & ~0x7f) == 0")))

(define_constraint "M"
  "8-bit value"
  (and (match_code "const_int")
       (match_test "(ival & ~0xff) == 0")))

(define_constraint "N"
  "9-bit value"
  (and (match_code "const_int")
       (match_test "(ival & ~0x1ff) == 0")))

(define_constraint "O"
  "Zero."
  (and (match_code "const_int")
       (match_test "ival == 0")))

(define_constraint "H"
  "Constant float H"
  (and (match_code "const_double")
       (match_test "0")))

(define_constraint "G"
  "Constant float G"
  (and (match_code "const_double")
       (match_test "0")))

(define_memory_constraint "Q"
  "A memory address based on page0."
  (and (match_code "mem")
       (match_test "page0_mem(op)")))
