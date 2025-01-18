game:DefineFastFlag("MaterialPickerInstantTooltip", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("MaterialPickerBetaEnabled") or game:GetFastFlag("MaterialPickerInstantTooltip");
end;