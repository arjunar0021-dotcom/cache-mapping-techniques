.data
base_addr: .zero 16384

.text
.globl main

main:
    la s0, base_addr
    li t0, 10

loop:
    # 5 blocks -> same set
    lw t1, 0(s0)
    lw t2, 1024(s0)

    li t3, 2048
    add t3, s0, t3
    lw t3, 0(t3)

    li t4, 3072
    add t4, s0, t4
    lw t4, 0(t4)

    li t5, 4096
    add t5, s0, t5
    lw t5, 0(t5)

    # reuse
    lw t1, 0(s0)
    lw t2, 1024(s0)

    addi t0, t0, -1
    bnez t0, loop

    li a7, 10
    ecall
