.include "io.inc65"
.include "macros.inc65"

.zeropage

.smart		on
.autoimport	on
.case		on
.debuginfo	off
.importzp	sp, sreg, regsave, regbank
.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
.macpack	longbranch

.export _format_bank
.export _set_bank
.export _get_bank
.export __delay2
.export _print_nl
.export INPUT_CHK

.segment "RODATA"
msg_0:			.byte "Mazu BANKDISK", $00

.segment "CODE"
INPUT_CHK:		JSR kbscan
					CMP #0
					BNE @END
@RS:			LDA ACIA_STATUS
					AND #ACIA_STATUS_RX_FULL
					BEQ @END
					LDA ACIA_DATA
@END:			RTS

_set_bank:
					STA BANK_BASE
					;CLC
					;ADC #$30
					;JSR _acia_putc
					RTS
_get_bank:  LDA BANK_BASE
            RTS

; ---------------------------------------------------------------
; void __near__ print_f (char *s)
; ---------------------------------------------------------------

_print_nl:
            jsr     _acia_put_newline
            JMP     _acia_puts


_format_bank:
                  LDY #0
                  LDA #<(BANKDISK)
                  LDX #>(BANKDISK)
                  STA ptr1
                  STX ptr1 + 1

@write_BANK:			LDA #$0
                  STA (ptr1), Y
                  INY
                  CPY #$0
                  BNE @end_BANK
                  INX
                  STX ptr1 + 1
                  CPX #$C0
                  BNE @end_BANK
                  RTS
@end_BANK:			  JMP @write_BANK


__delay2:				LDX #$2
__delay3:				DEX
                BNE __delay3
                RTS
