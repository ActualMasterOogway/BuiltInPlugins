local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_ClearSettings_0 = v2.ClearSettings;
local l_Tab_0 = v2.Tab;
local l_Tool_0 = v2.Tool;
local v7 = {
    {
        Defaults = {}, 
        Id = l_Category_0.ClearSettings
    }
};
local v8 = v1:new(l_Tool_0.Clear, l_Tab_0.Create, v7, {});
v8.init = function(v9, v10, v11) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_Category_0 (copy), l_ClearSettings_0 (copy), l_Tool_0 (copy)
    v1.init(v9, v10, v11);
    v9._overrides = {
        [l_Category_0.ClearSettings] = {
            [l_ClearSettings_0.Clear] = {
                Disabled = v11.Terrain:CountCells() == 0, 
                Hidden = false, 
                Label = "", 
                Schema = {
                    OnClick = function() --[[ Line: 32 ]] --[[ Name: OnClick ]]
                        -- upvalues: v11 (copy), v9 (copy), l_Category_0 (ref), l_ClearSettings_0 (ref), l_Tool_0 (ref)
                        v11.Terrain:Clear();
                        v11.ChangeHistoryService:SetWaypoint("Cleared Terrain");
                        v9._overrides[l_Category_0.ClearSettings][l_ClearSettings_0.Clear].Disabled = true;
                        v9.OnInternalsChanged:Fire();
                        v9._analytics:report("Usage", l_Tool_0.Clear, 1);
                    end
                }, 
                Value = true
            }
        }
    };
end;
v8.setDisabledState = function(v12) --[[ Line: 48 ]] --[[ Name: setDisabledState ]]
    -- upvalues: l_Category_0 (copy), l_ClearSettings_0 (copy)
    local _ = v12:getPayload();
    local v14 = v12._services.Terrain:CountCells() == 0;
    if v12._overrides[l_Category_0.ClearSettings][l_ClearSettings_0.Clear].Disabled ~= v14 then
        v12._overrides[l_Category_0.ClearSettings][l_ClearSettings_0.Clear].Disabled = v14;
        v12.OnInternalsChanged:Fire();
    end;
end;
v8.updateDisabled = function(v15) --[[ Line: 59 ]] --[[ Name: updateDisabled ]]
    -- upvalues: l_Category_0 (copy), l_ClearSettings_0 (copy)
    v15._overrides[l_Category_0.ClearSettings][l_ClearSettings_0.Clear].Disabled = v15._services.Terrain:CountCells() == 0;
end;
v8.activate = function(v16) --[[ Line: 63 ]] --[[ Name: activate ]]
    -- upvalues: v1 (copy), l_Tool_0 (copy)
    v1.activate(v16);
    v16:setDisabledState();
    v16._undo = v16._services.ChangeHistoryService.OnUndo:Connect(function() --[[ Line: 67 ]]
        -- upvalues: v16 (copy)
        v16:setDisabledState();
    end);
    v16._redo = v16._services.ChangeHistoryService.OnRedo:Connect(function() --[[ Line: 71 ]]
        -- upvalues: v16 (copy)
        v16:setDisabledState();
    end);
    v16._analytics:report("Activated", l_Tool_0.Clear);
end;
v8.deactivate = function(v17) --[[ Line: 77 ]] --[[ Name: deactivate ]]
    -- upvalues: v1 (copy)
    v1.deactivate(v17);
    if v17._undo then
        v17._undo:Disconnect();
    end;
    if v17._redo then
        v17._redo:Disconnect();
    end;
end;
return v8;