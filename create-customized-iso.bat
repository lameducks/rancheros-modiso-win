@echo off

cd /d "%~dp0"
mkdir iso 2> NUL
bin\mkisofs -l -J -R -V RancherOS ^
    -no-emul-boot -boot-load-size 4 -boot-info-table ^
    -b boot/isolinux/isolinux.bin -c boot/isolinux/boot.cat ^
    -uid 0 -gid 0 -dir-mode 0755 -file-mode 0644 -allow-leading-dots ^
    -o iso/rancheros-customized.iso ^
    original overlay
