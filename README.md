# CalcuTec – 8086 Assembly (16-bit)

CalcuTec is a console-based calculator written in **8086 Assembly (16-bit)** using **Turbo Assembler (TurboASM)**.  
The program is designed to run in a **16-bit DOS real-mode environment** and uses **DOS interrupts (`int 21h`)** for keyboard input and screen output.

This project was developed for educational purposes to practice low-level programming and understand legacy x86 architectures.

---

## Important Notice

The generated executable (`.exe`) is a **16-bit DOS application**.

- It does **not run natively** on modern operating systems such as Windows 10 or Windows 11  
- It is intended for **16-bit x86 systems only**  
- A **16-bit compatible environment** is required to execute the program

---

## System Requirements

- 16-bit x86 architecture  
- DOS real-mode environment  
- Turbo Assembler (TurboASM)

---

## Tools Used

- Turbo Assembler (TurboASM)

No additional tools, libraries, or languages were used.

---

## Build

This project was assembled and linked exclusively using Turbo Assembler.

```dos
tasm CalcuTec.asm
tlink CalcuTec.obj
