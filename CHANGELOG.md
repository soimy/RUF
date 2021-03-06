# RUF r231-Release
### New
* Added options to the Combat Fader to allow the player frame to have a different alpha setting if you are below max health.
* Added options to allow for horizontal party and party pet frames.
* Added options to toggle on or off cooldown spirals on auras as well as reversing their direction available in the global aura options.

### Fixes
* Disabling the player cast bar in Classic should no longer cause Lua errors. Hopefully.
* Disabling Arena units no longer causes them to be re-enabled during arena preparation.

### Known Issues
* Portraits in free-floating mode ignore mouse clicks and cannot be used to select units.
* Toggling on and off Test mode while targetting someone can cause the target portrait to scale incorrectly for the rest of that play session (until you relog or reloadUI). Deselecting your target and then toggling Test Mode on and off again should fix it.
* Test mode Auras display only buffs or debuffs the player currently has, rather than creating a bunch of temp icons.
* There is no preview of frame aura highlighting in test mode.