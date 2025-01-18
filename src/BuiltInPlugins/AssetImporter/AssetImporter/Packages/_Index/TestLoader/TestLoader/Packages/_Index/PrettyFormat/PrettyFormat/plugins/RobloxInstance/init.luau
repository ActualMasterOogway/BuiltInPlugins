local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_Array_0 = v3.Array;
local l_instanceof_0 = v3.instanceof;
local l_RobloxInstance_0 = require(l_Parent_1.RobloxShared).RobloxInstance;
local l_InstanceSubset_0 = l_RobloxInstance_0.InstanceSubset;
local l_printTableEntries_0 = require(l_Parent_0.Collections).printTableEntries;
local _ = require(l_Parent_0.Types);
local function v39(v11, v12, v13, v14, v15, v16) --[[ Line: 40 ]] --[[ Name: printInstance ]]
    -- upvalues: l_RobloxInstance_0 (copy), l_Object_0 (copy), l_Array_0 (copy), l_getType_0 (copy)
    local v17 = "";
    local l_v11_Children_0 = v11:GetChildren();
    table.sort(l_v11_Children_0, function(v19, v20) --[[ Line: 51 ]]
        return v19.Name < v20.Name;
    end);
    local v21 = l_RobloxInstance_0.listProps(v11);
    local v22 = l_Object_0.keys(v21);
    if not v12.printInstanceDefaults then
        local v23 = l_RobloxInstance_0.listDefaultProps(v11.ClassName);
        local l_v23_0 = v23 --[[ copy: 10 -> 22 ]];
        v22 = l_Array_0.filter(v22, function(v25) --[[ Line: 59 ]]
            -- upvalues: v21 (copy), l_v23_0 (copy)
            return v21[v25] ~= l_v23_0[v25];
        end);
    end;
    table.sort(v22);
    local v26 = #v22 > 0;
    local v27 = #l_v11_Children_0 > 0;
    if v26 or v27 then
        v17 = v17 .. v12.spacingOuter;
        local v28 = v13 .. v12.indent;
        for v29, v30 in ipairs(v22) do
            local v31 = v21[v30];
            if v31 == l_Object_0.None then
                v31 = nil;
            end;
            local v32 = l_getType_0(v31) == "Instance" and 1e999 or v14;
            local v33 = v16(v30, v12, v28, v14, v15);
            local v34 = v16(v31, v12, v28, v32, v15);
            v17 = string.format("%s%s%s: %s", v17, v28, v33, v34);
            if v29 ~= #v22 or v27 then
                v17 = v17 .. "," .. v12.spacingInner;
            elseif not v12.min then
                v17 = v17 .. ",";
            end;
        end;
        for v35, v36 in ipairs(l_v11_Children_0) do
            local v37 = v16(v36.Name, v12, v28, v14, v15);
            local v38 = v16(v36, v12, v28, v14, v15);
            v17 = string.format("%s%s%s: %s", v17, v28, v37, v38);
            if v35 ~= #l_v11_Children_0 then
                v17 = v17 .. "," .. v12.spacingInner;
            elseif not v12.min then
                v17 = v17 .. ",";
            end;
        end;
        v17 = v17 .. v12.spacingOuter .. v13;
    end;
    return v17;
end;
return {
    serialize = function(v40, v41, v42, v43, v44, v45) --[[ Line: 114 ]] --[[ Name: serialize ]]
        -- upvalues: l_instanceof_0 (copy), l_InstanceSubset_0 (copy), l_printTableEntries_0 (copy), v39 (copy)
        v43 = v43 + 1;
        if v41.maxDepth <= v43 then
            return string.format("\"%s\" [%s]", v40.Name, v40.ClassName);
        elseif l_instanceof_0(v40, l_InstanceSubset_0) then
            return v40.ClassName .. " {" .. l_printTableEntries_0(v40.subset, v41, v42, v43, v44, v45) .. "}";
        else
            return v40.ClassName .. " {" .. v39(v40, v41, v42, v43, v44, v45) .. "}";
        end;
    end, 
    test = function(v46) --[[ Line: 135 ]] --[[ Name: test ]]
        -- upvalues: l_getType_0 (copy), l_instanceof_0 (copy), l_InstanceSubset_0 (copy)
        local v47 = true;
        if l_getType_0(v46) ~= "Instance" then
            v47 = l_instanceof_0(v46, l_InstanceSubset_0);
        end;
        return v47;
    end
};