local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v5 = require(l_script_FirstAncestor_0.Src.Util.devicePlatformEnumToControllerType);
local l_getFFlagEnableVRControllers_0 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableVRControllers;
local v7 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
return function(v8, v9) --[[ Line: 14 ]] --[[ Name: setup ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_LocalizedStrings_0 (copy), l_SourceStrings_0 (copy), v7 (copy), v1 (copy), l_StudioDeviceEmulator_0 (copy), v5 (copy), l_getFFlagEnableVRControllers_0 (copy)
    v8.Name = l_script_FirstAncestor_0.Name;
    local v19 = {
        getName = function(_, _, _) --[[ Line: 19 ]] --[[ Name: getName ]]
            return "ControlsEmulatorButton";
        end, 
        getDescription = function(v13, v14, v15) --[[ Line: 28 ]] --[[ Name: getDescription ]]
            return v13(v14, v15, "Plugin", "Description");
        end, 
        icon = "rbxlocaltheme://Controller", 
        text = function(v16, v17, v18) --[[ Line: 37 ]] --[[ Name: text ]]
            return v16(v17, v18, "Plugin", "Button");
        end, 
        clickableWhenViewportHidden = true, 
        enabled = false
    };
    local l_MultipleDocumentInterfaceInstance_0 = v8.MultipleDocumentInterfaceInstance;
    local v24 = {
        plugin = v8, 
        pluginName = "ControlsEmulator", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        getToolbarName = function(_, _, _) --[[ Line: 54 ]] --[[ Name: getToolbarName ]]
            return "ControlsEmulatorToolbar";
        end, 
        buttonInfo = v19, 
        extraTriggers = {
            SessionStarted = function() --[[ Line: 61 ]] --[[ Name: SessionStarted ]]
                -- upvalues: l_MultipleDocumentInterfaceInstance_0 (copy)
                return l_MultipleDocumentInterfaceInstance_0 and l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted;
            end
        }
    };
    local l_RunService_0 = game:GetService("RunService");
    local v26 = v7.get() == v7.Standalone;
    local v27 = l_RunService_0:IsEdit();
    if v26 or v27 then
        v19.enabled = true;
        v24.dockWidgetInfo = {
            id = "ControlsEmulator", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
            getDockTitle = function(v28, v29, v30) --[[ Line: 87 ]] --[[ Name: getDockTitle ]]
                return v28(v29, v30, "Plugin", "Name");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        };
        local v31 = v1.build(v24);
        local v32 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 96 ]]
            -- upvalues: l_StudioDeviceEmulator_0 (ref)
            return l_StudioDeviceEmulator_0:GetCurrentlyEmulatedDeviceAsync();
        end);
        if l_status_0 then
            v32 = v5(l_result_0.platform, if l_getFFlagEnableVRControllers_0() then l_result_0.deviceId else nil);
            if v32 ~= nil then
                v31.mainDockWidget.Enabled = true;
            end;
        else
            warn("Failed to get currently emulated device: ", l_result_0);
        end;
        if v32 == nil then
            pcall(function() --[[ Line: 111 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), v5 (ref), l_getFFlagEnableVRControllers_0 (ref), v31 (copy)
                local v35 = nil;
                v35 = l_StudioDeviceEmulator_0.EmulatedDeviceChanged:Connect(function(v36) --[[ Line: 114 ]]
                    -- upvalues: v5 (ref), l_getFFlagEnableVRControllers_0 (ref), v31 (ref), v35 (ref)
                    if v5(v36.platform, if l_getFFlagEnableVRControllers_0() then v36.deviceId else nil) ~= nil then
                        v31.mainDockWidget.Enabled = true;
                        if v35 ~= nil then
                            v35:Disconnect();
                        end;
                    end;
                end);
            end);
        end;
        if not v31.pluginLoader:waitForUserInteraction() then
            return;
        else
            v9(v8, v31);
            return;
        end;
    else
        v1.build(v24);
        return;
    end;
end;