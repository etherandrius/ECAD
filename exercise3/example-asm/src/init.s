# RISC-V baremetal init.s
# This code is executed first.

.section .text.init
entry:

  la    sp, __sp-32   # set up the stack pointer, using a constant defined in the linker script.

  la    t0, end       # on hardware, ECALL doesn't stop the CPU, so define
                        # a handler to catch the ECALL and spin
  csrw  0x305, t0     # set the address of the handler (CSR 0x305 is the trap handler base register)

  call  main          # call the main function
.macro  DEBUG_PRINT     reg
csrw 0x7b2, \reg
.endm
  addi    a0, zero, 12    # a0 <- 12
  addi    a1, zero, 4     # a1 <- 4
  call    div             # should return (a0, a1) = 3, 0
  DEBUG_PRINT a0          # display the quotient
  DEBUG_PRINT a1          # display the remainder

  addi    a0, zero, 93    # a0 <- 93
  addi    a1, zero, 7     # a1 <- 7
  call    div             # should return (a0, a1) = 13, 2
  DEBUG_PRINT a0          # display the quotient
  DEBUG_PRINT a1          # display the remainder

  lui     a0, (0x12345000>>12)
  ori     a0, a0, 0x678   # a0 <- 0x12345678
  addi    a1, zero, 255   # a1 <- 255
  call    div
  DEBUG_PRINT a0          # display the quotient
  DEBUG_PRINT a1          # display the remainder
  ecall               # halt the simluation when it returns

end:
    j end               # loop when finished if there is no environment to return to.
