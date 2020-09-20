cd .\output
cl65.exe main.o acia.o zeropage.o ram_disk.o ewoz.o -C ..\config\APP_RAM_DISK.cfg -o ramdisk.bin
cl65.exe main.o acia.o zeropage.o ram_disk.o ewoz.o -C ..\config\appartus.cfg -o ROM.bin
cl65.exe main.o acia.o zeropage.o ram_disk.o ewoz.o -C ..\config\bank_ram_disk.cfg -o BANK.bin
pause
