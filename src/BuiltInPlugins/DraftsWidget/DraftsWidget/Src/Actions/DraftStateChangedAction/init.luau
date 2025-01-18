local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(script.Parent.Action);
local v2 = require(l_Parent_0.Src.Symbols.AutosaveState);
local v3 = require(l_Parent_0.Src.Symbols.CommitState);
local v4 = require(l_Parent_0.Src.Symbols.DraftState);
local _ = function(v5, v6) --[[ Line: 11 ]] --[[ Name: dictContains ]]
    for _, v8 in pairs(v5) do
        if v8 == v6 then
            return true;
        end;
    end;
    return false;
end;
return v1(script.Name, function(v10, v11, v12) --[[ Line: 24 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v13 = false;
    local v14 = false;
    local v15 = false;
    local v16 = tostring(v11);
    local v17 = tostring(v12);
    local v18 = typeof(v10);
    assert(v18 == "Instance", "Expected draft to be Instance. Got '" .. v18 .. "'");
    assert(v10:IsA("LuaSourceContainer"), "Expected draft to be a LuaSourceContainer. Got '" .. v10.ClassName .. "'");
    local v19;
    for _, v21 in pairs(v4) do
        if v21 == v11 then
            v19 = true;
            v13 = true;
        end;
        if v13 then
            break;
        end;
    end;
    if not v13 then
        v19 = false;
    end;
    v13 = false;
    assert(v19 ~= nil, "Expected valid DraftState. Got '" .. v16 .. "'");
    if v11 == v4.Outdated or v11 == v4.Deleted then
        assert(typeof(v12) == "boolean", "Expected type boolean for state type " .. v16 .. ". Got '" .. v17 .. "'");
    elseif v11 == v4.Autosaved then
        local v22;
        for _, v24 in pairs(v2) do
            if v24 == v12 then
                v22 = true;
                v14 = true;
            end;
            if v14 then
                break;
            end;
        end;
        if not v14 then
            v22 = false;
        end;
        v14 = false;
        assert(v22, "Expected valid " .. v16 .. ". Got '" .. v17 .. "'");
    elseif v11 == v4.Committed then
        local v25;
        for _, v27 in pairs(v3) do
            if v27 == v12 then
                v25 = true;
                v15 = true;
            end;
            if v15 then
                break;
            end;
        end;
        if not v15 then
            v25 = false;
        end;
        v15 = false;
        assert(v25, "Expected valid " .. v16 .. ". Got '" .. v17 .. "'");
    end;
    return {
        Draft = v10, 
        StateType = v11, 
        StateValue = v12
    };
end);