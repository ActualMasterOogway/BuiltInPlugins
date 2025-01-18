game:SetFlagVersion("LuaStartPageFixLastViewed", 2);
game:DefineFastFlag("LuaStartPageFixLastViewed", false);
return function() --[[ Line: 4 ]]
    return game:GetFastFlag("LuaStartPageFixLastViewed");
end;