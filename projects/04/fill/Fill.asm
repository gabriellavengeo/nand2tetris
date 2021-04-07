// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
  @0
  D=A
  @color
  M=D // Set default color to white

  @KBD
  D=M // Get key pressed
  @BLACK
  D; JNE // Set color to black if key is pressed
  @FILL
  0; JMP
(BLACK)
  @color
  M=M-1
  @FILL
  0; JMP

(FILL)
  @8192
  D=A // Screen registers count
  @i
  M=D

  @SCREEN
  D=A
  @address
  M=D // Screen base address

(FILL_LOOP)
  @i
  D=M
  @LOOP
  D; JEQ
  @color
  D=M
  @address
  A=M
  M=D
  @i
  M=M-1
  @address
  M=M+1
  
  @FILL_LOOP
  0; JMP

@LOOP
0; JMP