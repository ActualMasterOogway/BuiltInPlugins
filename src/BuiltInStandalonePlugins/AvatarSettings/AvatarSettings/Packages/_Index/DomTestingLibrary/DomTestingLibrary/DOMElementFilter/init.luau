local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_instanceof_0 = v1.instanceof;
local v5 = {};
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_RobloxInstance_0 = require(l_Parent_0.RobloxShared).RobloxInstance;
local l_getRobloxProperties_0 = l_RobloxInstance_0.getRobloxProperties;
local l_InstanceSubset_0 = l_RobloxInstance_0.InstanceSubset;
local function v26(v10, v11, v12, v13, v14, v15, v16) --[[ Line: 23 ]] --[[ Name: printTableEntries ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local v17 = v16 or ": ";
    local v18 = "";
    local v21 = l_Array_0.sort(l_Object_0.keys(v10), if v11.compareKeys ~= nil and v11.compareKeys ~= l_Object_0.None then v11.compareKeys else function(v19, v20) --[[ Line: 40 ]]
        if type(v19) .. tostring(v19) < type(v20) .. tostring(v20) then
            return -1;
        elseif type(v19) .. tostring(v19) == type(v20) .. tostring(v20) then
            return 0;
        else
            return 1;
        end;
    end);
    if #v21 > 0 then
        v18 = v18 .. v11.spacingOuter;
        local v22 = v12 .. v11.indent;
        for v23 = 1, #v21 do
            local v24 = v21[v23];
            local v25 = v10[v24];
            v18 = v18 .. v22 .. v15(v24, v11, v22, v13, v14) .. v17 .. v15(v25, v11, v22, v13, v14);
            if v23 < #v21 then
                v18 = v18 .. "," .. v11.spacingInner;
            elseif not v11.min then
                v18 = v18 .. ",";
            end;
        end;
        v18 = v18 .. v11.spacingOuter .. v12;
    end;
    return v18;
end;
local function v52(v27, v28, v29, v30, v31, v32, v33) --[[ Line: 77 ]] --[[ Name: printInstance ]]
    -- upvalues: l_getRobloxProperties_0 (copy), l_getType_0 (copy), l_Array_0 (copy)
    local v34 = "";
    local l_v27_Children_0 = v27:GetChildren();
    table.sort(l_v27_Children_0, function(v36, v37) --[[ Line: 89 ]]
        return v36.Name < v37.Name;
    end);
    local v38 = l_getRobloxProperties_0(v27.ClassName);
    if #v38 > 0 or #l_v27_Children_0 > 0 then
        v34 = v34 .. v28.spacingOuter;
        local v39 = v29 .. v28.indent;
        local v40 = nil;
        for _, v42 in ipairs(v38) do
            v40 = v27[v42];
        end;
        v40 = nil;
        for v43, v44 in ipairs(v38) do
            local v45 = v32(v44, v28, v39, v30, v31);
            local v46 = v27[v44];
            v46 = if l_getType_0(v46) == "Instance" then v32(v46, v28, v39, 1e999, v31) else v32(v46, v28, v39, v30, v31);
            v34 = string.format("%s%s%s: %s", v34, v39, v45, v46);
            if v43 < #v38 or #l_v27_Children_0 > 0 then
                v34 = v34 .. "," .. v28.spacingInner;
            elseif not v28.min then
                v34 = v34 .. ",";
            end;
        end;
        local v47 = l_Array_0.filter(l_v27_Children_0, v33);
        for v48, v49 in ipairs(v47) do
            local v50 = v32(v49.Name, v28, v39, v30, v31);
            local v51 = v32(v49, v28, v39, v30, v31);
            v34 = string.format("%s%s%s: %s", v34, v39, v50, v51);
            if v48 < #v47 then
                v34 = v34 .. "," .. v28.spacingInner;
            elseif not v28.min then
                v34 = v34 .. ",";
            end;
        end;
        v34 = v34 .. v28.spacingOuter .. v29;
    end;
    return v34;
end;
local function _(v53) --[[ Line: 151 ]] --[[ Name: serialize ]]
    -- upvalues: l_instanceof_0 (copy), l_InstanceSubset_0 (copy), v26 (copy), v52 (copy)
    return function(v54, v55, v56, v57, v58, v59) --[[ Line: 152 ]]
        -- upvalues: l_instanceof_0 (ref), l_InstanceSubset_0 (ref), v26 (ref), v52 (ref), v53 (copy)
        v57 = v57 + 1;
        if v55.maxDepth <= v57 then
            return string.format("\"%s\" [%s]", v54.Name, v54.ClassName);
        elseif l_instanceof_0(v54, l_InstanceSubset_0) then
            return v54.ClassName .. " {" .. v26(v54.subset, v55, v56, v57, v58, v59) .. "}";
        else
            return v54.ClassName .. " {" .. v52(v54, v55, v56, v57, v58, v59, v53) .. "}";
        end;
    end;
end;
local function v63(v61) --[[ Line: 170 ]] --[[ Name: test ]]
    -- upvalues: l_getType_0 (copy), l_instanceof_0 (copy), l_InstanceSubset_0 (copy)
    local v62 = true;
    if l_getType_0(v61) ~= "Instance" then
        v62 = l_instanceof_0(v61, l_InstanceSubset_0);
    end;
    return v62;
end;
v5.default = function(v64) --[[ Line: 174 ]] --[[ Name: createDOMElementFilter ]]
    -- upvalues: v63 (copy), l_instanceof_0 (copy), l_InstanceSubset_0 (copy), v26 (copy), v52 (copy)
    return {
        test = v63, 
        serialize = function(v65, v66, v67, v68, v69, v70) --[[ Line: 152 ]]
            -- upvalues: l_instanceof_0 (ref), l_InstanceSubset_0 (ref), v26 (ref), v52 (ref), v64 (copy)
            v68 = v68 + 1;
            if v66.maxDepth <= v68 then
                return string.format("\"%s\" [%s]", v65.Name, v65.ClassName);
            elseif l_instanceof_0(v65, l_InstanceSubset_0) then
                return v65.ClassName .. " {" .. v26(v65.subset, v66, v67, v68, v69, v70) .. "}";
            else
                return v65.ClassName .. " {" .. v52(v65, v66, v67, v68, v69, v70, v64) .. "}";
            end;
        end
    };
end;
return v5;