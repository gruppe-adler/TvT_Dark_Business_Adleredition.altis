# TvT_Dark_Business_Adleredition.altis

This is an implementation of the **Dark Business** scenario [Awoihjaweohr created for ShackTac](http://dslyecxi.com/articles_wp/dark-business/) .

## Mission setup

There are three factions: BLUFOR, OPFOR and IND, who spawn at their respective bases in about equal numbers.
The only exception is a BLUFOR pilot who spawns without gear at the IND base (from here on referred to as "hostage")

OPFOR and IND own a small number of soft, unarmed vehicles.
BLUFOR owns an unarmed helicopter.
OPFOR owns one ammo truck.

Local time is sometime in the night. BLUFOR have fancy shit (GPS, NVG), whereas OFPOR and IND are happy to use flashlights.

## Objectives

* BLUFOR: get the hostage to the BLUFOR base (alive)
* OPFOR: get the hostage back to the OPFOR base (alive) 
* IND: get OPFOR's ammo truck to the IND  base (alive)


## Details

### equipment

* iron sights only
* 40mm flares & chemlights for every side
* BLU:
    * one helicopter (MH-9)
    * night vision
* OPF, IND:    
    * no night vision
    * flash lights
    * a few light vehicles available for IND and OPF


### slot setup

On every side, slots are organized for one Platoon as per Dslyecxi's TTP2.
Additionally, BLU has 2 pilot slots for their MH-9, plus one slot for the captured pilot / hostage.

## admin

There are no triggers.
There are some global variables that track the respective sides' main objective:

```
OBJECTIVE_STATE_BLUFOR = 'CREATED';
OBJECTIVE_STATE_IND = 'CREATED';
OBJECTIVE_STATE_OPFOR = 'CREATED';
```

Possible states are : `CREATED|CANCELED|SUCCEEDED|FAILED`

To end the mission, the following commands may be executed *on the server*  (by a server admin on the console, obviously): 

* `call DB_updateTasks;` : publishes the global variables and updates the players' local tasks accordingly and
* `call DB_endMission;` : ends the mission for each  player according to their local task state .

There are scripts that monitor the main objectives and update the task globals accordingly. If that breaks down for some reason, or to react to unusual things happening, you can set the globals manually to any state you wish, and then call the functions mentioned above.
