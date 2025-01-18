local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_instanceof_0 = v3.instanceof;
local l_RobloxInstance_0 = require(l_Parent_1.RobloxShared).RobloxInstance;
local l_getRobloxProperties_0 = l_RobloxInstance_0.getRobloxProperties;
local l_getRobloxDefaults_0 = l_RobloxInstance_0.getRobloxDefaults;
local l_InstanceSubset_0 = l_RobloxInstance_0.InstanceSubset;
local l_printTableEntries_0 = require(l_Parent_0.Collections).printTableEntries;
local _ = require(l_Parent_0.Types);
local function v36(v12, v13, v14, v15, v16, v17) --[[ Line: 41 ]] --[[ Name: printInstance ]]
    -- upvalues: l_getRobloxProperties_0 (copy), l_getRobloxDefaults_0 (copy), l_Array_0 (copy), l_getType_0 (copy)
    local v18 = "";
    local l_v12_Children_0 = v12:GetChildren();
    table.sort(l_v12_Children_0, function(v20, v21) --[[ Line: 52 ]]
        return v20.Name < v21.Name;
    end);
    local v22 = nil;
    local v23 = nil;
    if v13.printInstanceDefaults then
        v22 = l_getRobloxProperties_0(v12.ClassName);
    else
        local v24, v25 = l_getRobloxDefaults_0(v12.ClassName);
        v23 = v24;
        v22 = v25;
    end;
    if not v13.printInstanceDefaults then
        v22 = l_Array_0.filter(v22, function(v26) --[[ Line: 64 ]]
            -- upvalues: v23 (ref), v12 (copy)
            return v23[v26] ~= v12[v26];
        end);
    end;
    if #v22 > 0 or #l_v12_Children_0 > 0 then
        v18 = v18 .. v13.spacingOuter;
        local v27 = v14 .. v13.indent;
        for v28, v29 in ipairs(v22) do
            local v30 = v17(v29, v13, v27, v15, v16);
            local v31 = v12[v29];
            v31 = if l_getType_0(v31) == "Instance" then v17(v31, v13, v27, 1e999, v16) else v17(v31, v13, v27, v15, v16);
            v18 = string.format("%s%s%s: %s", v18, v27, v30, v31);
            if v28 < #v22 or #l_v12_Children_0 > 0 then
                v18 = v18 .. "," .. v13.spacingInner;
            elseif not v13.min then
                v18 = v18 .. ",";
            end;
        end;
        for v32, v33 in ipairs(l_v12_Children_0) do
            local v34 = v17(v33.Name, v13, v27, v15, v16);
            local v35 = v17(v33, v13, v27, v15, v16);
            v18 = string.format("%s%s%s: %s", v18, v27, v34, v35);
            if v32 < #l_v12_Children_0 then
                v18 = v18 .. "," .. v13.spacingInner;
            elseif not v13.min then
                v18 = v18 .. ",";
            end;
        end;
        v18 = v18 .. v13.spacingOuter .. v14;
    end;
    return v18;
end;
return {
    serialize = function(v37, v38, v39, v40, v41, v42) --[[ Line: 115 ]] --[[ Name: serialize ]]
        -- upvalues: l_instanceof_0 (copy), l_InstanceSubset_0 (copy), l_printTableEntries_0 (copy), v36 (copy)
        v40 = v40 + 1;
        if v38.maxDepth <= v40 then
            return string.format("\"%s\" [%s]", v37.Name, v37.ClassName);
        elseif l_instanceof_0(v37, l_InstanceSubset_0) then
            return v37.ClassName .. " {" .. l_printTableEntries_0(v37.subset, v38, v39, v40, v41, v42) .. "}";
        else
            return v37.ClassName .. " {" .. v36(v37, v38, v39, v40, v41, v42) .. "}";
        end;
    end, 
    test = function(v43) --[[ Line: 136 ]] --[[ Name: test ]]
        -- upvalues: l_getType_0 (copy), l_instanceof_0 (copy), l_InstanceSubset_0 (copy)
        local v44 = true;
        if l_getType_0(v43) ~= "Instance" then
            v44 = l_instanceof_0(v43, l_InstanceSubset_0);
        end;
        return v44;
    end
};