local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RobloxApiDump);
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Object_0 = v4.Object;
local v7 = require(l_Parent_0.expect);
local l_equals_0 = v7.equals;
local l_isObjectWithKeys_0 = v7.isObjectWithKeys;
local l_hasPropertyInObject_0 = v7.hasPropertyInObject;
local l_isAsymmetric_0 = v7.isAsymmetric;
local function v17(v12) --[[ Line: 18 ]] --[[ Name: getRobloxProperties ]]
    -- upvalues: v2 (copy)
    local v13 = v2[v12];
    local v14 = {};
    while v13 do
        for _, v16 in ipairs(v13.Properties) do
            table.insert(v14, v16);
        end;
        v13 = v2[v13.Superclass];
    end;
    table.sort(v14);
    return v14;
end;
local function v43(v18, v19) --[[ Line: 35 ]] --[[ Name: instanceSubsetEquality ]]
    -- upvalues: l_getType_0 (copy), l_isObjectWithKeys_0 (copy), v17 (copy), l_Array_0 (copy), l_Object_0 (copy), l_equals_0 (copy)
    local function v20(v21) --[[ Line: 36 ]] --[[ Name: subsetEqualityWithContext ]]
        -- upvalues: l_getType_0 (ref), l_isObjectWithKeys_0 (ref), v17 (ref), l_Array_0 (ref), l_Object_0 (ref), l_equals_0 (ref), v20 (copy)
        return function(v22, v23) --[[ Line: 37 ]]
            -- upvalues: v21 (ref), l_getType_0 (ref), l_isObjectWithKeys_0 (ref), v17 (ref), l_Array_0 (ref), l_Object_0 (ref), l_equals_0 (ref), v20 (ref)
            v21 = v21 or {};
            if l_getType_0(v22) ~= "Instance" or not l_isObjectWithKeys_0(v23) then
                return nil;
            else
                local v24 = v17(v22.ClassName);
                local v25 = {};
                for _, v27 in ipairs(v22:getChildren()) do
                    v25[v27.Name] = true;
                end;
                return l_Array_0.every(l_Object_0.keys(v23), function(v28) --[[ Line: 50 ]]
                    -- upvalues: v23 (copy), l_isObjectWithKeys_0 (ref), v21 (ref), v22 (copy), v24 (copy), v25 (copy), l_equals_0 (ref), v20 (ref)
                    local v29 = v23[v28];
                    if l_isObjectWithKeys_0(v29) then
                        if v21[v29] then
                            return false;
                        else
                            v21[v29] = true;
                        end;
                    end;
                    local v30 = false;
                    if v22 ~= nil then
                        v30 = (not (table.find(v24, v28) == nil) or v25[v28] ~= nil) and l_equals_0(v22[v28], v29, {
                            v20(v21)
                        });
                    end;
                    v21[v29] = nil;
                    return v30;
                end);
            end;
        end;
    end;
    local v31 = nil;
    local v32;
    do
        local l_v31_0 = v31;
        v32 = function(v34, v35) --[[ Line: 37 ]]
            -- upvalues: l_v31_0 (ref), l_getType_0 (ref), l_isObjectWithKeys_0 (ref), v17 (ref), l_Array_0 (ref), l_Object_0 (ref), l_equals_0 (ref), v20 (copy)
            l_v31_0 = l_v31_0 or {};
            if l_getType_0(v34) ~= "Instance" or not l_isObjectWithKeys_0(v35) then
                return nil;
            else
                local v36 = v17(v34.ClassName);
                local v37 = {};
                for _, v39 in ipairs(v34:getChildren()) do
                    v37[v39.Name] = true;
                end;
                return l_Array_0.every(l_Object_0.keys(v35), function(v40) --[[ Line: 50 ]]
                    -- upvalues: v35 (copy), l_isObjectWithKeys_0 (ref), l_v31_0 (ref), v34 (copy), v36 (copy), v37 (copy), l_equals_0 (ref), v20 (ref)
                    local v41 = v35[v40];
                    if l_isObjectWithKeys_0(v41) then
                        if l_v31_0[v41] then
                            return false;
                        else
                            l_v31_0[v41] = true;
                        end;
                    end;
                    local v42 = false;
                    if v34 ~= nil then
                        v42 = (not (table.find(v36, v40) == nil) or v37[v40] ~= nil) and l_equals_0(v34[v40], v41, {
                            v20(l_v31_0)
                        });
                    end;
                    l_v31_0[v41] = nil;
                    return v42;
                end);
            end;
        end;
    end;
    if v32 then
        return v32(v18, v19);
    else
        return v32;
    end;
end;
local v44 = {};
v44.__index = v44;
v44.new = function(v45, v46) --[[ Line: 80 ]] --[[ Name: new ]]
    -- upvalues: v44 (copy)
    table.sort(v46);
    local v47 = {
        ClassName = v45, 
        subset = v46
    };
    setmetatable(v47, v44);
    return v47;
end;
local function v48(v49, v50, v51) --[[ Line: 94 ]] --[[ Name: getInstanceSubset ]]
    -- upvalues: l_equals_0 (copy), l_isAsymmetric_0 (copy), v17 (copy), l_Array_0 (copy), l_hasPropertyInObject_0 (copy), v48 (copy), v44 (copy)
    v51 = v51 or {};
    local v52 = {};
    v51[v49] = v52;
    if l_equals_0(v49, v50) then
        return v50, v50;
    elseif typeof(v50) ~= "table" or l_isAsymmetric_0(v50) then
        return v49, v50;
    else
        local v53 = {};
        for v54, v55 in pairs(v50) do
            if typeof(v55) ~= "table" then
                v53[v54] = v55;
            end;
        end;
        local v56 = v17(v49.ClassName);
        for _, v58 in ipairs(v49:getChildren()) do
            table.insert(v56, v58.Name);
        end;
        for _, v61 in ipairs(l_Array_0.filter(v56, function(v59) --[[ Line: 121 ]]
            -- upvalues: l_hasPropertyInObject_0 (ref), v50 (copy)
            return l_hasPropertyInObject_0(v50, v59);
        end)) do
            if v51[v49[v61]] ~= nil then
                error("Circular reference passed into .toMatchInstance(subset)");
            else
                local _ = nil;
                local v63, v64 = v48(v49[v61], v50[v61], v51);
                v52[v61] = v63;
                v53[v61] = v64;
            end;
        end;
        local l_ClassName_0 = v49.ClassName;
        if typeof(v50) == "table" and rawget(v50, "ClassName") then
            l_ClassName_0 = rawget(v50, "ClassName");
        end;
        return v44.new(v49.ClassName, v52), v44.new(l_ClassName_0, v53);
    end;
end;
return {
    getRobloxProperties = v17, 
    instanceSubsetEquality = v43, 
    InstanceSubset = v44, 
    getInstanceSubset = v48
};