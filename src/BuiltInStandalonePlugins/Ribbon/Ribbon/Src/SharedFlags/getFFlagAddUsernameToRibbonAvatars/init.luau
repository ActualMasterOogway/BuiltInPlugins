game:SetFlagVersion("AddUsernameToRibbonAvatars", 3);
game:DefineFastFlag("AddUsernameToRibbonAvatars", false);
return function() --[[ Line: 4 ]]
    return game:GetFastFlag("AddUsernameToRibbonAvatars");
end;