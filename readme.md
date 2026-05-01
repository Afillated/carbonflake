# Carbonflake


A repository for my nixos configuration, this uses flakes(they really shouldn't be experimental imo) and hjem instead of home manager because its simpler, faster and is multi-user by default.


## Flake File Hierarchy


I settled on something that made sense to me, with a little inspiration from my friend's [hauntedcupoftea's](https://github.com/hauntedcupoftea) [hauntedcupof.dotfiles](https://github.com/hauntedcupoftea/hauntedcupofdotfiles).


- The parent modules are actually in the root directory of the flake, with subdirectories for children modules for modularilty(lotta modules). The hosts are also in the root directory of the flake but I plan to change that someday

- The config folder holds my configuration for all the applications/programs that I have set in stone for now. I plan to change how this works but have not got many ideas, maybe I will do it like I have done under [system/WM/niri](https://github.com/Afillated/carbonflake/tree/main/system/WM/niri).

- Apps, Gaming, Development, System hold respective modules for respective things(drivers, game launchers, etc.).


## My quickshell config?


My quickshell configuration is in another repo [here](https://github.com/Afillated/quickshell-carbonflake). I still haven't found a good way to manage it since I need to update fairly often now.


## Should you use this?


Probably not, this is a rather simple flake someone can cook up pretty quick. I am new to this(not really I am just dumb)


## Special Thanks


- [Vimjoyer](https://www.youtube.com/@vimjoyer) for teaching the basic of nix and nixos

- [hauntedcupoftea](https://github.com/hauntedcupoftea) for introducing me to the world of linux and showing me the cool and shit. And helping me(alot)

- [Pewdiepie's Linux video](https://www.youtube.com/watch?v=pVI_smLgTY0) for being the final push I needed to install linxu, I started with nixos on the recomendation of hauntedcupoftea(he does like to troll like that)
