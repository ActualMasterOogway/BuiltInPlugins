local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useState_0 = v2.useState;
local l_useEffect_0 = v2.useEffect;
return function(v6) --[[ Line: 29 ]] --[[ Name: useOperation ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), v1 (copy), l_useCallback_0 (copy)
    local v7 = v6:getTool();
    local v8, v9 = l_useState_0(false);
    local v10, v11 = l_useState_0({
        Operation = l_useState_0(v7:operation()), 
        Paused = l_useState_0(false), 
        Progress = l_useState_0(0)
    });
    l_useEffect_0(function() --[[ Line: 43 ]]
        -- upvalues: v7 (copy), v11 (copy), v9 (copy)
        local v13 = v7.OnOperationChanged:Connect(function() --[[ Line: 44 ]]
            -- upvalues: v7 (ref), v11 (ref), v9 (ref)
            local v12 = v7:operation();
            v11({
                Operation = v12, 
                Paused = v12:isPaused(), 
                Progress = v12:getProgress()
            });
            v9(v12:hasStarted());
        end);
        return function() --[[ Line: 55 ]]
            -- upvalues: v13 (copy)
            v13:Disconnect();
        end;
    end, {
        v7
    });
    l_useEffect_0(function() --[[ Line: 64 ]]
        -- upvalues: v10 (copy), v9 (copy), v11 (copy), v1 (ref)
        if not v10.Operation then
            return;
        else
            local v14 = v10.Operation.Canceled:Connect(function() --[[ Line: 69 ]]
                -- upvalues: v9 (ref)
                v9(false);
            end);
            local v15 = v10.Operation.Finished:Connect(function() --[[ Line: 73 ]]
                -- upvalues: v9 (ref)
                v9(false);
            end);
            local v16 = v10.Operation.Paused:Connect(function() --[[ Line: 77 ]]
                -- upvalues: v11 (ref), v1 (ref), v10 (ref)
                v11(v1.join(v10, {
                    Paused = true
                }));
            end);
            local v19 = v10.Operation.ProgressChanged:Connect(function(v17, v18) --[[ Line: 84 ]]
                -- upvalues: v11 (ref), v1 (ref), v10 (ref)
                v11(v1.join(v10, {
                    Progress = v17, 
                    TimeRemaining = v18
                }));
            end);
            local v20 = v10.Operation.Resumed:Connect(function() --[[ Line: 92 ]]
                -- upvalues: v11 (ref), v1 (ref), v10 (ref)
                v11(v1.join(v10, {
                    Paused = false
                }));
            end);
            local v21 = v10.Operation.Started:Connect(function() --[[ Line: 98 ]]
                -- upvalues: v9 (ref)
                v9(true);
            end);
            if v10.Operation:hasFinished() then
                v9(false);
            end;
            return function() --[[ Line: 106 ]]
                -- upvalues: v14 (copy), v15 (copy), v16 (copy), v19 (copy), v20 (copy), v21 (copy)
                v14:Disconnect();
                v15:Disconnect();
                v16:Disconnect();
                v19:Disconnect();
                v20:Disconnect();
                v21:Disconnect();
            end;
        end;
    end, {
        v7, 
        v10.Operation, 
        v10.Paused, 
        v10.Progress, 
        v10.TimeRemaining
    });
    local v22 = l_useCallback_0(function() --[[ Line: 116 ]]
        -- upvalues: v10 (copy)
        if v10.Operation and not v10.Operation:isPaused() then
            v10.Operation:pause();
        end;
    end, {
        v7, 
        v10.Operation
    });
    local v23 = l_useCallback_0(function() --[[ Line: 122 ]]
        -- upvalues: v10 (copy)
        if v10.Operation and v10.Operation:isPaused() then
            v10.Operation:resume();
        end;
    end, {
        v7, 
        v10.Operation
    });
    local v24 = l_useCallback_0(function() --[[ Line: 128 ]]
        -- upvalues: v10 (copy)
        if v10.Operation then
            v10.Operation:cancel();
        end;
    end, {
        v7, 
        v10.Operation
    });
    if v10.Operation then
        return {
            Description = v10.Operation:getDescription(), 
            Enabled = v8, 
            OnCancel = if v10.Operation:canCancel() then v24 else nil, 
            OnClose = v24, 
            OnPause = if v10.Operation:canPause() then v22 else nil, 
            OnResume = if v10.Operation:canResume() then v23 else nil, 
            Paused = v10.Paused, 
            Progress = v10.Progress, 
            TimeRemaining = v10.TimeRemaining, 
            Title = v10.Operation:getName()
        };
    else
        return nil;
    end;
end;