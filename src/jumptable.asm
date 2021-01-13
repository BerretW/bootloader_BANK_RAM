.zeropage

.smart		on
.autoimport	on
.case		on
.debuginfo	off
.importzp	sp, sreg, regsave, regbank
.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
.macpack	longbranch

.segment "JMPTBL"

CHROUT:	JMP	_acia_putc        		;	print CHAR from regA
CHRIN:	JMP	_acia_getc        		;	get char from buffer to regA
PRNTLN:	JMP	_print_nl         		;	put new line and a string with start address in regA and regX "lda #<(STRING),ldx #>(STRING),jsr PRNTLN"
PRNT:	JMP	_acia_puts        		;	put a string with start address in regA and regX "lda #<(STRING),ldx #>(STRING),jsr PRNTLN"
PRNL:	JMP	_acia_put_newline 		;	print a new line
SETBNK:	JMP	_set_bank         		;	set bank to number from regA
GETBNK:	JMP	_get_bank         		;	get bank number to regA
SNINIT:	JMP	_sn_init          		;	Initialize SN76489 chipwith mute
SNWRT:	JMP	_sn_write_data    		;	write data from regA to sn76489
SHDLY:	JMP	__delay2          		;
RST:	JMP	_loop             		;	
KBINPUT:	JMP	kbinput          		;
KBGET:	JMP	kbget             		;
KBSCAN:	JMP	kbscan            		;
KBINIT:	JMP	kbinit            		;
INPUT:	JMP	INPUT_CHK         		;
