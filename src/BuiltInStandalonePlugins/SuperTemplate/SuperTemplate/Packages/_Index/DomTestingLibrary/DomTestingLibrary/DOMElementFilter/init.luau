local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_instanceof_0 = v1.instanceof;
local v5 = {};
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_RobloxInstance_0 = require(l_Parent_0.RobloxShared).RobloxInstance;
local l_InstanceSubset_0 = l_RobloxInstance_0.InstanceSubset;
local function v25(v9, v10, v11, v12, v13, v14, v15) --[[ Line: 23 ]] --[[ Name: printTableEntries ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local v16 = v15 or ": ";
    local v17 = "";
    local v20 = l_Array_0.sort(l_Object_0.keys(v9), if v10.compareKeys ~= nil and v10.compareKeys ~= l_Object_0.None then v10.compareKeys else function(v18, v19) --[[ Line: 40 ]]
        if type(v18) .. tostring(v18) < type(v19) .. tostring(v19) then
            return -1;
        elseif type(v18) .. tostring(v18) == type(v19) .. tostring(v19) then
            return 0;
        else
            return 1;
        end;
    end);
    if #v20 > 0 then
        v17 = v17 .. v10.spacingOuter;
        local v21 = v11 .. v10.indent;
        for v22 = 1, #v20 do
            local v23 = v20[v22];
            local v24 = v9[v23];
            v17 = v17 .. v21 .. v14(v23, v10, v21, v12, v13) .. v16 .. v14(v24, v10, v21, v12, v13);
            if v22 < #v20 then
                v17 = v17 .. "," .. v10.spacingInner;
            elseif not v10.min then
                v17 = v17 .. ",";
            end;
        end;
        v17 = v17 .. v10.spacingOuter .. v11;
    end;
    return v17;
end;
local function v52(v26, v27, v28, v29, v30, v31, v32) --[[ Line: 77 ]] --[[ Name: printInstance ]]
    -- upvalues: l_Array_0 (copy), l_RobloxInstance_0 (copy), l_Object_0 (copy), l_getType_0 (copy)
    local v33 = "";
    local v34 = l_Array_0.filter(v26:GetChildren(), v32);
    table.sort(v34, function(v35, v36) --[[ Line: 97 ]]
        return v35.Name < v36.Name;
    end);
    l_RobloxInstance_0.listProps(v26);
    local v37 = l_RobloxInstance_0.listProps(v26);
    local v38 = l_Object_0.keys(v37);
    table.sort(v38);
    local v39 = #v38 > 0;
    local v40 = #v34 > 0;
    if v39 or v40 then
        v33 = v33 .. v27.spacingOuter;
        local v41 = v28 .. v27.indent;
        for v42, v43 in ipairs(v38) do
            local v44 = v37[v43];
            if v44 == l_Object_0.None then
                v44 = nil;
            end;
            local v45 = l_getType_0(v44) == "Instance" and 1e999 or v29;
            local v46 = v31(v43, v27, v41, v29, v30);
            local v47 = v31(v44, v27, v41, v45, v30);
            v33 = string.format("%s%s%s: %s", v33, v41, v46, v47);
            if v42 ~= #v38 or v40 then
                v33 = v33 .. "," .. v27.spacingInner;
            elseif not v27.min then
                v33 = v33 .. ",";
            end;
        end;
        for v48, v49 in ipairs(v34) do
            local v50 = v31(v49.Name, v27, v41, v29, v30);
            local v51 = v31(v49, v27, v41, v29, v30);
            v33 = string.format("%s%s%s: %s", v33, v41, v50, v51);
            if v48 ~= #v34 then
                v33 = v33 .. "," .. v27.spacingInner;
            elseif not v27.min then
                v33 = v33 .. ",";
            end;
        end;
        v33 = v33 .. v27.spacingOuter .. v28;
    end;
    return v33;
end;
local function _(v53) --[[ Line: 166 ]] --[[ Name: serialize ]]
    -- upvalues: l_instanceof_0 (copy), l_InstanceSubset_0 (copy), v25 (copy), v52 (copy)
    return function(v54, v55, v56, v57, v58, v59) --[[ Line: 167 ]]
        -- upvalues: l_instanceof_0 (ref), l_InstanceSubset_0 (ref), v25 (ref), v52 (ref), v53 (copy)
        v57 = v57 + 1;
        if v55.maxDepth <= v57 then
            return string.format("\"%s\" [%s]", v54.Name, v54.ClassName);
        elseif l_instanceof_0(v54, l_InstanceSubset_0) then
            return v54.ClassName .. " {" .. v25(v54.subset, v55, v56, v57, v58, v59) .. "}";
        else
            return v54.ClassName .. " {" .. v52(v54, v55, v56, v57, v58, v59, v53) .. "}";
        end;
    end;
end;
local function v63(v61) --[[ Line: 185 ]] --[[ Name: test ]]
    -- upvalues: l_getType_0 (copy), l_instanceof_0 (copy), l_InstanceSubset_0 (copy)
    local v62 = true;
    if l_getType_0(v61) ~= "Instance" then
        v62 = l_instanceof_0(v61, l_InstanceSubset_0);
    end;
    return v62;
end;
v5.default = function(v64) --[[ Line: 189 ]] --[[ Name: createDOMElementFilter ]]
    -- upvalues: v63 (copy), l_instanceof_0 (copy), l_InstanceSubset_0 (copy), v25 (copy), v52 (copy)
    return {
        test = v63, 
        serialize = function(v65, v66, v67, v68, v69, v70) --[[ Line: 167 ]]
            -- upvalues: l_instanceof_0 (ref), l_InstanceSubset_0 (ref), v25 (ref), v52 (ref), v64 (copy)
            v68 = v68 + 1;
            if v66.maxDepth <= v68 then
                return string.format("\"%s\" [%s]", v65.Name, v65.ClassName);
            elseif l_instanceof_0(v65, l_InstanceSubset_0) then
                return v65.ClassName .. " {" .. v25(v65.subset, v66, v67, v68, v69, v70) .. "}";
            else
                return v65.ClassName .. " {" .. v52(v65, v66, v67, v68, v69, v70, v64) .. "}";
            end;
        end
    };
end;
return v5;