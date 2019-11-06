# rancheros-modiso-win

A tool for customizing an [official RancherOS ISO file]( https://github.com/rancher/os/releases ) that runs on Windows.

## Usage

1. Mount `rancheros.iso` to a virtual drive.  
    
    If you're running Windows 10 on your computer, you can mount an ISO file natively without a need of extra software.

1. Clone this repository.
    
    ```bat
    git clone https://github.com/lameducks/rancheros-modiso-win.git
    ```

1. Copy all files from the mounted drive.  
    
    Copy the files to the `original` folder under the repository root. The following is an example when the drive letter of the virtual drive is `E`.
    
    ```bat
    cd rancheros-modiso-win
    xcopy /E /I /H E: original
    ```

1. Add any files to overlay the original ISO.  
    
    Place files you want to add to the final ISO file in the `overlay` folder under the repository root.  
    
    The `overlay` folder contains binary keymap files for non-US keyboards by default (can be deleted). After booting RancherOS from the customized ISO, you can change keymap using the `loadkeymap` command.
    
    ```bash
    sudo mount -t iso9660 /dev/cdrom /media
    loadkeymap < /media/bkeymaps/us/us.bmap
    ```
   
1. Create a customized ISO file.  
    
    The customized ISO file is placed in the `iso` folder under the repository with the name `rancheros-customized.iso`.
    
    ```bat
    create-customized-iso.bat
    ```
    
    Note: Unlike official ISO files, MBR is not installed in the customized ISO file.
