game:DefineFastFlag("CLI_109818", false);
game:DefineFastFlag("LoadDirectionalCurveEditorInAssetDM", false);
game:DefineFastInt("AudioEmitterDistanceAttenuationMaxPoints", 400);
game:DefineFastInt("DirectionalAttenuationMaxPoints", 400);
game:DefineFastFlag("CLI_122163", false);
return {
    getFFlagCLI_109818 = function() --[[ Line: 9 ]] --[[ Name: getFFlagCLI_109818 ]]
        return game:GetFastFlag("CLI_109818");
    end, 
    getFFlagLoadDirectionalCurveEditorInAssetDM = function() --[[ Line: 12 ]] --[[ Name: getFFlagLoadDirectionalCurveEditorInAssetDM ]]
        return game:GetFastFlag("LoadDirectionalCurveEditorInAssetDM");
    end, 
    getFIntDistanceAttenuationMaxPoints = function() --[[ Line: 15 ]] --[[ Name: getFIntDistanceAttenuationMaxPoints ]]
        return game:GetFastInt("AudioEmitterDistanceAttenuationMaxPoints");
    end, 
    getFIntDirectionalAttenuationMaxPoints = function() --[[ Line: 18 ]] --[[ Name: getFIntDirectionalAttenuationMaxPoints ]]
        return game:GetFastInt("DirectionalAttenuationMaxPoints");
    end, 
    getFFlagCLI_122163 = function() --[[ Line: 21 ]] --[[ Name: getFFlagCLI_122163 ]]
        return game:GetFastFlag("CLI_122163");
    end
};