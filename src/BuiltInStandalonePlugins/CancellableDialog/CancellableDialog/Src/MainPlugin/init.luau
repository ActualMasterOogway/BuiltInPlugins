local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Design_0 = l_ContextServices_0.Design;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v12 = require(l_Components_0.DialogContainer);
local v13 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableStudioThumbnailController();
local v14 = v1.PureComponent:extend("MainPlugin");
v14.init = function(v15, v16) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy), v13 (copy)
    v15.state = {
        title = "", 
        subtitle = "", 
        status = "", 
        enabled = false, 
        cancelButtonEnabled = true, 
        cancelRequested = false, 
        imageRbxId = ""
    };
    v15.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "CancellableDialog"
    });
    v15.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 51 ]]
        return {};
    end, {});
    v15.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v15.design = l_registerPluginStyles_0(v16.Plugin);
    v15.cancellableDialogManager = v16.Plugin:GetPluginComponent("CancellableDialogManager");
    v15.updateTitleTextConnection = v15.cancellableDialogManager.UpdateTitleText:Connect(function(v17) --[[ Line: 60 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            title = v17
        });
    end);
    v15.updateSubtitleTextConnection = v15.cancellableDialogManager.UpdateSubtitleText:Connect(function(v18) --[[ Line: 67 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            subtitle = v18
        });
    end);
    v15.updateStatusTextConnection = v15.cancellableDialogManager.UpdateStatusText:Connect(function(v19) --[[ Line: 74 ]]
        -- upvalues: v15 (copy)
        if v15.state.cancelRequested then
            return;
        else
            v15:setState({
                status = v19
            });
            return;
        end;
    end);
    v15.showDialogConnection = v15.cancellableDialogManager.ShowDialog:Connect(function(v20) --[[ Line: 84 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            enabled = true, 
            cancelButtonEnabled = true, 
            title = v20.Title, 
            subtitle = v20.Subtitle, 
            status = v20.Status, 
            cancelRequested = false
        });
    end);
    v15.hideDialogConnection = v15.cancellableDialogManager.HideDialog:Connect(function() --[[ Line: 95 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            enabled = false, 
            title = "", 
            subtitle = "", 
            status = ""
        });
    end);
    v15.disableCancelButtonConnection = v15.cancellableDialogManager.DisableCancel:Connect(function() --[[ Line: 104 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            cancelButtonEnabled = false
        });
    end);
    if v13 then
        v15.updateImageConnection = v15.cancellableDialogManager.UpdateImage:Connect(function(v21) --[[ Line: 111 ]]
            -- upvalues: v15 (copy)
            v15:setState({
                imageRbxId = v21
            });
        end);
    end;
    task.spawn(function() --[[ Line: 118 ]]
        -- upvalues: v15 (copy)
        v15.cancellableDialogManager:OnPluginInitializedAsync();
    end);
end;
v14.render = function(v22) --[[ Line: 123 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), l_Design_0 (copy), v1 (copy), v12 (copy), v13 (copy)
    local l_props_0 = v22.props;
    local l_state_0 = v22.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v22.localization, 
        v22.analytics, 
        l_Design_0.new(v22.design)
    }, {
        Wrapper = v1.createElement(v12, {
            Title = l_state_0.title, 
            Subtitle = l_state_0.subtitle, 
            Status = l_state_0.status, 
            Enabled = l_state_0.enabled, 
            CancelButtonEnabled = l_state_0.cancelButtonEnabled, 
            Image = if v13 then l_state_0.imageRbxId else nil, 
            OnDialogShown = function() --[[ Line: 142 ]] --[[ Name: OnDialogShown ]]
                -- upvalues: v22 (copy)
                task.spawn(function() --[[ Line: 143 ]]
                    -- upvalues: v22 (ref)
                    v22.cancellableDialogManager:OnDialogShownAsync();
                end);
            end, 
            OnCancel = function() --[[ Line: 147 ]] --[[ Name: OnCancel ]]
                -- upvalues: v22 (copy)
                v22:setState({
                    cancelButtonEnabled = false, 
                    cancelRequested = true
                });
                task.spawn(function() --[[ Line: 152 ]]
                    -- upvalues: v22 (ref)
                    v22.cancellableDialogManager:CancelAsync();
                end);
            end
        }), 
        StyleLink = v1.createElement("StyleLink", {
            StyleSheet = v22.design
        })
    });
end;
return v14;