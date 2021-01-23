				.setcpu "65C02"
				.include "io.inc65"
				.include "zeropage.inc65"

				.import _lcd_init
				.import _lcd_putc
				.import _lcd_puts
				.import _acia_init
				.import _acia_putc
				.import _acia_getc
				.import _acia_puts
				.import _lcd_w_reg
				.import _acia_put_newline
				.import _print_help
				.import _write_to_ram
				.import _read_ram
				.import _bootloader_
				.import _format_bank


				.export main
                .segment "VECTORS"

                .word   nmi
                .word   reset
                .word   irq


                .segment "CODE"


reset:          CLI
								JMP main

nmi:            JMP (RAMDISK_NMI_VECTOR)
								RTI

irq:            JMP (RAMDISK_IRQ_VECTOR)
								RTI


main:
								JSR _acia_init

								JMP _bootloader_
