#shift.s
.text
shift:
.global shift
loop1:
  li t0, 0 # t0 = 0
  li t1, 0 # t1 = 0
  mv a3, a6 #} 
  lw a3, 0(a3)  #} a3 = <длина массива> 
  mv a4, a7 # a4 = <адрес 0-го элемента массива>
  slli a2, a3, 2 # a2 = <длина массива> * 4
  add a4, a4, a2 # a4 = <адрес 0-го элемента массива> + <длина массива> * 4
loop2:
  addi a4, a4, -4 # a4 = a4 - 4
  addi a3, a3, -1 # a3 = a3 - 1
  lw a5, 0(a4) # a5 = элемент массиыв
  mv t1, t0  # t1 = t0
  mv t0, a5  # t0 = a5
  sw t1, 0(a4)  # элемент массиыв = t1
  beq a3, zero, continue # if(a3==zero) goto continue
  j loop2 #goto loop2
continue:
  mv a3, a6 #} 
  lw a3, 0(a3)  #} a3 = <длина массива> 
  mv a4, a7 # a4 = <адрес 0-го элемента массива>
  slli a2, a3, 2 # a2 = <длина массива> * 4
  add a4, a4, a2 # a4 = <адрес 0-го элемента массива> + <длина массива> * 4
  addi a4, a4, -4 # a4 = a4 - 4 <адрес последнего элемента массива> 
  sw t0, 0(a4) # последний элемент массива = t0
    addi t2, t2, -1 # t2 = t2 - 1
  beq t2, zero, end # if(t2==zero) goto printRes
  j loop1
end:
ret