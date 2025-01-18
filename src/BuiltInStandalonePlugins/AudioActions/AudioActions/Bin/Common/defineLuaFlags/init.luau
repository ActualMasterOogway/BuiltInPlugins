game:SetFlagVersion("EnableAudioActions", 2);
game:DefineFastFlag("EnableAudioActions", false);
game:DefineFastFlag("EnableAudioActionFindPlaying", false);
game:DefineFastFlag("EnableAudioActionInsert", false);
game:DefineFastFlag("EnableAudioActionInsertFrom", false);
game:DefineFastFlag("EnableAudioActionMainVolume", false);
game:DefineFastFlag("EnableAudioActionMigrateSounds", false);
game:DefineFastFlag("EnableAudioActionSelect", false);
game:DefineFastFlag("EnableAudioActionWireUp", false);
return {
    getFFlagEnableAudioActions = function() --[[ Line: 13 ]] --[[ Name: getFFlagEnableAudioActions ]]
        return game:GetFastFlag("EnableAudioActions");
    end, 
    getFFlagEnableAction = function(v0) --[[ Line: 17 ]] --[[ Name: getFFlagEnableAction ]]
        return game:GetFastFlag("EnableAudioAction" .. v0);
    end
};