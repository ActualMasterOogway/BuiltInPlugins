local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_UI_0 = v3.UI;
local l_Dialog_0 = l_UI_0.Dialog;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local v12 = require(l_script_FirstAncestor_0.Src.Constants);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v14 = require(l_script_FirstAncestor_0.Src.Actions.SetMode);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetScreen);
local v16 = require(l_script_FirstAncestor_0.Src.Actions.SetOwnershipTransferText);
local v17 = require(l_script_FirstAncestor_0.Src.Thunks.Export);
local v18 = require(l_script_FirstAncestor_0.Src.Components.Screens.SelectRigScreen);
local v19 = require(l_script_FirstAncestor_0.Src.Components.Screens.InputSurfaceAppearanceIdsScreen);
local v20 = require(l_script_FirstAncestor_0.Src.Components.Screens.InputAccessoryTypeScreen);
local v21 = require(l_script_FirstAncestor_0.Src.Components.Screens.InputAnimationIdScreen);
local v22 = require(l_script_FirstAncestor_0.Src.Components.Screens.ErrorScreen);
local v23 = require(l_script_FirstAncestor_0.Src.Components.Screens.OwnershipTransferScreen);
local v24 = require(l_script_FirstAncestor_0.Src.Util.getOwnershipTransferAssetIds);
local v25 = v1.PureComponent:extend("MainPlugin");
v25.init = function(v26) --[[ Line: 37 ]] --[[ Name: init ]]
    v26.onClose = function() --[[ Line: 38 ]]
        -- upvalues: v26 (copy)
        v26.props.setEnabled(false);
    end;
end;
v25.renderButtons = function(v27, v28) --[[ Line: 43 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy), v12 (copy), v24 (copy)
    local l_Localization_1 = v27.props.Localization;
    return {
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "head_button", 
            Title = l_Localization_1:getText("Plugin", "HeadButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function() --[[ Line: 54 ]] --[[ Name: OnClick ]]
                -- upvalues: v27 (copy), v12 (ref)
                v27.props.setEnabled(true);
                v27.props.setMode(v12.Modes.Head);
                v27.props.setScreen(v12.Screens.SelectRig);
            end
        }), 
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "accessory_button", 
            Title = l_Localization_1:getText("Plugin", "AccessoryButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function() --[[ Line: 67 ]] --[[ Name: OnClick ]]
                -- upvalues: v27 (copy), v12 (ref)
                v27.props.setEnabled(true);
                v27.props.setMode(v12.Modes.Accessory);
                v27.props.setScreen(v12.Screens.SelectRig);
            end
        }), 
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "mood_button", 
            Title = l_Localization_1:getText("Plugin", "MoodButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function() --[[ Line: 80 ]] --[[ Name: OnClick ]]
                -- upvalues: v27 (copy), v12 (ref)
                v27.props.setEnabled(true);
                v27.props.setMode(v12.Modes.Mood);
                v27.props.setScreen(v12.Screens.InputAnimationId);
            end
        }), 
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "export_button", 
            Title = l_Localization_1:getText("Plugin", "ExportButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function() --[[ Line: 93 ]] --[[ Name: OnClick ]]
                -- upvalues: v27 (copy)
                v27.props.export(v27.props.Plugin:get());
            end
        }), 
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "ownership_button", 
            Title = l_Localization_1:getText("Plugin", "OwnershipButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function() --[[ Line: 104 ]] --[[ Name: OnClick ]]
                -- upvalues: v27 (copy), v24 (ref), v12 (ref)
                v27.props.setEnabled(true);
                local v30 = v24();
                v27.props.setOwnershipTransferText(table.concat(v30, "\n"));
                v27.props.setScreen(v12.Screens.OwnershipTransfer);
            end
        })
    };
end;
v25.render = function(v31) --[[ Line: 114 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_PluginToolbar_0 (copy), l_Dialog_0 (copy), v12 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy)
    local l_props_0 = v31.props;
    local l_Localization_2 = l_props_0.Localization;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = l_Localization_2:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v34) --[[ Line: 125 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v31 (copy)
                return v31:renderButtons(v34);
            end
        }), 
        MainWidget = l_props_0.enabled and v1.createElement(l_Dialog_0, {
            Enabled = l_props_0.enabled, 
            Modal = true, 
            Title = l_Localization_2:getText("Plugin", "Name"), 
            Resizable = false, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            Size = v12.WindowSize, 
            OnClose = v31.onClose, 
            [v1.Change.Enabled] = v31.onClose
        }, {
            SelectRigScreen = if l_props_0.screen == v12.Screens.SelectRig then v1.createElement(v18) else nil, 
            InputSurfaceAppearanceIdsScreen = if l_props_0.screen == v12.Screens.InputSurfaceAppearanceIds then v1.createElement(v19) else nil, 
            InputAccessoryTypeScreen = if l_props_0.screen == v12.Screens.InputAccessoryType then v1.createElement(v20) else nil, 
            InputAnimationIdScreen = if l_props_0.screen == v12.Screens.InputAnimationId then v1.createElement(v21) else nil, 
            ErrorScreen = if l_props_0.screen == v12.Screens.Error then v1.createElement(v22) else nil, 
            OwnershipTransferScreen = if l_props_0.screen == v12.Screens.OwnershipTransfer then v1.createElement(v23) else nil
        }) or nil
    });
end;
v25 = l_withContext_0({
    Localization = l_Localization_0, 
    Plugin = l_Plugin_0
})(v25);
return v2.connect(function(v35, _) --[[ Line: 165 ]] --[[ Name: mapStateToProps ]]
    return {
        enabled = v35.PluginReducer.enabled, 
        screen = v35.PluginReducer.screen
    };
end, function(v37) --[[ Line: 172 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy), v14 (copy), v16 (copy), v15 (copy), v17 (copy)
    return {
        setEnabled = function(v38) --[[ Line: 174 ]] --[[ Name: setEnabled ]]
            -- upvalues: v37 (copy), v13 (ref)
            v37(v13(v38));
        end, 
        setMode = function(v39) --[[ Line: 177 ]] --[[ Name: setMode ]]
            -- upvalues: v37 (copy), v14 (ref)
            v37(v14(v39));
        end, 
        setOwnershipTransferText = function(v40) --[[ Line: 180 ]] --[[ Name: setOwnershipTransferText ]]
            -- upvalues: v37 (copy), v16 (ref)
            v37(v16(v40));
        end, 
        setScreen = function(v41) --[[ Line: 183 ]] --[[ Name: setScreen ]]
            -- upvalues: v37 (copy), v15 (ref)
            v37(v15(v41));
        end, 
        export = function(v42) --[[ Line: 186 ]] --[[ Name: export ]]
            -- upvalues: v37 (copy), v17 (ref)
            v37(v17(v42));
        end
    };
end)(v25);