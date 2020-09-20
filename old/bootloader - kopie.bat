ca65.exe bootloader.asm
ca65.exe lcd.asm
ca65.exe acia.asm
ca65.exe zeropage.asm
ca65.exe ram_disk.asm
ca65.exe ewoz.asm

cl65.exe *.o -C APP_RAM_DISK.cfg -o ramdisk.bin
cl65.exe *.o -C appartus.cfg -o bootloader.bin
pause
