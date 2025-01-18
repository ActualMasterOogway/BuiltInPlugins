return function(v0, v1) --[[ Line: 2 ]]
    if not v0 then
        return;
    else
        local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
        local l_Parent_0 = script.Parent.Parent;
        local v4 = require(l_Parent_0.Packages.Roact);
        local v5 = require(l_Parent_0.Packages.Rodux);
        local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
        local l_Util_0 = l_Parent_0.Src.Util;
        local v8 = require(l_Parent_0.Src.Resources.MakeTheme);
        local v9 = require(l_Util_0.Constants);
        local v10 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v11 = require(l_Parent_0.Src.Networking.NetworkInterface);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local l_Localization_0 = l_ContextServices_0.Localization;
        local v15 = require(l_Parent_0.Src.Components.ServiceWrapper);
        local v16 = require(l_Parent_0.Src.Components.ConvertToPackageWindow.ScreenSelect);
        local v17 = l_Localization_0.new({
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            pluginName = l_Parent_0.Name
        });
        local v18 = nil;
        local v19 = nil;
        local function v21() --[[ Line: 40 ]] --[[ Name: makePluginGui ]]
            -- upvalues: l_Parent_0 (copy), v19 (ref), v0 (copy), l_DebugBuiltInPluginModalsNotBlocking_0 (copy), v17 (copy), v18 (ref), v4 (copy)
            local l_Name_0 = l_Parent_0.Name;
            v19 = v0:CreateQWidgetPluginGui(l_Name_0, {
                Size = Vector2.new(960, 600), 
                MinSize = Vector2.new(960, 600), 
                Resizable = true, 
                Modal = not l_DebugBuiltInPluginModalsNotBlocking_0, 
                InitialEnabled = false
            });
            v19.Name = v17:getText("Meta", "PluginName");
            v19.Title = v17:getText("Meta", "PluginName");
            v19.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v19:GetPropertyChangedSignal("Enabled"):connect(function() --[[ Line: 54 ]]
                -- upvalues: v19 (ref), v18 (ref), v4 (ref)
                if not v19.Enabled and v18 then
                    v4.unmount(v18);
                    v18 = nil;
                end;
            end);
        end;
        local function v22() --[[ Line: 65 ]] --[[ Name: onAssetConfigDestroy ]]
            -- upvalues: v18 (ref), v4 (copy), v19 (ref)
            if v18 then
                v4.unmount(v18);
                v18 = nil;
            end;
            v19.Enabled = false;
        end;
        local function v30(v23, v24, v25) --[[ Line: 79 ]] --[[ Name: openAssetConfigWindow ]]
            -- upvalues: v18 (ref), v5 (copy), v10 (copy), v8 (copy), v11 (copy), v4 (copy), v15 (copy), v0 (copy), v19 (ref), v17 (copy), v16 (copy), v22 (copy), v9 (copy)
            if v18 then
                return;
            else
                local v26 = v5.Store.new(v10, {
                    AssetConfigReducer = {
                        instances = v23, 
                        clonedInstances = v25
                    }
                }, {
                    v5.thunkMiddleware
                });
                local v27 = v8();
                local v28 = v11.new();
                local v29 = v4.createElement(v15, {
                    plugin = v0, 
                    store = v26, 
                    theme = v27, 
                    mouse = v0:GetMouse(), 
                    focusGui = v19, 
                    networkInterface = v28, 
                    localization = v17
                }, {
                    v4.createElement(v16, {
                        onClose = v22, 
                        assetName = v24, 
                        pluginGui = v19, 
                        currentScreen = v9.SCREENS.CONFIGURE_ASSET, 
                        instances = v23
                    })
                });
                v18 = v4.mount(v29, v19);
                v19.Enabled = true;
                return v18;
            end;
        end;
        local function _() --[[ Line: 116 ]] --[[ Name: main ]]
            -- upvalues: v0 (copy), l_Parent_0 (copy), v21 (copy), v1 (copy), v30 (copy)
            v0.Name = l_Parent_0.Name;
            v21();
            v1.signals["PackageUIService.OnOpenConvertToPackagePlugin"]:Connect(function(v31, v32, v33) --[[ Line: 120 ]]
                -- upvalues: v30 (ref)
                v30(v31, v32, v33);
            end);
        end;
        v0.Name = l_Parent_0.Name;
        v21();
        v1.signals["PackageUIService.OnOpenConvertToPackagePlugin"]:Connect(function(v35, v36, v37) --[[ Line: 120 ]]
            -- upvalues: v30 (copy)
            v30(v35, v36, v37);
        end);
        return;
    end;
end;