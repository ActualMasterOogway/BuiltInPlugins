local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_Tab_0 = v2.Tab;
local l_Tool_0 = v2.Tool;
local l_UpgradeSettings_0 = v2.UpgradeSettings;
local l_Operations_0 = l_script_FirstAncestor_0.Src.Util.Operations;
local v8 = require(l_Operations_0.ShorelinesOperation);
local v9 = require(l_Operations_0.SmoothVoxelsOperation);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagSmoothVoxels_Tooling);
local v11 = {
    {
        Defaults = {}, 
        Id = l_Category_0.UpgradeSettings
    }
};
local v12 = v1:new(l_Tool_0.Empty, l_Tab_0.None, v11, {});
v12.form = function(v13) --[[ Line: 28 ]] --[[ Name: form ]]
    -- upvalues: v1 (copy)
    local v14 = v1.form(v13);
    local v15 = {};
    for v16, v17 in v14 do
        local v18 = false;
        for _, v20 in v17.Children do
            if not v20.Hidden then
                v18 = true;
            end;
        end;
        if v18 then
            v15[v16] = v17;
        end;
    end;
    return v15;
end;
v12.init = function(v21, v22, v23) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_Category_0 (copy), l_UpgradeSettings_0 (copy), v8 (copy), v10 (copy), v9 (copy)
    v1.init(v21, v22, v23);
    v21._overrides = {
        [l_Category_0.UpgradeSettings] = {
            [l_UpgradeSettings_0.Shorelines] = {
                Hidden = not v23.Terrain or not v23.Terrain:CanShorelinesBeUpgraded(), 
                Label = "", 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    OnClick = function() --[[ Line: 59 ]] --[[ Name: OnClick ]]
                        -- upvalues: v21 (copy), v8 (ref), l_UpgradeSettings_0 (ref), v23 (copy), l_Category_0 (ref)
                        local v24 = v21:getPayload();
                        v21._operation = v8(v21._localization:getText("Operations", (("%*Name"):format(l_UpgradeSettings_0.Shorelines))), v21._localization:getText("Operations", (("%*Description"):format(l_UpgradeSettings_0.Shorelines))), v23, function(v25) --[[ Line: 66 ]]
                            -- upvalues: v21 (ref), l_Category_0 (ref), l_UpgradeSettings_0 (ref)
                            v21._overrides[l_Category_0.UpgradeSettings][l_UpgradeSettings_0.Shorelines].Hidden = not v25;
                            v21.OnInternalsChanged:Fire();
                        end);
                        v21._operation:start({
                            Payload = v24
                        });
                        v21.OnOperationChanged:Fire();
                    end
                }, 
                Value = true
            }, 
            [l_UpgradeSettings_0.SmoothVoxels] = if v10() then {
                Hidden = not v23.Terrain or not v23.Terrain:CanSmoothVoxelsBeUpgraded(), 
                Label = "", 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    OnClick = function() --[[ Line: 86 ]] --[[ Name: OnClick ]]
                        -- upvalues: v21 (copy), v9 (ref), l_UpgradeSettings_0 (ref), v23 (copy), l_Category_0 (ref)
                        local v26 = v21:getPayload();
                        v21._operation = v9(v21._localization:getText("Operations", (("%*Name"):format(l_UpgradeSettings_0.SmoothVoxels))), v21._localization:getText("Operations", (("%*Description"):format(l_UpgradeSettings_0.SmoothVoxels))), v23, function(v27) --[[ Line: 93 ]]
                            -- upvalues: v21 (ref), l_Category_0 (ref), l_UpgradeSettings_0 (ref)
                            v21._overrides[l_Category_0.UpgradeSettings][l_UpgradeSettings_0.SmoothVoxels].Hidden = not v27;
                            v21.OnInternalsChanged:Fire();
                        end);
                        v21._operation:start({
                            Payload = v26
                        });
                        v21.OnOperationChanged:Fire();
                    end
                }, 
                Value = true
            } else nil
        }
    };
    v21:createConnections();
end;
v12.operation = function(v28) --[[ Line: 114 ]] --[[ Name: operation ]]
    return v28._operation;
end;
v12.updateUpgrades = function(v29) --[[ Line: 118 ]] --[[ Name: updateUpgrades ]]
    -- upvalues: l_Category_0 (copy), l_UpgradeSettings_0 (copy), v10 (copy)
    v29._overrides[l_Category_0.UpgradeSettings][l_UpgradeSettings_0.Shorelines].Hidden = not v29._services.Terrain or not v29._services.Terrain:CanShorelinesBeUpgraded();
    if v10() then
        v29._overrides[l_Category_0.UpgradeSettings][l_UpgradeSettings_0.SmoothVoxels].Hidden = not v29._services.Terrain or not v29._services.Terrain:CanSmoothVoxelsBeUpgraded();
    end;
    v29.OnInternalsChanged:Fire();
end;
v12.createConnections = function(v30) --[[ Line: 129 ]] --[[ Name: createConnections ]]
    v30._changeHistoryOnUndoConnection = v30._services.ChangeHistoryService.OnUndo:Connect(function() --[[ Line: 130 ]]
        -- upvalues: v30 (copy)
        v30:updateUpgrades();
    end);
    v30._changeHistoryOnRedoConnection = v30._services.ChangeHistoryService.OnRedo:Connect(function() --[[ Line: 134 ]]
        -- upvalues: v30 (copy)
        v30:updateUpgrades();
    end);
end;
v12.activate = function(v31) --[[ Line: 139 ]] --[[ Name: activate ]]
    -- upvalues: v1 (copy)
    v1.activate(v31);
    v31:updateUpgrades();
end;
v12.deactivate = function(v32) --[[ Line: 145 ]] --[[ Name: deactivate ]]
    -- upvalues: v1 (copy)
    v1.deactivate(v32);
    if v32._changeHistoryOnUndoConnection then
        v32._changeHistoryOnUndoConnection:Disconnect();
        v32._changeHistoryOnUndoConnection = nil;
    end;
    if v32._changeHistoryOnRedoConnection then
        v32._changeHistoryOnRedoConnection:Disconnect();
        v32._changeHistoryOnRedoConnection = nil;
    end;
end;
return v12;