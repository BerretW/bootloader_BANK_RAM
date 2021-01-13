.zeropage

.smart		on
.autoimport	on
.case		on
.debuginfo	off
.importzp	sp, sreg, regsave, regbank
.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
.macpack	longbranch

.segment "JMPTBL"

CHROUT: JMP _acia_putc                  ;FF00 print CHAR from regA
CHRIN:  JMP _acia_getc                  ;FF03 get char from buffer to regA
PRNTLN: JMP _print_nl                   ;FF06 put new line and a string with start address in regA and regX "lda #<(STRING),ldx #>(STRING),jsr PRNTLN"
PRNT:   JMP _acia_puts                  ;FF09 put a string with start address in regA and regX "lda #<(STRING),ldx #>(STRING),jsr PRNTLN"
SETBNK: JMP _set_bank                   ;FF0C set bank to number from regA
GETBNK: JMP _get_bank                   ;FF0F get bank number to regA
SNINIT: JMP _sn_init                    ;FF12 Initialize SN76489 chipwith mute
SNWRT:  JMP _sn_write_data              ;FF15 write data from regA to sn76489
SHDLY:  JMP __delay2                    ;FF18 very short delay
RST:    JMP _loop                       ;FF1B
KBINPUT: JMP kbinput                     ;FF1E
KBGET:  JMP kbget                       ;FF21
KBSCAN: JMP kbscan                     ;FF24
KBINIT: JMP kbinit                      ;FF27
INPUT:  JMP INPUT_CHK                       ;FF2A
