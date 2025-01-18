local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local v4 = {};
local v5 = {
    __index = v4
};
v4.new = function() --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: l_Map_0 (copy), v5 (copy)
    return (setmetatable({
        listenersMap = l_Map_0.new()
    }, v5));
end;
v4.addListener = function(v6, v7, v8) --[[ Line: 50 ]] --[[ Name: addListener ]]
    -- upvalues: l_Array_0 (copy)
    local v9 = v6.listenersMap:get(v7);
    if v9 == nil then
        v6.listenersMap:set(v7, {
            v8
        });
        return;
    else
        if l_Array_0.indexOf(v9, v8) < 1 then
            table.insert(v9, v8);
        end;
        return;
    end;
end;
v4.emit = function(v10, v11, ...) --[[ Line: 63 ]] --[[ Name: emit ]]
    local v12 = v10.listenersMap:get(v11);
    if v12 ~= nil then
        if #v12 == 1 then
            v12[1](...);
            return;
        else
            local v13 = false;
            local v14 = nil;
            for _, v16 in (table.clone(v12)) do
                local l_status_0, l_result_0 = pcall(function(...) --[[ Line: 75 ]]
                    -- upvalues: v16 (copy)
                    v16(...);
                    return nil;
                end, ...);
                if not l_status_0 then
                    v13 = true;
                    v14 = l_result_0;
                end;
            end;
            if v13 then
                error((tostring(v14)));
            end;
        end;
    end;
end;
v4.removeAllListeners = function(v19) --[[ Line: 92 ]] --[[ Name: removeAllListeners ]]
    v19.listenersMap:clear();
end;
v4.removeListener = function(v20, v21, v22) --[[ Line: 97 ]] --[[ Name: removeListener ]]
    -- upvalues: l_Array_0 (copy)
    local v23 = v20.listenersMap:get(v21);
    if v23 ~= nil then
        local v24 = l_Array_0.indexOf(v23, v22);
        if v24 >= 1 then
            l_Array_0.splice(v23, v24, 1);
        end;
    end;
end;
return v4;