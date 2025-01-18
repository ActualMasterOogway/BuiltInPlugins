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
local _ = v7.hasPropertyInObject;
local l_isAsymmetric_0 = v7.isAsymmetric;
local v12 = {};
local function v15(v13, v14) --[[ Line: 36 ]] --[[ Name: readPropUnsafe ]]
    return v13[v14];
end;
local function v19(v16, v17, v18) --[[ Line: 41 ]] --[[ Name: writePropUnsafe ]]
    v16[v17] = v18;
end;
v12.readProp = function(v20, v21) --[[ Line: 45 ]] --[[ Name: readProp ]]
    -- upvalues: v15 (copy)
    return pcall(v15, v20, v21);
end;
v12.writeProp = function(v22, v23, v24) --[[ Line: 49 ]] --[[ Name: writeProp ]]
    -- upvalues: v19 (copy)
    return pcall(v19, v22, v23, v24);
end;
v12.listProps = function(v25) --[[ Line: 53 ]] --[[ Name: listProps ]]
    -- upvalues: v2 (copy), v12 (copy), l_Object_0 (copy)
    local v26 = {};
    local v27 = v2[v25.ClassName];
    while v27 ~= nil do
        for _, v29 in ipairs(v27.Properties) do
            local v30, v31 = v12.readProp(v25, v29);
            if v30 then
                v26[v29] = if v31 == nil then l_Object_0.None else v31;
            end;
        end;
        v27 = v2[v27.Superclass];
    end;
    return v26;
end;
local v32 = {};
local l_v32_0 = v32 --[[ copy: 15 -> 16 ]];
v12.listDefaultProps = function(v34) --[[ Line: 71 ]] --[[ Name: listDefaultProps ]]
    -- upvalues: l_v32_0 (copy), v12 (copy)
    local v35 = l_v32_0[v34];
    if v35 ~= nil then
        return v35;
    else
        local l_status_0, l_result_0 = pcall(Instance.new, v34);
        if not l_status_0 then
            error("Class type is abstract or not creatable - cannot list defaults");
        end;
        local v38 = v12.listProps(l_result_0);
        l_result_0:Destroy();
        l_v32_0[v34] = v38;
        return v38;
    end;
end;
v12.instanceSubsetEquality = function(v39, v40) --[[ Line: 93 ]] --[[ Name: instanceSubsetEquality ]]
    -- upvalues: l_getType_0 (copy), l_isObjectWithKeys_0 (copy), l_Array_0 (copy), l_Object_0 (copy), v12 (copy), l_equals_0 (copy)
    local function v41(v42) --[[ Line: 94 ]] --[[ Name: subsetEqualityWithContext ]]
        -- upvalues: l_getType_0 (ref), l_isObjectWithKeys_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v12 (ref), l_equals_0 (ref), v41 (copy)
        return function(v43, v44) --[[ Line: 95 ]]
            -- upvalues: v42 (ref), l_getType_0 (ref), l_isObjectWithKeys_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v12 (ref), l_equals_0 (ref), v41 (ref)
            v42 = v42 or {};
            if l_getType_0(v43) ~= "Instance" or not l_isObjectWithKeys_0(v44) then
                return nil;
            else
                return l_Array_0.every(l_Object_0.keys(v44), function(v45) --[[ Line: 102 ]]
                    -- upvalues: v44 (copy), l_isObjectWithKeys_0 (ref), v42 (ref), v12 (ref), v43 (copy), l_equals_0 (ref), v41 (ref)
                    local v46 = v44[v45];
                    if l_isObjectWithKeys_0(v46) then
                        if v42[v46] then
                            return false;
                        else
                            v42[v46] = true;
                        end;
                    end;
                    local v47, v48 = v12.readProp(v43, v45);
                    local v49 = v47 and l_equals_0(v48, v46, {
                        v41(v42)
                    });
                    v42[v46] = nil;
                    return v49;
                end);
            end;
        end;
    end;
    local v50 = nil;
    local v51;
    do
        local l_v50_0 = v50;
        v51 = function(v53, v54) --[[ Line: 95 ]]
            -- upvalues: l_v50_0 (ref), l_getType_0 (ref), l_isObjectWithKeys_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v12 (ref), l_equals_0 (ref), v41 (copy)
            l_v50_0 = l_v50_0 or {};
            if l_getType_0(v53) ~= "Instance" or not l_isObjectWithKeys_0(v54) then
                return nil;
            else
                return l_Array_0.every(l_Object_0.keys(v54), function(v55) --[[ Line: 102 ]]
                    -- upvalues: v54 (copy), l_isObjectWithKeys_0 (ref), l_v50_0 (ref), v12 (ref), v53 (copy), l_equals_0 (ref), v41 (ref)
                    local v56 = v54[v55];
                    if l_isObjectWithKeys_0(v56) then
                        if l_v50_0[v56] then
                            return false;
                        else
                            l_v50_0[v56] = true;
                        end;
                    end;
                    local v57, v58 = v12.readProp(v53, v55);
                    local v59 = v57 and l_equals_0(v58, v56, {
                        v41(l_v50_0)
                    });
                    l_v50_0[v56] = nil;
                    return v59;
                end);
            end;
        end;
    end;
    if v51 then
        return v51(v39, v40);
    else
        return v51;
    end;
end;
v32 = {};
v12.InstanceSubset = v32;
v32.__index = v32;
v32.new = function(v60, v61) --[[ Line: 135 ]] --[[ Name: new ]]
    -- upvalues: v32 (copy)
    table.sort(v61);
    local v62 = {
        ClassName = v60, 
        subset = v61
    };
    setmetatable(v62, v32);
    return v62;
end;
v12.getInstanceSubset = function(v63, v64, v65) --[[ Line: 149 ]] --[[ Name: getInstanceSubset ]]
    -- upvalues: l_equals_0 (copy), l_isAsymmetric_0 (copy), v12 (copy), v32 (copy)
    local v66 = v65 or {};
    local v67 = {};
    v66[v63] = v67;
    if l_equals_0(v63, v64) then
        return v64, v64;
    elseif typeof(v64) ~= "table" or l_isAsymmetric_0(v64) then
        return v63, v64;
    else
        local v68 = {};
        for v69, v70 in pairs(v64) do
            if typeof(v70) ~= "table" then
                v68[v69] = v70;
            end;
        end;
        for v71, v72 in pairs(v64) do
            local v73, v74 = v12.readProp(v63, v71);
            if v73 then
                if v66[v74] ~= nil then
                    error("Circular reference passed into .toMatchInstance(subset)");
                else
                    v68[v71] = {};
                    local v75, v76 = v12.getInstanceSubset(v74, v72, v66);
                    v67[v71] = v75;
                    v68[v71] = v76;
                end;
            end;
        end;
        local l_ClassName_0 = v63.ClassName;
        if typeof(v64) == "table" and rawget(v64, "ClassName") then
            l_ClassName_0 = rawget(v64, "ClassName");
        end;
        return v32.new(v63.ClassName, v67), (v32.new(l_ClassName_0, v68));
    end;
end;
return v12;