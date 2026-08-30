ENTRY(_start)

MEMORY
{
        KERNEL (rwx) : ORIGIN = 0x80200000, LENGTH = 0x100000
}

SECTIONS
{
        .text :
        {
                *(.text)
        } > KERNEL
        
        .rodata :
        {
                *(.rodata)
        } > KERNEL
        
        .data :
        {
                *(.data)
        } > KERNEL

        .bss :
        {
                *(.bss)
        } > KERNEL

        /DISCARD/ : {
                *(.comment)
                *(.debug*)
                *(.note*)
                *(.riscv.attributes)
                *(.eh_frame_hdr)
        }
}
