local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetFrameBuffer);
local v3 = require(l_Actions_0.SetSendPayloadAnalytics);
local v4 = require(l_Actions_0.SetSkipCounter);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v6 = require(l_Thunks_0.RenderAdornments);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v8 = require(l_Util_0.traverse);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v10, v11) --[[ Line: 26 ]]
    -- upvalues: v8 (copy), v3 (copy), v4 (copy), v2 (copy), v6 (copy)
    return function(v12) --[[ Line: 27 ]]
        -- upvalues: v10 (copy), v8 (ref), v11 (copy), v3 (ref), v4 (ref), v2 (ref), v6 (ref)
        local v13 = v12:getState();
        if v13.Status.HistoryOffset ~= nil then
            return;
        else
            local l_SendPayloadAnalytics_0 = v13.Status.SendPayloadAnalytics;
            local v15 = {};
            local v16 = 0;
            local v17 = {};
            if v10 then
                v8(v10, function(v18, v19) --[[ Line: 43 ]]
                    -- upvalues: v15 (copy), l_SendPayloadAnalytics_0 (copy), v16 (ref), v17 (copy)
                    if v18.children then
                        for _, v21 in v18.children do
                            v21.weight = (v21.weight or 1) * (v18.weight or 1);
                        end;
                    end;
                    if v18.id then
                        v15[v18.id] = v18;
                    end;
                    if l_SendPayloadAnalytics_0 then
                        v16 = math.max(v19, v16);
                        if v18.className then
                            local v22 = v17[v18.className] or {
                                count = 0, 
                                children = 0
                            };
                            v22.count = v22.count + 1;
                            v22.children = v22.children + if v18.children then #v18.children else 0;
                            v17[v18.className] = v22;
                        end;
                    end;
                end);
                local v23 = v12:getState().DebugData.FrameBuffer:clone();
                v23:push({
                    payload = v10, 
                    layerMap = v15, 
                    timestamp = v10.timestamp
                });
                if l_SendPayloadAnalytics_0 and v11 then
                    local v24 = {};
                    for v25, v26 in v17 do
                        v26.name = v25;
                        table.insert(v24, v26);
                    end;
                    v11:report("onCompositorConnected", v16, v24);
                    v12:dispatch(v3(false));
                end;
                local v27 = 1 + v13.Status.SkipCounter % (v13.Status.SkipLimit + 1);
                v12:dispatch(v4(v27));
                v12:dispatch(v2(v23));
                v12:dispatch(v6());
            end;
            return;
        end;
    end;
end;