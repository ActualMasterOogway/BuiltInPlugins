local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_1.RegExp);
local v6 = require(l_Parent_1.RobloxShared);
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local v8 = nil;
local function v9(v10, v11) --[[ Line: 41 ]] --[[ Name: getPath ]]
    -- upvalues: l_Array_0 (copy), v8 (ref), v9 (copy)
    if not l_Array_0.isArray(v11) then
        v11 = v8(v11);
    end;
    if #v11 > 0 then
        local v12 = #v11 == 1;
        local v13 = v11[1];
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: v10 (copy), v13 (copy)
            return v10[v13];
        end);
        if not l_status_0 or not v12 and l_result_0 == nil then
            return {
                hasEndProp = false, 
                lastTraversedObject = v10, 
                traversedPath = {}
            };
        else
            local v16 = v9(l_result_0, l_Array_0.slice(v11, 2));
            if v16.lastTraversedObject == nil then
                v16.lastTraversedObject = v10;
            end;
            table.insert(v16.traversedPath, 1, v13);
            if v12 then
                v16.hasEndProp = l_result_0 ~= nil;
                if not v16.hasEndProp then
                    l_Array_0.shift(v16.traversedPath);
                end;
            end;
            return v16;
        end;
    else
        return {
            lastTraversedObject = nil, 
            traversedPath = {}, 
            value = v10
        };
    end;
end;
local l_getObjectSubset_0 = v6.expect.getObjectSubset;
local l_iterableEquality_0 = v6.expect.iterableEquality;
local l_subsetEquality_0 = v6.expect.subsetEquality;
local function v22(v20, v21) --[[ Line: 116 ]] --[[ Name: typeEquality ]]
    if v20 == nil or v21 == nil then
        return nil;
    elseif typeof(v20) ~= typeof(v21) then
        return false;
    elseif not getmetatable(v20) and not getmetatable(v21) then
        return nil;
    elseif getmetatable(v20) and getmetatable(v21) and getmetatable(v20).__index and getmetatable(v21).__index and getmetatable(v20).__index == getmetatable(v21).__index then
        return nil;
    else
        return false;
    end;
end;
local function v27(v23, v24) --[[ Line: 177 ]] --[[ Name: sparseArrayEquality ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_equals_0 (copy), v22 (copy)
    if not l_Array_0.isArray(v23) or not l_Array_0.isArray(v24) then
        return nil;
    else
        local v25 = l_Object_0.keys(v23);
        local v26 = l_Object_0.keys(v24);
        return l_equals_0(v23, v24, {
            v22
        }, true) and l_equals_0(v25, v26);
    end;
end;
local function v33(v28, v29) --[[ Line: 193 ]] --[[ Name: partition ]]
    local v30 = {
        {}, 
        {}
    };
    for _, v32 in ipairs(v28) do
        table.insert(v30[v29(v32) and 1 or 2], v32);
    end;
    return v30;
end;
v8 = function(v34) --[[ Line: 203 ]] --[[ Name: pathAsArray ]]
    -- upvalues: v5 (copy)
    local v35 = v5("[^.[\\]]+|(?=(?:\\.)(?:\\.|$))");
    local v36 = {};
    if v34:sub(1, 1) == "." then
        table.insert(v36, "");
    end;
    local v37 = 0;
    local l_v34_0 = v34;
    local v39 = v35:exec(l_v34_0);
    while v39 ~= nil and v37 < #v34 do
        local v40 = v39[1];
        local v41 = v39.index + #v40;
        local v42 = v37 + v39.index;
        if v34:sub(v42 - 1, v42 - 1) == "[" then
            local v43 = tonumber(v40, 10);
            if v43 then
                table.insert(v36, v43);
            else
                table.insert(v36, v40);
            end;
        else
            table.insert(v36, v40);
        end;
        v37 = v37 + v41;
        l_v34_0 = l_v34_0:sub(v41 + 1);
        v39 = v35:exec(l_v34_0);
    end;
    return v36;
end;
return {
    getPath = v9, 
    getObjectSubset = l_getObjectSubset_0, 
    iterableEquality = l_iterableEquality_0, 
    subsetEquality = l_subsetEquality_0, 
    typeEquality = v22, 
    sparseArrayEquality = v27, 
    partition = v33, 
    pathAsArray = v8, 
    isError = function(v44) --[[ Line: 251 ]] --[[ Name: isError ]]
        if typeof(v44) == "string" or typeof(v44) == "table" then
            return true;
        else
            return false;
        end;
    end, 
    emptyObject = function(v45) --[[ Line: 262 ]] --[[ Name: emptyObject ]]
        -- upvalues: l_Object_0 (copy)
        return typeof(v45) == "table" and (#l_Object_0.keys(v45) == 0 or false);
    end, 
    isOneline = function(v46, v47) --[[ Line: 268 ]] --[[ Name: isOneline ]]
        local v48 = false;
        if typeof(v46) == "string" then
            v48 = false;
            if typeof(v47) == "string" then
                v48 = not v47:match("[\r\n]") or not v46:match("[\r\n]");
            end;
        end;
        return v48;
    end
};