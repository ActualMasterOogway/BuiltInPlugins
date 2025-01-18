game:DefineFastFlag("EnableAudioCompressorEditorLua", false);
game:DefineFastFlag("LoadAudioCompressorEditorInAssetDM", false);
game:DefineFastInt("Path2DMaxControlPointLimit", 50);
game:DefineFastFlag("ImprovedCursors", false);
return {
    getFFlagEnableEditor = function() --[[ Line: 8 ]] --[[ Name: getFFlagEnableEditor ]]
        return game:GetFastFlag("EnableAudioCompressorEditorLua");
    end, 
    getFFlagLoadInAssetDM = function() --[[ Line: 11 ]] --[[ Name: getFFlagLoadInAssetDM ]]
        return game:GetFastFlag("LoadAudioCompressorEditorInAssetDM");
    end, 
    getFIntPath2DMaxControlPointLimit = function() --[[ Line: 14 ]] --[[ Name: getFIntPath2DMaxControlPointLimit ]]
        return game:GetFastInt("Path2DMaxControlPointLimit");
    end
};