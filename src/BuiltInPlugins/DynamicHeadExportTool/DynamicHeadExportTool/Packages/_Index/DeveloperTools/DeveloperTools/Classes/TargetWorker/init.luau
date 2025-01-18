local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.EventName);
local v3 = require(l_Parent_1.Dash);
local l_class_0 = v3.class;
local l_forEach_0 = v3.forEach;
local l_join_0 = v3.join;
local l_insert_0 = table.insert;
local v11 = l_class_0("TargetWorker", function(v8, v9, v10) --[[ Line: 16 ]]
    return {
        targetId = v9, 
        toBridgeId = v10, 
        debugInterface = v8, 
        listeners = {}
    };
end);
v11.connectEvents = function(v12) --[[ Line: 25 ]] --[[ Name: connectEvents ]]
    -- upvalues: v2 (copy)
    v12:connect({
        eventName = v2.CloseTarget, 
        onEvent = function(_) --[[ Line: 28 ]] --[[ Name: onEvent ]]
            -- upvalues: v12 (copy)
            v12.debugInterface:removeWorker(v12.targetId);
        end
    });
end;
v11.connect = function(v14, v15) --[[ Line: 34 ]] --[[ Name: connect ]]
    -- upvalues: l_join_0 (copy), l_insert_0 (copy)
    local v16 = l_join_0(v15, {
        targetId = v14.targetId
    });
    v14.debugInterface:_connect(v16);
    l_insert_0(v14.listeners, v16);
end;
v11.send = function(v17, v18) --[[ Line: 42 ]] --[[ Name: send ]]
    -- upvalues: l_join_0 (copy)
    local v19 = l_join_0(v18, {
        fromTargetId = v17.targetId, 
        toBridgeId = v17.toBridgeId
    });
    v17.debugInterface:_send(v19);
end;
v11.destroy = function(v20) --[[ Line: 50 ]] --[[ Name: destroy ]]
    -- upvalues: l_forEach_0 (copy)
    l_forEach_0(v20.listeners, function(v21) --[[ Line: 51 ]]
        -- upvalues: v20 (copy)
        v20.debugInterface:_disconnect(v21);
    end);
end;
return v11;