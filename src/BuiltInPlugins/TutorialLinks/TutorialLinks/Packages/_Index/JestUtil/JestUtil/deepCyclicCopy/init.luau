local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_WeakMap_0 = v1.WeakMap;
local v6 = {};
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = l_Set_0.new();
v7 = function(v11, v12, v13) --[[ Line: 30 ]] --[[ Name: deepCyclicCopy ]]
    -- upvalues: v10 (copy), l_WeakMap_0 (copy), l_Array_0 (copy), v9 (ref), v8 (ref)
    local v14 = v12 or {
        blacklist = v10, 
        keepPrototype = false
    };
    local v15 = v13 or l_WeakMap_0.new();
    if typeof(v11) ~= "table" then
        return v11;
    elseif v15:has(v11) then
        return v15:get(v11);
    elseif l_Array_0.isArray(v11) then
        return (v9(v11, v14, v15));
    else
        return v8(v11, v14, v15);
    end;
end;
v6.default = v7;
v8 = function(v16, v17, v18) --[[ Line: 46 ]] --[[ Name: deepCyclicCopyObject ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v7 (ref), v10 (copy)
    local v19 = {};
    if v17.keepPrototype then
        warn("Prototype copying is not supported");
    end;
    local v22 = l_Array_0.reduce(l_Object_0.keys(v16), function(v20, v21) --[[ Line: 55 ]]
        -- upvalues: v16 (copy)
        v20[v21] = {
            value = v16[v21]
        };
        return v20;
    end, {});
    v18:set(v16, v19);
    l_Array_0.forEach(l_Object_0.keys(v22), function(v23) --[[ Line: 65 ]]
        -- upvalues: v17 (copy), v22 (copy), v7 (ref), v10 (ref), v18 (copy)
        if v17.blacklist ~= nil and v17.blacklist:has(v23) then
            v22[v23] = nil;
            return;
        else
            local v24 = v22[v23];
            if typeof(v24.value) ~= "nil" then
                v24.value = v7(v24.value, {
                    blacklist = v10, 
                    keepPrototype = v17.keepPrototype
                }, v18);
            end;
            v24.configurable = true;
            return;
        end;
    end);
    return l_Object_0.assign(v19, l_Array_0.reduce(l_Object_0.keys(v22), function(v25, v26) --[[ Line: 85 ]]
        -- upvalues: v22 (copy)
        v25[v26] = v22[v26].value;
        return v25;
    end, {}));
end;
v9 = function(v27, v28, v29) --[[ Line: 93 ]] --[[ Name: deepCyclicCopyArray ]]
    -- upvalues: v7 (ref), v10 (copy)
    local v30 = {};
    if v28.keepPrototype then
        warn("Prototype copying is not supported");
    end;
    local v31 = #v27;
    v29:set(v27, v30);
    for v32 = 1, v31 do
        v30[v32] = v7(v27[v32], {
            blacklist = v10, 
            keepPrototype = v28.keepPrototype
        }, v29);
    end;
    return v30;
end;
return v6;