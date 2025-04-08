> [!IMPORTANT]
> cfgInstaller will never be paid, and configs WILL most likely be out-of-date.
> cfgInstaller will always stay open-source
> CatVape support will soon require 3 arguments in the future to run the script. (user, pass, dev)

## Contacts
[YouTube](https://youtube.com/@stavexploitz)

## Supported Scripts
1. [Vape](https://github.com/7GrandDadPGN/VapeV4ForRoblox)
2. [Night](https://discord.gg/Nt4BnPnYPB)
3. [AlSploit](https://discord.gg/BgaPWbrjyJ)
4. [Moon](https://discord.gg/GyKEDmVkPQ)
5. [Aurora](https://github.com/cocotv666/Aurora) -- support for solara, pasted
6. [Flux](https://discord.gg/X4T9HrK2ge)
7. [Modified Flux](https://github.com/sstvskids/Flux) -- has support for solara + installer
8. [Polaris](https://github.com/sstvskids/Polaris) -- support for installer, lack of mobile support
9. [Polaris Rewrite](https://github.com/sstvskids/PolarisRewrite) -- has support for solara and bedwars + installer

## Supported Vape Customs (beta)
Vape customs that use different directorys ('newvape' --> 'lunar', 'oldvape', 'skid', 'vpp', 'rise', 'cat') -- vpp = voidpaste packet
To use this put this above your vape config of choice
```luau
getgenv().customvape = 'lunar' -- oldvape, skid
```
1. [Lunar (beta)](https://discord.gg/4e7CJCxGE6)
2. [Skid (beta + discontinued)](https://github.com/skidvape/SkidForRoblox)
3. [Old-Skid (discontinued)](https://github.com/sstvskids/SkidVapeForRoblox)
4. Old-Vape (use old skid for archive)
5. [Voidware](https://github.com/VapeVoidware/)
6. [CatVape](https://discord.gg/CUW3TPH8sg)

## Usage
1. Download the specific scripting utility of your choice.
2. Execute the provided loadstring below, whilst choosing a config.
```luau
getgenv().cfg = 'Sunlight' -- {alsploit-cfg1 or Sunlight or moon-stav or kardes or night-stav}
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
<br/>
[7GrandDad](https://github.com/7GrandDadPGN) - Wrote the README - vaperoblox on Discord
