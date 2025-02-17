/* filepath: /home/iagolucas/Documents/Defesa_Mestrado/linker_script.ld */

/* Define the memory regions */
MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 256K
  RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
}

/* Define the sections */
SECTIONS
{
  .text : 
  {
    KEEP(*(.isr_vector)) /* Interrupt vector table */
    *(.text*)            /* Code */
    *(.rodata*)          /* Read-only data */
    _etext = .;          /* End of text section */
  } > FLASH

  .data : AT (ADDR(.text) + SIZEOF(.text))
  {
    _sdata = .;          /* Start of data section */
    *(.data*)            /* Initialized data */
    _edata = .;          /* End of data section */
  } > RAM

  .bss :
  {
    _sbss = .;           /* Start of BSS section */
    *(.bss*)             /* Uninitialized data */
    *(COMMON)
    _ebss = .;           /* End of BSS section */
  } > RAM

  .stack (NOLOAD) :
  {
    _stack_start = .;
    . = . + 0x1000;      /* 4KB stack */
    _stack_end = .;
  } > RAM
}

/* Define the entry point */
ENTRY(Reset_Handler)

/* Provide symbols for the start and end of the stack */
PROVIDE(_stack_start = ORIGIN(RAM) + LENGTH(RAM));
PROVIDE(_stack_end = _stack_start + 0x1000);