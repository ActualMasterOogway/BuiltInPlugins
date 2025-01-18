local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_1.RobloxShared);
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local function v7(v8, v9) --[[ Line: 36 ]] --[[ Name: getPath ]]
    -- upvalues: l_Array_0 (copy), v7 (copy)
    if not l_Array_0.isArray(v9) then
        v9 = v9:split(".");
    end;
    if #v9 > 0 then
        local v10 = #v9 == 1;
        local v11 = v9[1];
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 50 ]]
            -- upvalues: v8 (copy), v11 (copy)
            return v8[v11];
        end);
        if not l_status_0 or not v10 and l_result_0 == nil then
            return {
                hasEndProp = false, 
                lastTraversedObject = v8, 
                traversedPath = {}
            };
        else
            local v14 = v7(l_result_0, l_Array_0.slice(v9, 2));
            if v14.lastTraversedObject == nil then
                v14.lastTraversedObject = v8;
            end;
            table.insert(v14.traversedPath, 1, v11);
            if v10 then
                v14.hasEndProp = l_result_0 ~= nil;
                if not v14.hasEndProp then
                    l_Array_0.shift(v14.traversedPath);
                end;
            end;
            return v14;
        end;
    else
        return {
            lastTraversedObject = nil, 
            traversedPath = {}, 
            value = v8
        };
    end;
end;
local l_getObjectSubset_0 = v5.expect.getObjectSubset;
local l_iterableEquality_0 = v5.expect.iterableEquality;
local l_subsetEquality_0 = v5.expect.subsetEquality;
local function v20(v18, v19) --[[ Line: 112 ]] --[[ Name: typeEquality ]]
    if v18 == nil or v19 == nil then
        return nil;
    elseif typeof(v18) ~= typeof(v19) then
        return false;
    elseif not getmetatable(v18) and not getmetatable(v19) then
        return nil;
    elseif getmetatable(v18) and getmetatable(v19) and getmetatable(v18).__index and getmetatable(v19).__index and getmetatable(v18).__index == getmetatable(v19).__index then
        return nil;
    else
        return false;
    end;
end;
return {
    getPath = v7, 
    getObjectSubset = l_getObjectSubset_0, 
    iterableEquality = l_iterableEquality_0, 
    subsetEquality = l_subsetEquality_0, 
    typeEquality = v20, 
    sparseArrayEquality = function(v21, v22) --[[ Line: 135 ]] --[[ Name: sparseArrayEquality ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_equals_0 (copy), v20 (copy)
        if not l_Array_0.isArray(v21) or not l_Array_0.isArray(v22) then
            return nil;
        else
            local v23 = l_Object_0.keys(v21);
            local v24 = l_Object_0.keys(v22);
            return l_equals_0(v21, v22, {
                v20
            }, true) and l_equals_0(v23, v24);
        end;
    end, 
    partition = function(v25, v26) --[[ Line: 162 ]] --[[ Name: partition ]]
        local v27 = {
            {}, 
            {}
        };
        for _, v29 in ipairs(v25) do
            table.insert(v27[v26(v29) and 1 or 2], v29);
        end;
        return v27;
    end, 
    isError = function(v30) --[[ Line: 175 ]] --[[ Name: isError ]]
        if typeof(v30) == "string" or typeof(v30) == "table" then
            return true;
        else
            return false;
        end;
    end, 
    emptyObject = function(v31) --[[ Line: 186 ]] --[[ Name: emptyObject ]]
        -- upvalues: l_Object_0 (copy)
        return typeof(v31) == "table" and (#l_Object_0.keys(v31) == 0 or false);
    end, 
    isOneline = function(v32, v33) --[[ Line: 192 ]] --[[ Name: isOneline ]]
        local v34 = false;
        if typeof(v32) == "string" then
            v34 = false;
            if typeof(v33) == "string" then
                v34 = not v33:match("[\r\n]") or not v32:match("[\r\n]");
            end;
        end;
        return v34;
    end
};