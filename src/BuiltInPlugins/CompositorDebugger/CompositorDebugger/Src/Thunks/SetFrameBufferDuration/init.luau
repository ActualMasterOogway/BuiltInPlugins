local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetFrameBuffer);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.CircularBuffer);
local v5 = require(l_Util_0.Constants);
return function(v6) --[[ Line: 18 ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy)
    return function(v7) --[[ Line: 19 ]]
        -- upvalues: v6 (copy), v5 (ref), v4 (ref), v2 (ref)
        local l_FrameBuffer_0 = v7:getState().DebugData.FrameBuffer;
        local v9 = v6 * v5.FRAMERATE;
        local v10 = nil;
        if l_FrameBuffer_0 then
            if l_FrameBuffer_0:getSize() == v9 then
                return;
            else
                v10 = l_FrameBuffer_0:resize(v9);
            end;
        else
            v10 = v4.new(v9);
        end;
        v7:dispatch(v2(v10));
    end;
end;