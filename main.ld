MEMORY
{
        KERNEL (rwx) : ORIGIN = 0x80200000, LENGTH = 128
}

SECTIONS
{
        .text :
        {
                *(.text.kernel)
                . = ALIGN(4);
        } > KERNEL
}
