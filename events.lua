--   Owner(s): Scott Bilas, Shane Whitfield
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/events.lua#26 $
--
-- These are the permitted event function names for go's to respond to. This
-- table is a safety check against Evil.
------------------------------------------------------------------------------

luamgr.goeventnames = {

-- system events (only scott should mess with these!)

on_abandoned=1,               -- [bool waswaiting] called when a waiting lua script is abandoned, so it can clean up
on_label=1,                   -- [string label] arbitrary messaging mechanism
on_timer=1,                   -- [string name, int timescalled] called when a timer expires, includes # times this timer has expired so far
on_postload=1,                -- [] called at postload event, after all c++ postload code has run
on_addtoworld=1,              -- [] called at onaddtoworld event, after all c++ onaddtoworld code has run
on_removefromworld=1,         -- [] called at onremovefromworld event, after all c++ onremovefromworld code has run
on_animtag=1,          	      -- [string animname, string tag] called when an animation tag fires

-- game events

on_break=1,                   -- [BRKS newBrk] called when the break state value changes
on_triggered=1,               -- [CGo triggeree] called when a trigger has been triggered
on_triggerenter=1,            -- [CGo triggeree] called when the trigger object enters the trigger area
on_triggerexit=1,             -- [CGo triggeree] called when the trigger object exits the trigger area
on_triggerreset=1,            -- [] called when the trigger is reset
on_pounced=1,                 -- [CGo damagedealer] called when a tornado entity takes pounce damage
on_death=1,                   -- [CGoTornado killer] called at tornado entity death
on_tornadorankchanged=1,      -- [CGoTornado tornado, s32 newrank, s32 lastrank] called when the tornado changes ranks
on_spawnpointwarped=1,        -- [CGoTransform warpmeobj] called when an objected is warped to a spawn point
on_childtriggered=1,          -- [CGoTrigger childtrigger] called when a parent trigger's child is trigger. This is called on the parent trigger.
on_inidle=1,                  -- [] called on an entity when begingn to idle
on_inalert=1,                 -- [] called on an entity when beginng to alert
on_inpanic=1,                 -- [] called on an entity when beginng to panic
on_atpathend=1,               -- [CGoPath path] called when an transform gets to the end of it's path spline. [could be looping]
on_derail=1,                  -- [] called when a mobilerailed object gets derailed by a triggersplinederailer
on_derailedgroundhit=1,       -- [] called when a mobilerailed object hits the ground after being derailed
on_collected=1,               -- [CGoTornado collector] called when a collectible is collected
on_gameplaymodulesetup=1,     -- [] called when a gameplay module is needed to setup prior to activation
on_gameplaymoduleactive=1,    -- [s32 resetcount] called when a gameplay module is activated
on_gameplaymoduleupdate=1,    -- [] called when a gameplay module needs to be updated
on_gameplaymodulecomplete=1,  -- [bool succeeded] called when a gameplay module has completed
on_growmissiontimeout=1,      -- [] called when a grow mission times out
on_growmissiontargetreached=1, -- [] called when a grow mission has reached its target
on_bossaction=1,              -- [string label, unknown??] boss events
on_spritespawned=1,			  -- [CGoTornado tornado] called when a fire sprite is spawned
on_spritegrabbed=1,			  -- [CGoTornado tornado] called when a fire sprite is grabbed
on_spritecollected=1,		  -- [CGoTornado tornado] called when a fire sprite is collected
on_spriteescaped=1,			  -- [CGoTornado tornado] called when a fire sprite escapes without being collected
on_initiategrab=1,			  -- [] called when a tornado initiates the grab [vacuum] move
on_cashgrabbedsprites=1,	  -- [s32 numofsprites] called when a tornado cashes out its grabbed sprites
on_cleanupspritegrab=1,		  -- [] called when a tornado ends a grab move unexpectedly
on_refreshgrab=1,			  -- [] called when a tornado renews its grab timer by grabbing an additional sprite
on_scalechange=1,			  -- [f32 scale] called when a sprite changes its display scale
on_raceaction=1,              -- [string label] actions called by the trigger race
on_poundaction=1,             -- [string label, CGoTornado tornado] called when a tornado does anything pounce or jump related
on_rockhit=1,				  -- [CGoTornado hittingtornado] called when a tornado hits a rock sprite during the pound minigame
on_watersprintprep=1,		  -- [] called on dragged water sprite during the water sprint prep
on_watersprintfail=1,		  -- [] called on water sprites when a tornado fails a water sprint
on_shieldaction=1,            -- [string label] called when the shield turns on or off
}

------------------------------------------------------------------------------
