# How to install and use Windows sapi5 voices on Linux

Install the latest version of wine from:
[https://wiki.winehq.org/Ubuntu](https://wiki.winehq.org/Ubuntu)

Download the latest version of winetricks from:
[https://wiki.winehq.org/Winetricks](https://wiki.winehq.org/Winetricks)

After successful download execute these commands:
```
chmod +x winetricks
sudo cp winetricks /usr/local/bin
```

Download the latest version of PlayOnLinux from:
[https://www.playonlinux.com/en/download.html](https://www.playonlinux.com/en/download.html)
cd into folder containing playonlinux(version).deb file and execute this command:
```
sudo dpkg -i playonlinux(version).deb
```

After successful installation, run the playonlinux command from your terminal. When the app starts, click on Tools -> Manage Wine versions, select version 2.22 and move it to the right side by clicking on arrow button. Close the form and click on Configure button. When the form loads, click on new button located at the bottom left corner. This will run wineprefix setup wizard. Click next, select 32 bits windows installation and next. Then, select version 2.22 and click next. When prompted for virtual drive name, enter tts and wait for the wizard to finish. You are done with wineprefix configuration.

Now, run the command below to install sapi5 engine:
```
WINEPREFIX=~/.PlayOnLinux/wineprefix/tts winetricks speechsdk
```

To check if everything went well, download the small command line utility from:
[http://www.cross-plus-a.com/bconsole.htm](http://www.cross-plus-a.com/bconsole.htm)
extract it to this folder:
```
/home/(your_user_name)/.PlayOnLinux/wineprefix/tts/drive_c/balcon
```
now, run this command from your terminal:
```
WINEPREFIX=~/.PlayOnLinux/wineprefix/tts wine c:/balcon/balcon -l
```
If everything went well, console output should look like this:
```
SAPI 5:
  Microsoft Mary
  Microsoft Mike
  Microsoft Sam
  SampleTTSVoice
```
Now you can install your favorite sapi5 voices on your Linux system.
__Caution__ when installing additional voices, use PlayOnLinux to run setup *.exe/*.msi files. Don't try to install them under default wine prefix.

## Read selected text using sapi5 voices by pressing hot key

Install xclip on your system by executing the command below
```
sudo apt-get install xclip
```

Copy/paste say.sh, stop.sh scripts from the repo to your /home folder and run these commands:
```
chmod +x say.sh
chmod +x stop.sh
```
1. On Ubuntu, open start menu, type in Keyboard and open the app.
2. Select Shortcuts tab and on the left hand side chose Custom shortcuts
3. Click on Add custom shortcut button
4. Enter a name then under Command, enter the script location with sh prefix followed by sapi5 voice name
```
Ex: sh /home/(your_user_name)/scripts/say.sh 'voice name'
```
Repeat steps 3 and 4 for all additional voices. For the stop.sh script, use the same procedure, but the script doesn't require any parameters.
```
Ex: sh /home/(your_user_name)/scripts/stop.sh
```
When done, click on saved enteries one by one and add Keyboard bindings.
