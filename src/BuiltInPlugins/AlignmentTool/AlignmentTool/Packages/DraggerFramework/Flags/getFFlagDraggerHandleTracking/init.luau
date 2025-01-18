game:SetFlagVersion("DraggerHandleTracking", 2);
game:DefineFastFlag("DraggerHandleTracking", false);
return function() --[[ Line: 4 ]]
    return game:GetFastFlag("DraggerHandleTracking");
end;