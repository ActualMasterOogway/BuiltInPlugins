local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dash);
local l_some_0 = v1.some;
local l_collectArray_0 = v1.collectArray;
local l_forEach_0 = v1.forEach;
local l_endsWith_0 = v1.endsWith;
local l_concat_0 = table.concat;
local v7 = {
    "RoactInspector%.Classes", 
    "Roact%.createReconciler", 
    "Roact%.Component", 
    "Roact%.SingleEventManager", 
    "Roact%.RobloxRenderer", 
    "Libs%.RoactRodux", 
    "Rodux%.Signal", 
    "Rodux%.Store"
};
return function(v8) --[[ Line: 23 ]] --[[ Name: sanitizeRoactLog ]]
    -- upvalues: l_forEach_0 (copy), l_endsWith_0 (copy), l_collectArray_0 (copy), l_some_0 (copy), v7 (copy), l_concat_0 (copy)
    local v9 = v8:split("\n");
    local v10 = 0;
    l_forEach_0(v9, function(v11) --[[ Line: 26 ]]
        -- upvalues: l_endsWith_0 (ref), v10 (ref)
        if v11:match("Roact.Component") and l_endsWith_0(v11, "function __update") then
            v10 = v10 + 1;
        end;
    end);
    v9 = l_collectArray_0(v9, function(_, v13) --[[ Line: 31 ]]
        -- upvalues: l_some_0 (ref), v7 (ref), l_endsWith_0 (ref)
        local v15 = l_some_0(v7, function(v14) --[[ Line: 32 ]]
            -- upvalues: v13 (copy)
            return v13:match(v14);
        end);
        if v15 then
            if v13:match("Roact%.Component") and l_endsWith_0(v13, "function setState") then
                return "Roact.Component setState";
            elseif v13:match("RoactRodux%.connect") then
                return "Rodux Store updated";
            elseif v13:match("Roact%.SingleEventManager") then
                return "Roact event";
            end;
        end;
        return not v15 and v13 or nil;
    end);
    local v16 = l_concat_0(v9, "\n");
    if v10 > 0 then
        return ("Update chain: %d component(s)\nTrigger:\n%s"):format(v10, v16);
    else
        return v16;
    end;
end;