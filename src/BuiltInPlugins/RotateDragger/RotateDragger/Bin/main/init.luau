return function(v0, v1) --[[ Line: 1 ]]
    local l_Parent_0 = script.Parent.Parent;
    local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
    local v4 = require(l_Parent_0.Packages.Roact);
    local l_DraggerSchemaCore_0 = l_Parent_0.Packages.DraggerSchemaCore;
    local v6 = require(l_DraggerSchemaCore_0.DraggerSchema);
    local v7 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
    local v8 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
    local v9 = require(l_DraggerFramework_0.Flags.getFFlagDraggerHandlesIsEnabledFunction);
    local v10 = require(l_DraggerFramework_0.Handles.RotateHandles);
    local v11 = nil;
    local v12 = false;
    local v13 = nil;
    local function v20() --[[ Line: 24 ]] --[[ Name: openPlugin ]]
        -- upvalues: v13 (ref), v12 (ref), v0 (copy), v1 (copy), v9 (copy), v4 (copy), v8 (copy), v11 (ref), v6 (copy), v10 (copy)
        if v13 then
            warn("Plugin handle already exists");
            return;
        else
            v12 = true;
            v0:Activate(true);
            v1.mainButton:SetActive(true);
            local function v17(v14, v15, v16) --[[ Line: 35 ]] --[[ Name: ikTransformRotateHandler ]]
                return v14:rotateToWithIk(v15, v16);
            end;
            local v18 = nil;
            if v9() then
                v18 = function(v19) --[[ Line: 41 ]]
                    if v19 and v19.basisObject then
                        return true;
                    else
                        return false;
                    end;
                end;
            end;
            v13 = v4.mount(v4.createElement(v8, {
                Mouse = v0:GetMouse(), 
                DraggerContext = v11, 
                DraggerSchema = v6, 
                DraggerSettings = {
                    AnalyticsName = "Rotate", 
                    AllowDragSelect = true, 
                    AllowFreeformDrag = true, 
                    ShowLocalSpaceIndicator = true, 
                    ShowPivotIndicator = true, 
                    HandlesList = {
                        v10.new(v11, {
                            ShowBoundingBox = true, 
                            Summonable = true, 
                            IsEnabledFunction = v9() and v18 or nil
                        }, v6.TransformHandlesImplementation.new(v11, v17))
                    }
                }
            }));
            return;
        end;
    end;
    local function _() --[[ Line: 73 ]] --[[ Name: closePlugin ]]
        -- upvalues: v12 (ref), v1 (copy), v13 (ref), v4 (copy)
        v12 = false;
        v1.mainButton:SetActive(false);
        if v13 then
            v4.unmount(v13);
            v13 = nil;
        end;
    end;
    (function() --[[ Line: 82 ]] --[[ Name: main ]]
        -- upvalues: v0 (copy), v11 (ref), v7 (copy), v6 (copy), v12 (ref), v1 (copy), v13 (ref), v4 (copy), v20 (copy)
        v0.Name = "RotateDragger";
        v11 = v7.new(v0, game, settings(), v6.Selection.new());
        v0.Deactivation:connect(function() --[[ Line: 87 ]]
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
        v1.mainButtonClickedSignal:Connect(function() --[[ Line: 93 ]]
            -- upvalues: v12 (ref), v1 (ref), v13 (ref), v4 (ref), v20 (ref)
            if v12 then
                v12 = false;
                v1.mainButton:SetActive(false);
                if v13 then
                    v4.unmount(v13);
                    v13 = nil;
                    return;
                end;
            else
                v20();
            end;
        end);
    end)();
end;