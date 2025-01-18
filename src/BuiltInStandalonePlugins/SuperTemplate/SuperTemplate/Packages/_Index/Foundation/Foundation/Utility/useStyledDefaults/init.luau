local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local _ = require(l_script_FirstAncestor_0.StyleSheet.StyleSheet);
local v5 = require(script.Parent.styleMappings);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.useRules);
local v7 = require(l_script_FirstAncestor_0.Utility.getFormattedTags);
local function v15(v8, v9, v10) --[[ Line: 15 ]] --[[ Name: applyRule ]]
    -- upvalues: v5 (copy)
    local v11 = v8.pseudo or "GuiObject";
    for v12, v13 in v8.properties do
        local v14 = v5[v11][v12];
        if v14.filter == nil or v14.filter == v10 then
            if type(v14.property) == "table" then
                if v9[v14.property.table] == nil then
                    v9[v14.property.table] = {};
                end;
                v9[v14.property.table][v14.property.key] = v13;
            elseif type(v14.property) == "string" then
                v9[v14.property] = v13;
            else
                error((("Invalid mapping type %* %*"):format(v11, v12)));
            end;
        end;
    end;
    return v9;
end;
local function v21(v16, v17, v18, v19) --[[ Line: 41 ]] --[[ Name: applyRules ]]
    -- upvalues: v15 (copy)
    if v16 then
        for v20 in string.gmatch(v16, "%S+") do
            if v17[v20] then
                v15(v17[v20], v18, v19);
            end;
        end;
    end;
end;
local function v28(v22, v23) --[[ Line: 51 ]] --[[ Name: applyDefaults ]]
    for v24, v25 in v23 do
        if typeof(v25) == "table" and typeof(v22[v24]) == "table" then
            for v26, _ in pairs(v25) do
                v22[v24][v26] = v25[v26];
            end;
        else
            v22[v24] = v25;
        end;
    end;
end;
return function(v29, v30, v31, v32) --[[ Line: 63 ]] --[[ Name: useStyledDefaults ]]
    -- upvalues: v6 (copy), v2 (copy), v21 (copy), v7 (copy), v28 (copy)
    local v33 = v6();
    return v2.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v21 (ref), v31 (copy), v33 (copy), v29 (copy), v7 (ref), v30 (copy), v28 (ref), v32 (copy)
        local v34 = {};
        v21(v31, v33, v34, v29);
        local v35 = v7(v30);
        v21(v35, v33, v34, v29);
        v28(v34, v32);
        return v34;
    end, {
        v30, 
        v31, 
        v32, 
        v29, 
        v33
    });
end;