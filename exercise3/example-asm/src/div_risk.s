.macro  DEBUG_PRINT     reg
csrw 0x7b2, \reg
.endm
  addi    a0, zero, 12    # a0 <- 12
  addi    a1, zero, 4     # a1 <- 4
  call    div
  DEBUG_PRINT a0          # display the quotient
  DEBUG_PRINT a1          # display the remainder

  addi    a0, zero, 93    # a0 <- 93
  addi    a1, zero, 7     # a1 <- 7
  call    div
  DEBUG_PRINT a0          # display the quotient
  DEBUG_PRINT a1          # display the remainder

  lui     a0, (0x12345000>>12)
  ori     a0, a0, 0x678   # a0 <- 0x12345678
  addi    a1, zero, 255   # a1 <- 255
  call    div
  DEBUG_PRINT a0          # display the quotient
  DEBUG_PRINT a1          # display the remainder
  ecall

#
# MY CODE START
#
div:
  bgt a1,x0,.start    # a0 = N, a1 = D
  ecall
.start:
  li a3,1             # a3 = p
.prescale:
  sll a1,a1,1         # D << 1
  sll a3,a3,1         # p << 1
  bgt a0,a1,.prescale # repeat if N > D
	sra	a1,a1,1         # D >> 1
	sra	a3,a3,1         # p >> 1

  li a4,0             # a4 = Result
.mainloop:
  bgt a1,a0,.loop_if  # skip if, if D > N 
  sub a0,a0,a1        # N = N - D
  add a4,a4,a3        # Result += p
.loop_if:
  sra a1,a1,1         # D >> 1
  sra a3,a3,1         # p >> 1
  bgt a3,x0,.mainloop # repeat if p > 0

  addi a1,a0,0        # a1 = N(remainder)
  addi a0,a4,0        # a0 = Result
#
# MY CODE END
#
