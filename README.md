[![Build Status](https://travis-ci.org/gruppe-adler/TvT_Dark_Business_Adleredition.altis.svg)](https://travis-ci.org/gruppe-adler/TvT_Dark_Business_Adleredition.altis)

***TvT_Dark_Business_Adleredition.altis***

This is an implementation of the **Dark Business** scenario [Awoihjaweohr created for ShackTac](http://dslyecxi.com/articles_wp/dark-business/) .

All actors are human. There are **no** AI units in this scenario.

# Scenario details

Players are split into three factions: BLU, RED and GREEN. They spawn at their respective headquarters within their own areas that are off-limit to the other factions.
The only exception is a BLU pilot (from here on referred to as "HOSTAGE") who spawns without gear at the GREEN base as prisoner of GREEN.

Local time is sometime in the night.

## Equipment

* assault rifles, machine guns
	* no magnifying scopes
	* no 40mm HE
* 40mm flares, chemlights and flashlights for all factions
* both short and long range radios (TFAR)
	* radios are encrypted
* BLU:
    * one MH-6 unarmed helicopter
    * night vision and gps
* RED, GREEN:    
    * a few light wheeled vehicles
* RED:
    * one fuel truck

## Slot setup

On every side, slots are organized for one Platoon roughly as per Dslyecxi's TTP2.
Additionally, BLU has 2 pilot slots for their MH-6, plus one slot for the captured pilot / hostage.

## Objectives

* everyone: stay alive
* BLU: get the HOSTAGE to the BLU base
* RED: get the HOSTAGE into RED territory alive
* GREEN: get RED's fuel truck into GREEN territory
* HOSTAGE: Arrive at the BLU base alive

## Execution

Side leads are free on how to approach their objective.

### Hint

* A bit of cooperation among the parties can be helpful. This may require not shooting each other at first sight.
* Radios are encrypted. You wont be able to dial the other side's number. You'll have to go out and find each other to talk to them.

## End of scenario, spectator

There is no respawn. Dead players enter an unrestricted spectator mode.

Due to the nature of the objectives, some players may already unreversably have lost, while others still fight to reach their objectives.


# For admins

Logged-in admin has Zeus-capabilities to act as technical support if necessary.

There are no mission end triggers.
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

There are scripts that monitor the main objectives and update the task globals accordingly.
If that breaks down for some reason, or to react to unusual things happening,
you can set the globals manually to any state you wish, and then call the functions mentioned above.
