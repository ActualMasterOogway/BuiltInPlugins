game:SetFlagVersion("LuaRibbonSelectInput", 3);
game:DefineFastFlag("LuaRibbonSelectInput", false);
return function() --[[ Line: 4 ]]
    return game:GetFastFlag("LuaRibbonSelectInput");
end;