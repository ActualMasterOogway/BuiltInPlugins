return function(v0, v1) --[[ Line: 1 ]]
    local l_Parent_0 = script.Parent.Parent;
    local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
    local v4 = require(l_Parent_0.Packages.Roact);
    local v5 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
    local v6 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
    local v7 = require(l_DraggerFramework_0.Flags.getFFlagDraggerHandlesIsEnabledFunction);
    local v8 = require(l_DraggerFramework_0.Handles.ExtrudeHandles);
    local l_DraggerSchemaCore_0 = l_Parent_0.Packages.DraggerSchemaCore;
    local v10 = require(l_DraggerSchemaCore_0.DraggerSchema);
    local v11 = nil;
    local v12 = false;
    local v13 = nil;
    local function v16() --[[ Line: 24 ]] --[[ Name: openPlugin ]]
        -- upvalues: v13 (ref), v12 (ref), v0 (copy), v1 (copy), v7 (copy), v4 (copy), v6 (copy), v11 (ref), v10 (copy), v8 (copy)
        if v13 then
            warn("Plugin handle already exists");
            return;
        else
            v12 = true;
            v0:Activate(true);
            v1.mainButton:SetActive(true);
            local v14 = nil;
            if v7() then
                v14 = function(v15) --[[ Line: 37 ]]
                    if v15 and v15.basisObject then
                        return true;
                    else
                        return false;
                    end;
                end;
            end;
            v13 = v4.mount(v4.createElement(v6, {
                Mouse = v0:GetMouse(), 
                DraggerContext = v11, 
                DraggerSchema = v10, 
                DraggerSettings = {
                    AnalyticsName = "Scale", 
                    AllowDragSelect = true, 
                    AllowFreeformDrag = true, 
                    ShowLocalSpaceIndicator = true, 
                    ShowPivotIndicator = true, 
                    HandlesList = {
                        v8.new(v11, {
                            ShowBoundingBox = true, 
                            Summonable = true, 
                            IsEnabledFunction = v7() and v14 or nil
                        }, v10.ExtrudeHandlesImplementation.new(v11))
                    }
                }
            }));
            return;
        end;
    end;
    local function _() --[[ Line: 69 ]] --[[ Name: closePlugin ]]
        -- upvalues: v12 (ref), v1 (copy), v13 (ref), v4 (copy)
        v12 = false;
        v1.mainButton:SetActive(false);
        if v13 then
            v4.unmount(v13);
            v13 = nil;
        end;
    end;
    (function() --[[ Line: 78 ]] --[[ Name: main ]]
        -- upvalues: v0 (copy), v11 (ref), v5 (copy), v10 (copy), v12 (ref), v1 (copy), v13 (ref), v4 (copy), v16 (copy)
        v0.Name = "ScaleDragger";
        v11 = v5.new(v0, game, settings(), v10.Selection.new());
        v0.Deactivation:Connect(function() --[[ Line: 83 ]]
            -- upvalues: v12 (ref), v1 (ref), v13 (ref), v4 (ref)
            if v12 then
                v12 = false;
                v1.mainButton:SetActive(false);
                if v13 then
                    v4.unmount(v13);
                    v13 = nil;
                end;
            end;
        end);
        v1.mainButtonClickedSignal:Connect(function() --[[ Line: 89 ]]
            -- upvalues: v12 (ref), v1 (ref), v13 (ref), v4 (ref), v16 (ref)
            if v12 then
                v12 = false;
                v1.mainButton:SetActive(false);
                if v13 then
                    v4.unmount(v13);
                    v13 = nil;
                    return;
                end;
            else
                v16();
            end;
        end);
    end)();
end;