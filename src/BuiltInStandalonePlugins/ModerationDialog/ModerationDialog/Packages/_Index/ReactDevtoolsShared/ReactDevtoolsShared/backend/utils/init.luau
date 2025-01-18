local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Set_0 = v1.Set;
local l_Array_0 = v1.Array;
local l_dehydrate_0 = require(script.Parent.Parent.hydration).dehydrate;
local _ = require(script.Parent.Parent.devtools.views.Components.types);
local l_HttpService_0 = game:GetService("HttpService");
local v13 = {
    cleanForBridge = function(v7, v8, v9) --[[ Line: 27 ]]
        -- upvalues: l_dehydrate_0 (copy)
        v9 = v9 or {};
        if v7 ~= nil then
            local v10 = {};
            local v11 = {};
            return {
                data = l_dehydrate_0(v7, v10, v11, v9, v8), 
                cleaned = v10, 
                unserializable = v11
            };
        else
            return nil;
        end;
    end, 
    copyToClipboard = function(_) --[[ Line: 52 ]]

    end
};
v13.copyWithDelete = function(v14, v15, v16) --[[ Line: 71 ]]
    -- upvalues: l_Array_0 (copy), v13 (copy)
    v16 = v16 or 1;
    local v17 = v15[v16];
    local v18 = table.clone(v14);
    if v16 == #v15 then
        if l_Array_0.isArray(v18) then
            l_Array_0.splice(v18, v17, 1);
            return v18;
        else
            v18[v17] = nil;
            return v18;
        end;
    else
        v18[v17] = v13.copyWithDelete(v14[v17], v15, v16 + 1);
        return v18;
    end;
end;
v13.copyWithRename = function(v19, v20, v21, v22) --[[ Line: 100 ]]
    -- upvalues: l_Array_0 (copy), v13 (copy)
    v22 = v22 or 1;
    local v23 = v20[v22];
    local v24 = table.clone(v19);
    if v22 == #v20 then
        v24[v21[v22]] = v24[v23];
        if l_Array_0.isArray(v24) then
            l_Array_0.splice(v24, v23, 1);
            return v24;
        else
            v24[v23] = nil;
            return v24;
        end;
    else
        v24[v23] = v13.copyWithRename(v19[v23], v20, v21, v22 + 1);
        return v24;
    end;
end;
v13.copyWithSet = function(v25, v26, v27, v28) --[[ Line: 132 ]]
    -- upvalues: v13 (copy)
    v28 = v28 or 1;
    if #v26 < v28 then
        return v27;
    else
        local v29 = v26[v28];
        local v30 = table.clone(v25);
        v30[v29] = v13.copyWithSet(v25[v29], v26, v27, v28 + 1);
        return v30;
    end;
end;
v13.serializeToString = function(v31) --[[ Line: 157 ]]
    -- upvalues: l_Set_0 (copy), l_HttpService_0 (copy)
    local v32 = l_Set_0.new();
    return l_HttpService_0.JSONEncode(v31, function(_, v34) --[[ Line: 160 ]]
        -- upvalues: v32 (copy)
        if typeof(v34) == "table" and v34 ~= nil then
            if v32:has(v34) then
                return;
            else
                v32:add(v34);
            end;
        end;
        return v34;
    end);
end;
return v13;