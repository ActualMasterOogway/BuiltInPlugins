local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local l_instanceof_0 = require(l_Parent_1.LuauPolyfill).instanceof;
local l_RobloxInstance_0 = require(l_Parent_1.RobloxShared).RobloxInstance;
local l_getRobloxProperties_0 = l_RobloxInstance_0.getRobloxProperties;
local l_InstanceSubset_0 = l_RobloxInstance_0.InstanceSubset;
local l_printTableEntries_0 = require(l_Parent_0.Collections).printTableEntries;
local _ = require(l_Parent_0.Types);
local function v29(v9, v10, v11, v12, v13, v14) --[[ Line: 25 ]] --[[ Name: printInstance ]]
    -- upvalues: l_getRobloxProperties_0 (copy), l_getType_0 (copy)
    local v15 = "";
    local l_v9_Children_0 = v9:GetChildren();
    table.sort(l_v9_Children_0, function(v17, v18) --[[ Line: 36 ]]
        return v17.Name < v18.Name;
    end);
    local v19 = l_getRobloxProperties_0(v9.ClassName);
    if #v19 > 0 or #l_v9_Children_0 > 0 then
        v15 = v15 .. v10.spacingOuter;
        local v20 = v11 .. v10.indent;
        for v21, v22 in ipairs(v19) do
            local v23 = v14(v22, v10, v20, v12, v13);
            local v24 = v9[v22];
            v24 = if l_getType_0(v24) == "Instance" then v14(v24, v10, v20, 1e999, v13) else v14(v24, v10, v20, v12, v13);
            v15 = string.format("%s%s%s: %s", v15, v20, v23, v24);
            if v21 < #v19 or #l_v9_Children_0 > 0 then
                v15 = v15 .. "," .. v10.spacingInner;
            elseif not v10.min then
                v15 = v15 .. ",";
            end;
        end;
        for v25, v26 in ipairs(l_v9_Children_0) do
            local v27 = v14(v26.Name, v10, v20, v12, v13);
            local v28 = v14(v26, v10, v20, v12, v13);
            v15 = string.format("%s%s%s: %s", v15, v20, v27, v28);
            if v25 < #l_v9_Children_0 then
                v15 = v15 .. "," .. v10.spacingInner;
            elseif not v10.min then
                v15 = v15 .. ",";
            end;
        end;
        v15 = v15 .. v10.spacingOuter .. v11;
    end;
    return v15;
end;
return {
    serialize = function(v30, v31, v32, v33, v34, v35) --[[ Line: 87 ]] --[[ Name: serialize ]]
        -- upvalues: l_instanceof_0 (copy), l_InstanceSubset_0 (copy), l_printTableEntries_0 (copy), v29 (copy)
        v33 = v33 + 1;
        if v31.maxDepth <= v33 then
            return string.format("\"%s\" [%s]", v30.Name, v30.ClassName);
        elseif l_instanceof_0(v30, l_InstanceSubset_0) then
            return v30.ClassName .. " {" .. l_printTableEntries_0(v30.subset, v31, v32, v33, v34, v35) .. "}";
        else
            return v30.ClassName .. " {" .. v29(v30, v31, v32, v33, v34, v35) .. "}";
        end;
    end, 
    test = function(v36) --[[ Line: 108 ]] --[[ Name: test ]]
        -- upvalues: l_getType_0 (copy), l_instanceof_0 (copy), l_InstanceSubset_0 (copy)
        local v37 = true;
        if l_getType_0(v36) ~= "Instance" then
            v37 = l_instanceof_0(v36, l_InstanceSubset_0);
        end;
        return v37;
    end
};