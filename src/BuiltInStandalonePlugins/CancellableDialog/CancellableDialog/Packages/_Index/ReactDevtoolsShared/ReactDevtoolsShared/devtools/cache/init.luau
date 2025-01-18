local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_WeakMap_0 = v1.WeakMap;
local _ = require(l_Parent_0.Shared);
local v6 = require(l_Parent_0.React);
local l_createContext_0 = v6.createContext;
local l_ReactCurrentDispatcher_0 = v6.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentDispatcher;
local function _(v9, v10) --[[ Line: 76 ]] --[[ Name: readContext ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), l_Error_0 (copy)
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    if l_current_0 == nil then
        error(l_Error_0.new("react-cache: read and preload may only be called from within a " .. "component's render. They are not supported in event handlers or " .. "lifecycle methods."));
    end;
    assert(l_current_0 ~= nil, "assert needed until Luau understands if nil then error()");
    return l_current_0.readContext(v9, v10);
end;
local v13 = l_createContext_0(nil);
local v14 = l_Map_0.new();
local v15 = l_Map_0.new();
local function _(v16) --[[ Line: 99 ]] --[[ Name: getEntriesForResource ]]
    -- upvalues: v14 (copy), l_WeakMap_0 (copy)
    local v17 = v14:get(v16);
    if v17 == nil then
        v17 = l_WeakMap_0.new();
        v14:set(v16, v17);
    end;
    return v17;
end;
local function v31(v19, v20, v21, v22) --[[ Line: 114 ]] --[[ Name: accessResult ]]
    -- upvalues: v14 (copy), l_WeakMap_0 (copy)
    local v23 = v14:get(v19);
    if v23 == nil then
        v23 = l_WeakMap_0.new();
        v14:set(v19, v23);
    end;
    local l_v23_0 = v23;
    v23 = l_v23_0:get(v22);
    if v23 == nil then
        local v25 = v20(v21);
        local v26 = nil;
        v25:andThen(function(v27) --[[ Line: 128 ]]
            -- upvalues: v26 (ref)
            if v26.status == 0 then
                local l_v26_0 = v26;
                l_v26_0.status = 1;
                l_v26_0.value = v27;
            end;
        end, function(v29) --[[ Line: 137 ]]
            -- upvalues: v26 (ref)
            if v26.status == 0 then
                local l_v26_1 = v26;
                l_v26_1.status = 2;
                l_v26_1.value = v29;
            end;
        end);
        v26 = {
            status = 0, 
            value = v25
        };
        l_v23_0:set(v22, v26);
        return v26;
    else
        return v23;
    end;
end;
return {
    createResource = function(v32, v33, v34) --[[ Line: 163 ]]
        -- upvalues: v14 (copy), l_WeakMap_0 (copy), v13 (copy), l_ReactCurrentDispatcher_0 (copy), l_Error_0 (copy), v31 (copy), v15 (copy)
        local v35 = v34 or {};
        local v36 = nil;
        v36 = {
            clear = function() --[[ Line: 172 ]] --[[ Name: clear ]]
                -- upvalues: v14 (ref), v36 (ref)
                v14[v36] = nil;
            end, 
            invalidate = function(v37) --[[ Line: 175 ]] --[[ Name: invalidate ]]
                -- upvalues: v36 (ref), v14 (ref), l_WeakMap_0 (ref)
                local l_v36_0 = v36;
                local v39 = v14:get(l_v36_0);
                if v39 == nil then
                    v39 = l_WeakMap_0.new();
                    v14:set(l_v36_0, v39);
                end;
                v39[v37] = nil;
            end, 
            read = function(v40) --[[ Line: 179 ]] --[[ Name: read ]]
                -- upvalues: v13 (ref), l_ReactCurrentDispatcher_0 (ref), l_Error_0 (ref), v33 (copy), v31 (ref), v36 (ref), v32 (copy)
                local l_v13_0 = v13;
                local l_current_1 = l_ReactCurrentDispatcher_0.current;
                if l_current_1 == nil then
                    error(l_Error_0.new("react-cache: read and preload may only be called from within a " .. "component's render. They are not supported in event handlers or " .. "lifecycle methods."));
                end;
                assert(l_current_1 ~= nil, "assert needed until Luau understands if nil then error()");
                local _ = l_current_1.readContext(l_v13_0, nil);
                l_v13_0 = v33(v40);
                l_current_1 = v31(v36, v32, v40, l_v13_0);
                if l_current_1.status == 0 then
                    error(l_current_1.value);
                    return;
                elseif l_current_1.status == 1 then
                    return l_current_1.value;
                elseif l_current_1.status == 2 then
                    error(l_current_1.value);
                    return;
                else
                    return nil;
                end;
            end, 
            preload = function(v44) --[[ Line: 194 ]] --[[ Name: preload ]]
                -- upvalues: v13 (ref), l_ReactCurrentDispatcher_0 (ref), l_Error_0 (ref), v33 (copy), v31 (ref), v36 (ref), v32 (copy)
                local l_v13_1 = v13;
                local l_current_2 = l_ReactCurrentDispatcher_0.current;
                if l_current_2 == nil then
                    error(l_Error_0.new("react-cache: read and preload may only be called from within a " .. "component's render. They are not supported in event handlers or " .. "lifecycle methods."));
                end;
                assert(l_current_2 ~= nil, "assert needed until Luau understands if nil then error()");
                local _ = l_current_2.readContext(l_v13_1, nil);
                l_v13_1 = v33(v44);
                v31(v36, v32, v44, l_v13_1);
            end, 
            write = function(v48, v49) --[[ Line: 200 ]] --[[ Name: write ]]
                -- upvalues: v36 (ref), v14 (ref), l_WeakMap_0 (ref)
                local l_v36_1 = v36;
                local v51 = v14:get(l_v36_1);
                if v51 == nil then
                    v51 = l_WeakMap_0.new();
                    v14:set(l_v36_1, v51);
                end;
                v51:set(v48, {
                    status = 1, 
                    value = v49
                });
            end
        };
        v15:set(v36, v35);
        return v36;
    end, 
    invalidateResources = function() --[[ Line: 216 ]]
        -- upvalues: v14 (copy)
        v14:clear();
    end
};