local v0 = {
    Summary = "Summary", 
    CharacterConversion = "CharacterConversion", 
    AnimationConversion = "AnimationConversion", 
    ScriptConversion = "ScriptConversion"
};
v0.getAllTabsData = function(v1, v2) --[[ Line: 14 ]] --[[ Name: getAllTabsData ]]
    -- upvalues: v0 (copy)
    local v3 = {
        v0.Summary, 
        v0.CharacterConversion, 
        v0.AnimationConversion, 
        v0.ScriptConversion
    };
    local v4 = {};
    for _, v6 in v3 do
        table.insert(v4, {
            Tooltip = v1:getText("Tabs", v6), 
            Key = v6, 
            Icon = string.format("rbxasset://textures/R15Migrator/Icon_%sTab.png", v6), 
            Disabled = if v2 then not v2(v6) else false
        });
    end;
    return v4;
end;
v0.findTabData = function(v7, v8) --[[ Line: 30 ]] --[[ Name: findTabData ]]
    for _, v10 in v8 do
        if v10.Key == v7 then
            return v10;
        end;
    end;
    return nil;
end;
return v0;