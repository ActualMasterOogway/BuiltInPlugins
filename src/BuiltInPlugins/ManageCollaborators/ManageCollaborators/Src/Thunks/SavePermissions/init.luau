local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetSaveState);
local v2 = require(l_Parent_0.Src.Util.SaveState);
local v3 = require(l_Parent_0.Src.Util.Analytics);
local function v14(v4, v5, v6) --[[ Line: 8 ]] --[[ Name: GetPermissionsSaveJobs ]]
    -- upvalues: v3 (copy)
    local v7 = v4:getState();
    local l_GameId_0 = game.GameId;
    local l_gamePermissionsController_0 = v5.gamePermissionsController;
    return {
        function() --[[ Line: 14 ]]
            -- upvalues: v7 (copy), l_gamePermissionsController_0 (copy), l_GameId_0 (copy), v3 (ref), v6 (copy)
            local l_CurrentPermissions_0 = v7.Permissions.CurrentPermissions;
            local l_NewPermissions_0 = v7.Permissions.NewPermissions;
            if l_NewPermissions_0 ~= nil then
                local v12, v13 = l_gamePermissionsController_0:setPermissions(l_GameId_0, l_CurrentPermissions_0, l_NewPermissions_0);
                v3.reportSaveCollaboratorsPressed(v6, v12, v13);
            end;
        end
    };
end;
return function(v15) --[[ Line: 27 ]]
    -- upvalues: v14 (copy), v1 (copy), v2 (copy)
    return function(v16, v17) --[[ Line: 28 ]]
        -- upvalues: v14 (ref), v15 (copy), v1 (ref), v2 (ref)
        local v18 = v14(v16, v17, v15);
        v16:dispatch(v1(v2.Saving));
        local v19 = 0;
        local v20 = false;
        for _, v22 in ipairs(v18) do
            coroutine.wrap(function() --[[ Line: 38 ]]
                -- upvalues: v22 (copy), v20 (ref), v16 (copy), v1 (ref), v2 (ref), v19 (ref), v18 (copy)
                local l_status_0, l_result_0 = pcall(v22);
                if not l_status_0 and not v20 then
                    warn("Failed", l_result_0);
                    v20 = true;
                    v16:dispatch(v1(v2.SaveFailed));
                end;
                v19 = v19 + 1;
                if v19 == #v18 and not v20 then
                    v16:dispatch(v1(v2.Saved));
                end;
            end)();
        end;
    end;
end;