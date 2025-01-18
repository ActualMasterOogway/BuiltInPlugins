game:SetFlagVersion("LuaStartPageAtomicTestsFixes", 2);
game:DefineFastFlag("LuaStartPageAtomicTestsFixes", false);
return function() --[[ Line: 4 ]]
    return game:GetFastFlag("LuaStartPageAtomicTestsFixes");
end;