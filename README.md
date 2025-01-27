# Nogeese InfoKit
Nogeese InfoKit is a management kit with lots of features and Nogeese Linux will come with it preinstalled.
### InfoStack
A new way of managing packages and programs.
### InfoPac
Manages InfoStack packages, and installs them with URLs.
### GZ
Same as InfoPac, but like traditional package managers, it installs it from a repo. 
### InfoOctopi (Coming soon)
Graphical InfoStack manager.
## Installation
Needs CURL, run this:

```
curl -sSL https://raw.githubusercontent.com/leon8326-nogeese/InfoKit/main/installer/installer.sh >> installer.sh
```

and then for system-wide installation (requires sudo access):

```
sudo bash installer.sh --system
```

or for user-wide installation:

```
bash installer.sh --user
```

and remove the file:

```
rm -rf installer.sh
```

To do this in a chain run this:

For system-wide installation (requires sudo access):

```
curl -sSL https://raw.githubusercontent.com/leon8326-nogeese/InfoKit/main/installer/installer.sh >> installer.sh && sudo bash installer.sh --system && rm -rf installer.sh
```

For user-wide installation:

```
curl -sSL https://raw.githubusercontent.com/leon8326-nogeese/InfoKit/main/installer/installer.sh >> installer.sh && bash installer.sh --user && rm -rf installer.sh
```
