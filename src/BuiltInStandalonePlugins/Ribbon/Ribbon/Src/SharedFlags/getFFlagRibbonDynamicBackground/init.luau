game:SetFlagVersion("RibbonDynamicBackground", 2);
game:DefineFastFlag("RibbonDynamicBackground", false);
return function() --[[ Line: 4 ]]
    return game:GetFastFlag("RibbonDynamicBackground");
end;