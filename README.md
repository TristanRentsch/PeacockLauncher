# PeacockLauncher
Are you sick of searching through your folders to launch Peacock every time you want to play Hitman 3? Well this script is for you! It automatically launches the Peacock server and patcher every time you launch Hitman 3. In addition, it kills old instances of Peacock server and patcher to prevent annoying conflicts if you forget to close them when relaunching the game.

### How to Install:
1. [Download Peacock](https://thepeacockproject.org/) from the official website and follow its installation guide.
2. Download PeacockLauncher and place the `.bat` file in your Hitman 3 common folder.
3. Open Steam, go to Himan 3 properties, and enter the following under Launch Options: `Peacock.bat "{Peacock Folder Path}" %COMMAND%`. Make sure you replace `{Peacock Folder Path}` with the full path to the folder containing `PeacockPatcher.exe` and `StartServer.cmd`. Don't delete the quotation marks.

*If you changed the port hosting your Peacock server from 80, open `PeacockLauncher.bat` with your favorite text editor and change `serverPort` to the port you changed it to.
