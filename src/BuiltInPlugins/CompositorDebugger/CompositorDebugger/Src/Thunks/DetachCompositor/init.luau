local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetDebugDataEvent);
local v3 = require(l_Actions_0.SetPropertyOverridesEvent);
local v4 = require(l_Actions_0.SetDebugPoseEvent);
local v5 = require(l_Actions_0.SetActor);
local v6 = require(l_Actions_0.SetFrameBuffer);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v8 = require(l_Util_0.Constants);
return function() --[[ Line: 19 ]]
    -- upvalues: v8 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy)
    return function(v9) --[[ Line: 20 ]]
        -- upvalues: v8 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref)
        local l_Actor_0 = v9:getState().Status.Actor;
        if not l_Actor_0 then
            return;
        else
            local l_DebugDataConnection_0 = v9:getState().Status.DebugDataConnection;
            if l_DebugDataConnection_0 then
                l_DebugDataConnection_0:Disconnect();
            end;
            local l_l_Actor_0_FirstChild_0 = l_Actor_0:FindFirstChild(v8.FOLDERS.CompositorDebugger);
            if l_l_Actor_0_FirstChild_0 then
                l_l_Actor_0_FirstChild_0:Destroy();
            end;
            local l_FrameBuffer_0 = v9:getState().DebugData.FrameBuffer;
            local v14 = if l_FrameBuffer_0 then l_FrameBuffer_0:clear() else nil;
            v9:dispatch(v2(nil, nil));
            v9:dispatch(v3(nil));
            v9:dispatch(v4(nil));
            v9:dispatch(v5(nil));
            v9:dispatch(v6(v14));
            return;
        end;
    end;
end;