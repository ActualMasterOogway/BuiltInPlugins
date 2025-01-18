game:defineFastFlag("MaterialPickerUIChanges", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("MaterialPickerBetaEnabled") or game:GetFastFlag("MaterialPickerUIChanges");
end;