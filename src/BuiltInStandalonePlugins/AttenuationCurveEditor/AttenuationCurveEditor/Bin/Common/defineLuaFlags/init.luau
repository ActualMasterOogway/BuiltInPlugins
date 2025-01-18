game:DefineFastFlag("LoadAttenuationCurveEditorInAssetDM", false);
game:DefineFastInt("AudioEmitterDistanceAttenuationMaxPoints", 400);
game:DefineFastInt("Path2DMaxControlPointLimit", 50);
game:DefineFastFlag("ImprovedCursors", false);
return {
    getFFlagLoadAttenuationCurveEditorInAssetDM = function() --[[ Line: 8 ]] --[[ Name: getFFlagLoadAttenuationCurveEditorInAssetDM ]]
        return game:GetFastFlag("LoadAttenuationCurveEditorInAssetDM");
    end, 
    getFIntDistanceAttenuationMaxPoints = function() --[[ Line: 11 ]] --[[ Name: getFIntDistanceAttenuationMaxPoints ]]
        return game:GetFastInt("AudioEmitterDistanceAttenuationMaxPoints");
    end, 
    getFIntPath2DMaxControlPointLimit = function() --[[ Line: 14 ]] --[[ Name: getFIntPath2DMaxControlPointLimit ]]
        return game:GetFastInt("Path2DMaxControlPointLimit");
    end
};