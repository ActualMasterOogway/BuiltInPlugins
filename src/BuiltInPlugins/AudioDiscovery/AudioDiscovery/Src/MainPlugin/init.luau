local l_AudioDiscoveryLoader_0 = game:GetFastFlag("AudioDiscoveryLoader");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Src.Actions.UpdateRows);
local l_ThunkWithArgsMiddleware_0 = v4.Util.ThunkWithArgsMiddleware;
local l_UI_0 = v4.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v15 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_makeTheme_0 = v4.Style.makeTheme;
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v20 = require(l_Components_0.Window);
local v21 = require(l_Parent_0.Src.Actions.SetDialog);
local v22 = require(l_Parent_0.Src.Actions.Unpause);
local v23 = require(l_Parent_0.Src.Thunks.DiscoverAudio);
local v24 = require(l_Parent_0.Src.Util.Analytics);
local v25 = v2.PureComponent:extend("MainPlugin");
v25.init = function(v26, v27) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v23 (copy), l_ThunkWithArgsMiddleware_0 (copy), v3 (copy), v15 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v26.state = {
        enabled = false
    };
    v26.toggleEnabled = function() --[[ Line: 51 ]]
        -- upvalues: v26 (copy), v22 (ref), v23 (ref)
        local v28 = not v26.state.enabled;
        v26.setEnabled(v28);
        if v28 then
            v26.store:dispatch(v22());
            v26.store:dispatch(v23());
        end;
    end;
    v26.onClose = function() --[[ Line: 60 ]]
        -- upvalues: v26 (copy)
        v26.setEnabled(false);
    end;
    v26.onRestore = function(v29) --[[ Line: 64 ]]
        -- upvalues: v26 (copy)
        v26.setEnabled(v29);
    end;
    v26.onWidgetEnabledChanged = function(v30) --[[ Line: 68 ]]
        -- upvalues: v26 (copy)
        v26.setEnabled(v30.Enabled);
    end;
    v26.setEnabled = function(v31) --[[ Line: 72 ]]
        -- upvalues: v26 (copy)
        v26:setState({
            enabled = v31
        });
    end;
    v26.onDockWidgetCreated = function() --[[ Line: 78 ]]
        -- upvalues: v26 (copy)
        v26.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v26.toggleEnabled);
    end;
    local v32 = {
        l_ThunkWithArgsMiddleware_0({
            SoundAssetChecker = v27.SoundAssetChecker
        })
    };
    v26.store = v3.Store.new(v15, nil, v32, nil);
    v26.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AudioDiscovery"
    });
    v26.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 95 ]]
        return {};
    end, {});
end;
v25.didUpdate = function(v33) --[[ Line: 100 ]] --[[ Name: didUpdate ]]
    -- upvalues: v21 (copy)
    if v33.state.enabled and game.CreatorId == 0 then
        v33.store:dispatch(v21(true));
    end;
    if v33.props.pluginLoaderContext then
        v33.props.pluginLoaderContext.mainButton:SetActive(v33.state.enabled);
    end;
end;
v25.didMount = function(v34) --[[ Line: 111 ]] --[[ Name: didMount ]]
    -- upvalues: v24 (copy), v5 (copy)
    v24:reportOpen();
    v34.connection = v34.props.SoundAssetChecker.soundsFound:Connect(function(v35) --[[ Line: 113 ]]
        -- upvalues: v34 (copy), v5 (ref)
        v34.store:dispatch(v5(v35));
    end);
end;
v25.willUnmount = function(v36) --[[ Line: 118 ]] --[[ Name: willUnmount ]]
    v36.connection:Disconnect();
end;
v25.renderButtons = function(v37, v38) --[[ Line: 122 ]] --[[ Name: renderButtons ]]
    -- upvalues: v2 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v37.state.enabled;
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Id = "ViewSounds", 
            Toolbar = v38, 
            Active = l_enabled_0, 
            Title = v37.localization:getText("Plugin", "Button"), 
            Tooltip = v37.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/AudioDiscovery/icon.png", 
            OnClick = v37.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v25.render = function(v40) --[[ Line: 138 ]] --[[ Name: render ]]
    -- upvalues: l_makeTheme_0 (copy), l_Parent_0 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), l_AudioDiscoveryLoader_0 (copy), v2 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v20 (copy)
    local l_props_0 = v40.props;
    local l_state_0 = v40.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    local v45 = l_makeTheme_0(l_Parent_0.Src.Components);
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v40.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v45(), 
        v40.localization, 
        v40.analytics
    }, {
        Toolbar = if l_AudioDiscoveryLoader_0 then nil else v2.createElement(l_PluginToolbar_0, {
            Title = v40.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v46) --[[ Line: 157 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v40 (copy)
                return v40:renderButtons(v46);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = "AudioDiscovery", 
            Widget = if l_AudioDiscoveryLoader_0 then l_props_0.pluginLoaderContext.mainDockWidget else nil, 
            OnWidgetCreated = if l_AudioDiscoveryLoader_0 then v40.onDockWidgetCreated else nil, 
            Enabled = l_enabled_1, 
            Title = v40.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v40.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v40.onRestore, 
            [v2.Change.Enabled] = v40.onWidgetEnabledChanged
        }, {
            Window = v2.createElement(v20)
        })
    });
end;
return v25;