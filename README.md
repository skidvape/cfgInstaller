> [!WARNING]
> cfgInstaller might not HAVE the latest up-to date configs

## Contacts
[YouTube](https://youtube.com/@stavexploitz)

## Usage
1. Download the specific scripting utility of your choice.
2. Execute the provided loadstring below.
```luau
getgenv().cfg = 'Sunlight' -- only avaliable one rn
loadstring(game:HttpGet('https://raw.githubusercontent.com/skidvape/cfgInstaller/refs/heads/main/installer.luau'))()
```

## Possible Issues
Half of the time its usually the scripting utility at fault, please make sure the utility meets certain quality standards such as.
1. Supporting file functions.
2. Not implementing lua generated / half baked versions of such functions resulting in unintended behavior.
3. Maintaing the same behavior across all usages of said functions.
### User Issues
If its not the supposed utility at fault, please try some troubleshooting steps.
1. Deleting the script folder (WITH THE GAME CLOSED).
2. Making sure you have connection to [the main loadstring.](https://raw.githubusercontent.com/skidvape/cfgInstaller/refs/heads/main/installer.luau)
3. Ensuring no external script is conflicting with cfgInstaller.

## Developers & Credits
[stav](https://github.com/sstvskids) - Lead maintainer of the project - ._stav on Discord
[7GrandDad](https://github.com/7GrandDadPGN) - Wrote the README - vaperoblox on Discord