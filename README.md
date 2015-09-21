# [ArkPincodeCrackert](https://github.com/m3talstorm/ArkPincodeCracker)

A bot written in AutoHotKey to brute force the pin code locks in [ARK: Survival Evolved](http://www.playark.com/).

## How To:

* [Download the latest release](https://github.com/m3talstorm/ArkPincodeCracker/archive/master.zip) or clone the repo: `https://github.com/m3talstorm/ArkPincodeCracker.git`.
* Download and install [AutoHotKey](http://ahkscript.org/download/ahk-install.exe)
* Run the `ARKLockBot.ahk` file (Windows: right click - run as administrator)
* Once inside ARK and facing a locked door/chest/vault press `Control + Shift + Left mouse click` to activate the bot, it will then ask you what code to start from and how many codes (incrementing) to try.
For example, if you enter `0` and `50` it will start with `0000, 0001, 0002, 0003, ... 0050`. If you wanted to try all permutations would would enter `0 then 9999`, the last half would be `5000 and 9999`, and so on.
This allows multiple players to start from different codes to speed up the process as well as restart from a previous code if needed.
* It will then ask if you would like to try the 20 or so most common pin codes to hopefully speed up the process
* Once the code is found and the item unlocks you will either need to remember the number shown in the tooltip, press escape to stop the script and then look inside the `attempts.log` file to see the
last code that was tried, or keep the inventory window open as long as you can/drop all items.
* The bot can be paused and resumed with `Controls + Shift + P` and stopped by pressing `Escape`


## Additional information:

* Unfortunately the script has to wait for ARK to open and render then close the pin code dialog which takes time, roughly 1250ms (might be dependant on your fps).
If it can run one pin code in this time and there are 9999 pin codes then it will take roughly 3.5 hours to try all of them. However, on average it will find the code in half that time (1.75 hours).
The more people you have running the script at once the faster it is to crack the code; a team of 4 can break the code in roughly 20 mins.
This is only really worth it if you are trying to open metal doors or vaults as it saves you a fair amount of resources. You could be lucky and the victim could of chosen one of the common  pin codes :)

