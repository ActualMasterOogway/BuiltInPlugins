local v0 = {
    LockControl = "R", 
    Undo = "Ctrl+Z", 
    Redo = "Ctrl+Y"
};
local _ = function(_, v2, v3, v4) --[[ Line: 13 ]] --[[ Name: makeAction ]]
    local v5 = v4 ~= "" and v4 or nil;
    return {
        id = v3, 
        text = v2:getText("Actions", v3), 
        defaultShortcut = v5, 
        allowBinding = false
    };
end;
return function(_, v8) --[[ Line: 23 ]]
    -- upvalues: v0 (copy)
    local v9 = {};
    for v10, v11 in pairs(v0) do
        local l_v11_0 = v11;
        local v13 = l_v11_0 ~= "" and l_v11_0 or nil;
        v9[v10] = {
            id = v10, 
            text = v8:getText("Actions", v10), 
            defaultShortcut = v13, 
            allowBinding = false
        };
    end;
    return v9;
end;