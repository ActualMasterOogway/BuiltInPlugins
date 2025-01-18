game:SetFlagVersion("LuaStartPageNetworkCache", 3);
game:DefineFastFlag("LuaStartPageNetworkCache", false);
return function() --[[ Line: 4 ]]
    return game:GetFastFlag("LuaStartPageNetworkCache");
end;