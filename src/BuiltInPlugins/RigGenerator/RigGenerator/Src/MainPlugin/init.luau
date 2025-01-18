local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.ReactRoblox);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v12 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v18 = require(l_Components_0.RigSelector);
local v19 = require(l_Components_0.ExampleRoactRoduxComponent);
local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
local l_ImprovePluginSpeed_RigGenerator_0 = game:GetFastFlag("ImprovePluginSpeed_RigGenerator");
local l_CoreGui_0 = game:GetService("CoreGui");
local v23 = v1.PureComponent:extend("MainPlugin");
v23.init = function(v24, v25) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v13 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v12 (copy), l_ImprovePluginSpeed_RigGenerator_0 (copy)
    v24:setState({
        enabled = false
    });
    v24.toggleEnabled = function() --[[ Line: 61 ]]
        -- upvalues: v24 (copy)
        if v24.state.enabled then
            v24.analytics:report("menuClose");
            v24.analytics:report("menuCloseManual");
        else
            v24.analytics:report("menuOpen");
        end;
        v24:setState(function(v26) --[[ Line: 69 ]]
            return {
                enabled = not v26.enabled
            };
        end);
    end;
    v24.onClose = function() --[[ Line: 76 ]]
        -- upvalues: v24 (copy)
        v24.analytics:report("menuClose");
        v24:setState({
            enabled = false
        });
    end;
    v24.onWidgetEnabledChanged = function(v27) --[[ Line: 83 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            enabled = v27.Enabled
        });
    end;
    v24.store = v3.Store.new(v13, nil, {
        v3.thunkMiddleware
    }, nil);
    v24.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "RigGenerator"
    });
    v24.analytics = l_ContextServices_0.Analytics.new(v12);
    if l_ImprovePluginSpeed_RigGenerator_0 then
        v24:initToolbarAndButton(v25);
    end;
end;
v23.initToolbarAndButton = function(v28, v29) --[[ Line: 112 ]] --[[ Name: initToolbarAndButton ]]
    v28.toolbar = v29.PluginLoaderContext.toolbar;
    v28.mainButton = v29.PluginLoaderContext.mainButton;
    v28.mainButton:SetActive(v28.state.enabled);
    v29.PluginLoaderContext.mainButtonClickedSignal:Connect(v28.toggleEnabled);
end;
v23.renderButtons = function(v30, v31) --[[ Line: 121 ]] --[[ Name: renderButtons ]]
    -- upvalues: l_ImprovePluginSpeed_RigGenerator_0 (copy), v1 (copy), l_PluginButton_0 (copy)
    assert(not l_ImprovePluginSpeed_RigGenerator_0);
    local l_enabled_0 = v30.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v31, 
            Active = l_enabled_0, 
            Id = "Generate Rig", 
            Title = v30.localization:getText("Plugin", "Button"), 
            Tooltip = v30.localization:getText("Plugin", "Description"), 
            Icon = "rbxlocaltheme://BuildRig", 
            OnClick = v30.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v23.render = function(v33) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v14 (copy), l_ImprovePluginSpeed_RigGenerator_0 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 (copy), v2 (copy), v19 (copy), v18 (copy), l_CoreGui_0 (copy)
    local l_props_0 = v33.props;
    local l_state_0 = v33.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v33.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v14(), 
        v33.localization, 
        v33.analytics
    }, {
        Toolbar = if not l_ImprovePluginSpeed_RigGenerator_0 then v1.createElement(l_PluginToolbar_0, {
            Title = l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 and "Rig Generator" or v33.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v38) --[[ Line: 160 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v33 (copy)
                return v33:renderButtons(v38);
            end
        }) else nil, 
        MainWidget = v2.createPortal({
            RigGenerator = v1.createElement("ScreenGui", {
                Enabled = l_enabled_1, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                [v2.Change.Enabled] = v33.onWidgetEnabledChanged
            }, {
                ExampleRoactRoduxComponent = v1.createElement(v19), 
                RigSelector = v1.createElement(v18, {
                    MenuCompleted = function() --[[ Line: 175 ]] --[[ Name: MenuCompleted ]]
                        -- upvalues: v33 (copy)
                        v33:onClose();
                    end
                })
            })
        }, l_CoreGui_0)
    });
end;
if l_ImprovePluginSpeed_RigGenerator_0 then
    v23.didUpdate = function(v39) --[[ Line: 185 ]] --[[ Name: didUpdate ]]
        v39.mainButton:SetActive(v39.state.enabled);
    end;
end;
return v23;