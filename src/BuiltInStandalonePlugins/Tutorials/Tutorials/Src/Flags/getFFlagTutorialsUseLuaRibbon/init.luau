game:SetFlagVersion("TutorialsUseLuaRibbon", 2);
game:DefineFastFlag("TutorialsUseLuaRibbon", false);
return function() --[[ Line: 12 ]] --[[ Name: getFFlagTutorialsUseLuaRibbon ]]
    return game:GetFastFlag("TutorialsUseLuaRibbon") and game:GetFastFlag("EnableRibbonPlugin");
end;