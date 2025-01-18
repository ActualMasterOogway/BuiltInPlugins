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
local v12 = {};
local function v15(v13, v14) --[[ Line: 35 ]] --[[ Name: tryPropertyName ]]
    return v13[v14];
end;
local function v21(v16) --[[ Line: 39 ]] --[[ Name: getRobloxProperties ]]
    -- upvalues: v2 (copy)
    local v17 = v2[v16];
    local v18 = {};
    while v17 do
        for _, v20 in ipairs(v17.Properties) do
            table.insert(v18, v20);
        end;
        v17 = v2[v17.Superclass];
    end;
    table.sort(v18);
    return v18;
end;
local function v30(v22) --[[ Line: 52 ]] --[[ Name: getRobloxDefaults ]]
    -- upvalues: v21 (copy), v12 (copy), v15 (copy)
    local v23 = v21(v22);
    local v24 = v12[v22];
    if v24 then
        return v24, v23;
    else
        v24 = {};
        v12[v22] = v24;
        local v25 = Instance.new(v22);
        for _, v27 in ipairs(v23) do
            local l_status_0, l_result_0 = pcall(v15, v25, v27);
            if l_status_0 then
                v24[v27] = l_result_0;
            end;
        end;
        v25:Destroy();
        return v24, v23;
    end;
end;
local function v56(v31, v32) --[[ Line: 81 ]] --[[ Name: instanceSubsetEquality ]]
    -- upvalues: l_getType_0 (copy), l_isObjectWithKeys_0 (copy), v21 (copy), l_Array_0 (copy), l_Object_0 (copy), l_equals_0 (copy)
    local function v33(v34) --[[ Line: 82 ]] --[[ Name: subsetEqualityWithContext ]]
        -- upvalues: l_getType_0 (ref), l_isObjectWithKeys_0 (ref), v21 (ref), l_Array_0 (ref), l_Object_0 (ref), l_equals_0 (ref), v33 (copy)
        return function(v35, v36) --[[ Line: 83 ]]
            -- upvalues: v34 (ref), l_getType_0 (ref), l_isObjectWithKeys_0 (ref), v21 (ref), l_Array_0 (ref), l_Object_0 (ref), l_equals_0 (ref), v33 (ref)
            v34 = v34 or {};
            if l_getType_0(v35) ~= "Instance" or not l_isObjectWithKeys_0(v36) then
                return nil;
            else
                local v37 = v21(v35.ClassName);
                local v38 = {};
                for _, v40 in ipairs(v35:getChildren()) do
                    v38[v40.Name] = true;
                end;
                return l_Array_0.every(l_Object_0.keys(v36), function(v41) --[[ Line: 96 ]]
                    -- upvalues: v36 (copy), l_isObjectWithKeys_0 (ref), v34 (ref), v35 (copy), v37 (copy), v38 (copy), l_equals_0 (ref), v33 (ref)
                    local v42 = v36[v41];
                    if l_isObjectWithKeys_0(v42) then
                        if v34[v42] then
                            return false;
                        else
                            v34[v42] = true;
                        end;
                    end;
                    local v43 = false;
                    if v35 ~= nil then
                        v43 = (not (table.find(v37, v41) == nil) or v38[v41] ~= nil) and l_equals_0(v35[v41], v42, {
                            v33(v34)
                        });
                    end;
                    v34[v42] = nil;
                    return v43;
                end);
            end;
        end;
    end;
    local v44 = nil;
    local v45;
    do
        local l_v44_0 = v44;
        v45 = function(v47, v48) --[[ Line: 83 ]]
            -- upvalues: l_v44_0 (ref), l_getType_0 (ref), l_isObjectWithKeys_0 (ref), v21 (ref), l_Array_0 (ref), l_Object_0 (ref), l_equals_0 (ref), v33 (copy)
            l_v44_0 = l_v44_0 or {};
            if l_getType_0(v47) ~= "Instance" or not l_isObjectWithKeys_0(v48) then
                return nil;
            else
                local v49 = v21(v47.ClassName);
                local v50 = {};
                for _, v52 in ipairs(v47:getChildren()) do
                    v50[v52.Name] = true;
                end;
                return l_Array_0.every(l_Object_0.keys(v48), function(v53) --[[ Line: 96 ]]
                    -- upvalues: v48 (copy), l_isObjectWithKeys_0 (ref), l_v44_0 (ref), v47 (copy), v49 (copy), v50 (copy), l_equals_0 (ref), v33 (ref)
                    local v54 = v48[v53];
                    if l_isObjectWithKeys_0(v54) then
                        if l_v44_0[v54] then
                            return false;
                        else
                            l_v44_0[v54] = true;
                        end;
                    end;
                    local v55 = false;
                    if v47 ~= nil then
                        v55 = (not (table.find(v49, v53) == nil) or v50[v53] ~= nil) and l_equals_0(v47[v53], v54, {
                            v33(l_v44_0)
                        });
                    end;
                    l_v44_0[v54] = nil;
                    return v55;
                end);
            end;
        end;
    end;
    if v45 then
        return v45(v31, v32);
    else
        return v45;
    end;
end;
local v57 = {};
v57.__index = v57;
v57.new = function(v58, v59) --[[ Line: 126 ]] --[[ Name: new ]]
    -- upvalues: v57 (copy)
    table.sort(v59);
    local v60 = {
        ClassName = v58, 
        subset = v59
    };
    setmetatable(v60, v57);
    return v60;
end;
local function v61(v62, v63, v64) --[[ Line: 140 ]] --[[ Name: getInstanceSubset ]]
    -- upvalues: l_equals_0 (copy), l_isAsymmetric_0 (copy), v21 (copy), l_Array_0 (copy), l_hasPropertyInObject_0 (copy), v61 (copy), v57 (copy)
    local v65 = v64 or {};
    local v66 = {};
    v65[v62] = v66;
    if l_equals_0(v62, v63) then
        return v63, v63;
    elseif typeof(v63) ~= "table" or l_isAsymmetric_0(v63) then
        return v62, v63;
    else
        local v67 = {};
        for v68, v69 in pairs(v63) do
            if typeof(v69) ~= "table" then
                v67[v68] = v69;
            end;
        end;
        local v70 = v21(v62.ClassName);
        for _, v72 in ipairs(v62:getChildren()) do
            table.insert(v70, v72.Name);
        end;
        for _, v75 in ipairs(l_Array_0.filter(v70, function(v73) --[[ Line: 167 ]]
            -- upvalues: l_hasPropertyInObject_0 (ref), v63 (copy)
            return l_hasPropertyInObject_0(v63, v73);
        end)) do
            if v65[v62[v75]] ~= nil then
                error("Circular reference passed into .toMatchInstance(subset)");
            else
                local _ = nil;
                local v77, v78 = v61(v62[v75], v63[v75], v65);
                v66[v75] = v77;
                v67[v75] = v78;
            end;
        end;
        local l_ClassName_0 = v62.ClassName;
        if typeof(v63) == "table" and rawget(v63, "ClassName") then
            l_ClassName_0 = rawget(v63, "ClassName");
        end;
        return v57.new(v62.ClassName, v66), v57.new(l_ClassName_0, v67);
    end;
end;
return {
    getRobloxProperties = v21, 
    getRobloxDefaults = v30, 
    instanceSubsetEquality = v56, 
    InstanceSubset = v57, 
    getInstanceSubset = v61
};