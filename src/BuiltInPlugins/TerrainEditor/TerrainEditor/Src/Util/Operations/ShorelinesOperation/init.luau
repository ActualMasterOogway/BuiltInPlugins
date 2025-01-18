local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Operations.BaseOperation);
return function(v2, v3, v4, v5) --[[ Line: 15 ]] --[[ Name: ShorelinesOperation ]]
    -- upvalues: v1 (copy)
    return v1.new({
        AllowCancel = true, 
        Description = v3, 
        Name = v2, 
        OnCancel = function() --[[ Line: 38 ]] --[[ Name: onCancel ]]
            -- upvalues: v4 (copy), v5 (copy)
            v4.ShorelineUpgraderService:Cancel();
            v5(v4.Terrain and v4.Terrain:CanShorelinesBeUpgraded());
        end, 
        OnFinish = function() --[[ Line: 43 ]] --[[ Name: onFinish ]]
            -- upvalues: v4 (copy), v5 (copy)
            v4.ChangeHistoryService:SetWaypoint("Upgrade Shorelines");
            v5(v4.Terrain and v4.Terrain:CanShorelinesBeUpgraded());
        end, 
        OnStart = function(v6, _) --[[ Line: 16 ]] --[[ Name: onStart ]]
            -- upvalues: v4 (copy)
            v4.ShorelineUpgraderService:Start();
            v4.ShorelineUpgraderService.Status:Connect(function(v8) --[[ Line: 18 ]]
                -- upvalues: v6 (copy)
                assert(v6.State, "Tried to update the state without it existing.");
                v6.State.Percent = v8;
            end);
            v6.State = {
                Percent = 0
            };
        end, 
        OnStep = function(v9, _) --[[ Line: 29 ]] --[[ Name: onStep ]]
            -- upvalues: v5 (copy), v4 (copy)
            assert(v9.State, "Tried to step without starting first.");
            local l_State_0 = v9.State;
            v5(v4.Terrain and v4.Terrain:CanShorelinesBeUpgraded());
            return l_State_0.Percent < 1, l_State_0.Percent;
        end
    });
end;