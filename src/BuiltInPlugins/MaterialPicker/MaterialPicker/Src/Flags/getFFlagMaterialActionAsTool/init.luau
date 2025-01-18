game:DefineFastFlag("MaterialActionAsTool", false);
game:DefineFastFlag("MaterialPickerBetaEnabled", false);
return function() --[[ Line: 4 ]]
    return game:GetFastFlag("MaterialActionAsTool") and game:GetFastFlag("MaterialPickerBetaEnabled");
end;