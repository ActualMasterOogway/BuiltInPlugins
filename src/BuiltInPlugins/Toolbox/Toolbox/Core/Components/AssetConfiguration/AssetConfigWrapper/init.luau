local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
local l_Packages_0 = l_Parent_0.Packages;
local v4 = require(l_Packages_0.Roact);
local l_Components_0 = l_Parent_0.Core.Components;
local v6 = require(l_Components_0.PluginWidget.Dialog);
local v7 = require(l_Components_0.AssetConfiguration.ScreenSelect);
local v8 = require(l_Parent_0.Core.Themes.getAssetConfigTheme);
local v9 = require(l_Util_0.AssetConfigConstants);
local v10 = require(l_Util_0.makeTheme);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v12 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v13 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxModelUploadNonBlocking);
local v15 = v4.PureComponent:extend("AssetConfigWrapper");
v15.init = function(v16, _) --[[ Line: 42 ]] --[[ Name: init ]]
    v16.state = {
        popUpGui = nil
    };
    v16.popUpRefFunc = function(v18) --[[ Line: 47 ]]
        -- upvalues: v16 (copy)
        v16.popUpGuiRef = v18;
    end;
    v16.onClose = function(_) --[[ Line: 51 ]]
        -- upvalues: v16 (copy)
        if v16.props.onAssetConfigDestroy then
            v16.props.onAssetConfigDestroy();
        end;
    end;
end;
v15.didMount = function(v20) --[[ Line: 58 ]] --[[ Name: didMount ]]
    v20:setState({
        popUpGui = v20.popUpGuiRef
    });
end;
v15.render = function(v21) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v6 (copy), v9 (copy), v14 (copy), l_DebugBuiltInPluginModalsNotBlocking_0 (copy), l_ContextServices_0 (copy), v12 (copy), v13 (copy), v10 (copy), v8 (copy), v7 (copy)
    local l_props_0 = v21.props;
    local l_state_0 = v21.state;
    local l_assetId_0 = l_props_0.assetId;
    local l_assetTypeEnum_0 = l_props_0.assetTypeEnum;
    local l_networkInterface_0 = l_props_0.networkInterface;
    local l_plugin_0 = l_props_0.plugin;
    return v4.createElement(v6, {
        Title = "Asset Configuration", 
        Resizable = true, 
        MinSize = Vector2.new(v9.MIN_WIDTH, v9.MIN_HEIGHT), 
        Size = Vector2.new(v9.WIDTH, v9.HEIGHT), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        Modal = not v14() and not l_DebugBuiltInPluginModalsNotBlocking_0, 
        InitialEnabled = true, 
        plugin = l_plugin_0, 
        [v4.Change.Enabled] = v21.onClose, 
        [v4.Ref] = v21.popUpRefFunc, 
        [v4.Event.AncestryChanged] = v21.onAncestryChanged
    }, {
        ContextServices = if l_state_0.popUpGui then l_ContextServices_0.provide({
            l_ContextServices_0.Focus.new(l_state_0.popUpGui), 
            v12.new(l_state_0.popUpGui), 
            v13.new(l_networkInterface_0), 
            v10(v8())
        }, {
            ScreenSelect = v4.createElement(v7, {
                assetId = l_assetId_0, 
                assetTypeEnum = l_assetTypeEnum_0, 
                onClose = v21.onClose, 
                pluginGui = l_state_0.popUpGui
            })
        }) else nil
    });
end;
return v15;