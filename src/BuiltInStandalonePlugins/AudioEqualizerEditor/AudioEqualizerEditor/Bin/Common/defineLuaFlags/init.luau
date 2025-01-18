game:DefineFastInt("AudioEqualizerEditorAnalyzerResolution", 100);
game:DefineFastFlag("LoadAudioEqualizerEditorInAssetDM", false);
game:DefineFastInt("Path2DMaxControlPointLimit", 50);
return {
    getFIntAudioEqualizerEditorAnalyzerResolution = function() --[[ Line: 7 ]] --[[ Name: getFIntAudioEqualizerEditorAnalyzerResolution ]]
        return game:GetFastInt("AudioEqualizerEditorAnalyzerResolution");
    end, 
    getFFlagLoadAudioEqualizerEditorInAssetDM = function() --[[ Line: 10 ]] --[[ Name: getFFlagLoadAudioEqualizerEditorInAssetDM ]]
        return game:GetFastFlag("LoadAudioEqualizerEditorInAssetDM");
    end, 
    getFIntPath2DMaxControlPointLimit = function() --[[ Line: 13 ]] --[[ Name: getFIntPath2DMaxControlPointLimit ]]
        return game:GetFastInt("Path2DMaxControlPointLimit");
    end
};