local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_instanceof_0 = v2.instanceof;
local l_Object_0 = v2.Object;
local v7 = require(l_Parent_1.RegExp);
local v8 = require(l_Parent_1.RobloxShared);
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local v10 = nil;
local function v11(v12, v13) --[[ Line: 43 ]] --[[ Name: getPath ]]
    -- upvalues: l_Array_0 (copy), v10 (ref), v11 (copy)
    if not l_Array_0.isArray(v13) then
        v13 = v10(v13);
    end;
    if #v13 > 0 then
        local v14 = #v13 == 1;
        local v15 = v13[1];
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 54 ]]
            -- upvalues: v12 (copy), v15 (copy)
            return v12[v15];
        end);
        if not l_status_0 or not v14 and l_result_0 == nil then
            return {
                hasEndProp = false, 
                lastTraversedObject = v12, 
                traversedPath = {}
            };
        else
            local v18 = v11(l_result_0, l_Array_0.slice(v13, 2));
            if v18.lastTraversedObject == nil then
                v18.lastTraversedObject = v12;
            end;
            table.insert(v18.traversedPath, 1, v15);
            if v14 then
                v18.hasEndProp = l_result_0 ~= nil;
                if not v18.hasEndProp then
                    l_Array_0.shift(v18.traversedPath);
                end;
            end;
            return v18;
        end;
    else
        return {
            lastTraversedObject = nil, 
            traversedPath = {}, 
            value = v12
        };
    end;
end;
local l_getObjectSubset_0 = v8.expect.getObjectSubset;
local l_iterableEquality_0 = v8.expect.iterableEquality;
local l_subsetEquality_0 = v8.expect.subsetEquality;
local function v24(v22, v23) --[[ Line: 118 ]] --[[ Name: typeEquality ]]
    if v22 == nil or v23 == nil then
        return nil;
    elseif typeof(v22) ~= typeof(v23) then
        return false;
    elseif not getmetatable(v22) and not getmetatable(v23) then
        return nil;
    elseif getmetatable(v22) and getmetatable(v23) and getmetatable(v22).__index and getmetatable(v23).__index and getmetatable(v22).__index == getmetatable(v23).__index then
        return nil;
    else
        return false;
    end;
end;
local function v29(v25, v26) --[[ Line: 178 ]] --[[ Name: sparseArrayEquality ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_equals_0 (copy), v24 (copy)
    if not l_Array_0.isArray(v25) or not l_Array_0.isArray(v26) then
        return nil;
    else
        local v27 = l_Object_0.keys(v25);
        local v28 = l_Object_0.keys(v26);
        return l_equals_0(v25, v26, {
            v24
        }, true) and l_equals_0(v27, v28);
    end;
end;
local function v35(v30, v31) --[[ Line: 194 ]] --[[ Name: partition ]]
    local v32 = {
        {}, 
        {}
    };
    for _, v34 in ipairs(v30) do
        table.insert(v32[v31(v34) and 1 or 2], v34);
    end;
    return v32;
end;
v10 = function(v36) --[[ Line: 204 ]] --[[ Name: pathAsArray ]]
    -- upvalues: v7 (copy)
    local v37 = v7("[^.[\\]]+|(?=(?:\\.)(?:\\.|$))");
    local v38 = {};
    if v36:sub(1, 1) == "." then
        table.insert(v38, "");
    end;
    local v39 = 0;
    local l_v36_0 = v36;
    local v41 = v37:exec(l_v36_0);
    while v41 ~= nil and v39 < #v36 do
        local v42 = v41[1];
        local v43 = v41.index + #v42;
        local v44 = v39 + v41.index;
        if v36:sub(v44 - 1, v44 - 1) == "[" then
            local v45 = tonumber(v42, 10);
            if v45 then
                table.insert(v38, v45);
            else
                table.insert(v38, v42);
            end;
        else
            table.insert(v38, v42);
        end;
        v39 = v39 + v43;
        l_v36_0 = l_v36_0:sub(v43 + 1);
        v41 = v37:exec(l_v36_0);
    end;
    return v38;
end;
return {
    getPath = v11, 
    getObjectSubset = l_getObjectSubset_0, 
    iterableEquality = l_iterableEquality_0, 
    subsetEquality = l_subsetEquality_0, 
    typeEquality = v24, 
    sparseArrayEquality = v29, 
    partition = v35, 
    pathAsArray = v10, 
    isError = function(v46) --[[ Line: 253 ]] --[[ Name: isError ]]
        -- upvalues: l_instanceof_0 (copy), l_Error_0 (copy)
        return l_instanceof_0(v46, l_Error_0);
    end, 
    emptyObject = function(v47) --[[ Line: 258 ]] --[[ Name: emptyObject ]]
        -- upvalues: l_Object_0 (copy)
        return typeof(v47) == "table" and (#l_Object_0.keys(v47) == 0 or false);
    end, 
    isOneline = function(v48, v49) --[[ Line: 264 ]] --[[ Name: isOneline ]]
        local v50 = false;
        if typeof(v48) == "string" then
            v50 = false;
            if typeof(v49) == "string" then
                v50 = not v49:match("[\r\n]") or not v48:match("[\r\n]");
            end;
        end;
        return v50;
    end
};