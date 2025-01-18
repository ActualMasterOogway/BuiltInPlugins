local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.EventName);
local v3 = require(l_Parent_1.Dash);
local l_join_0 = v3.join;
local v8 = v3.class("TargetApi", function(v5, v6, v7) --[[ Line: 14 ]]
    return {
        debugInterface = v5, 
        bridgeId = v6, 
        targetId = v7
    };
end);
v8.close = function(v9) --[[ Line: 22 ]] --[[ Name: close ]]
    -- upvalues: v2 (copy)
    v9:_send({
        eventName = v2.CloseTarget
    });
end;
v8._send = function(v10, v11) --[[ Line: 28 ]] --[[ Name: _send ]]
    -- upvalues: l_join_0 (copy)
    local v12 = l_join_0(v11, {
        toBridgeId = v10.bridgeId, 
        toTargetId = v10.targetId
    });
    v10.debugInterface:_send(v12);
end;
v8._connect = function(v13, v14) --[[ Line: 36 ]] --[[ Name: _connect ]]
    -- upvalues: l_join_0 (copy)
    local v15 = l_join_0(v14, {
        fromTargetId = v13.targetId
    });
    v13.debugInterface:_connect(v15);
end;
v8.attach = function(v16) --[[ Line: 43 ]] --[[ Name: attach ]]
    -- upvalues: v2 (copy)
    v16:_send({
        eventName = v2.AttachTarget
    });
end;
return v8;