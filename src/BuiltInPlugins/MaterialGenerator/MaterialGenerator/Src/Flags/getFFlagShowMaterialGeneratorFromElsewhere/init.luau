game:DefineFastFlag("ShowMaterialGeneratorFromElsewhere", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("MaterialPickerBetaEnabled") or game:GetFastFlag("ShowMaterialGeneratorFromElsewhere");
end;