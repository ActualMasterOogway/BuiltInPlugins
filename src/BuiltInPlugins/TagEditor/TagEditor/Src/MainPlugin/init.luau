local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v12 = require(l_Parent_0.Src.Reducers);
local v13 = require(l_Parent_0.Src.Resources.MakeTheme);
local v14 = require(l_Parent_0.Src.InitialStoreState);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v17 = require(script.Parent.TagManager);
local v18 = require(l_Parent_0.Src.Util.createAnalyticsHandlers);
local l_Components_0 = l_Parent_0.Src.Components;
local v20 = require(l_Components_0.MainGui);
local v21 = require(l_Components_0.WorldView);
local l_ImprovePluginSpeed_TagEditor_0 = game:GetFastFlag("ImprovePluginSpeed_TagEditor");
local v23 = v1.PureComponent:extend("MainPlugin");
v23.init = function(v24, _) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v12 (copy), v14 (copy), l_ImprovePluginSpeed_TagEditor_0 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v18 (copy), v17 (copy)
    v24.state = {
        enabled = false
    };
    v24.store = v2.Store.new(v12, v14, {
        v2.thunkMiddleware
    }, nil);
    v24.toggleEnabled = function() --[[ Line: 59 ]]
        -- upvalues: v24 (copy)
        v24:setState(function(v26) --[[ Line: 60 ]]
            -- upvalues: v24 (ref)
            local v27 = not v26.enabled;
            v24:setEnabled(v27, true);
        end);
    end;
    v24.onClose = function() --[[ Line: 67 ]]
        -- upvalues: v24 (copy)
        v24:setEnabled(false, true);
    end;
    v24.onRestore = function(v28) --[[ Line: 72 ]]
        -- upvalues: v24 (copy)
        v24:setEnabled(v28, false);
    end;
    v24.onDockWidgetCreated = function() --[[ Line: 77 ]]
        -- upvalues: l_ImprovePluginSpeed_TagEditor_0 (ref), v24 (copy)
        if l_ImprovePluginSpeed_TagEditor_0 then
            v24.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v24.toggleEnabled);
        end;
    end;
    v24.onWidgetEnabledChanged = function(v29) --[[ Line: 83 ]]
        -- upvalues: v24 (copy)
        v24:setEnabled(v29.Enabled, true);
    end;
    v24.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "TagEditor"
    });
    v24.analytics = l_ContextServices_0.Analytics.new(v18);
    v24.manager = v17.new(v24.store, v24.analytics);
end;
v23.sendWindowEnabledAnalytics = function(v30, v31) --[[ Line: 99 ]] --[[ Name: sendWindowEnabledAnalytics ]]
    if not v30.analytics then
        return;
    else
        v30.analytics:report("toggleWidget");
        v30.analytics:report(v31 and "openWidget" or "closeWidget");
        return;
    end;
end;
v23.setEnabled = function(v32, v33, v34) --[[ Line: 108 ]] --[[ Name: setEnabled ]]
    v32:setState(function(v35) --[[ Line: 109 ]]
        -- upvalues: v33 (copy), v32 (copy), v34 (copy)
        if v35.enabled == v33 then
            return nil;
        else
            v32.analytics:report("opened");
            if v34 then
                v32:sendWindowEnabledAnalytics(v33);
            end;
            v32.manager:SetEnabled(v33);
            return {
                enabled = v33
            };
        end;
    end);
end;
if not l_ImprovePluginSpeed_TagEditor_0 then
    v23.renderButtons = function(v36, v37) --[[ Line: 129 ]] --[[ Name: renderButtons ]]
        -- upvalues: v1 (copy), l_PluginButton_0 (copy)
        local l_enabled_0 = v36.state.enabled;
        return {
            ToggleEditor = v1.createElement(l_PluginButton_0, {
                Toolbar = v37, 
                Active = l_enabled_0, 
                Title = "TagEditor", 
                Tooltip = "", 
                Icon = "", 
                OnClick = v36.toggleEnabled, 
                ClickableWhenViewportHidden = true
            })
        };
    end;
end;
v23.render = function(v39) --[[ Line: 145 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v13 (copy), l_ImprovePluginSpeed_TagEditor_0 (copy), v1 (copy), l_PluginToolbar_0 (copy), l_DockWidget_0 (copy), v20 (copy), v21 (copy)
    local l_props_0 = v39.props;
    local l_state_0 = v39.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v39.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v13(), 
        v39.localization, 
        v39.analytics
    }, {
        Toolbar = if not l_ImprovePluginSpeed_TagEditor_0 then v1.createElement(l_PluginToolbar_0, {
            Title = "tagEditorToolbar", 
            RenderButtons = function(v44) --[[ Line: 164 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v39 (copy)
                return v39:renderButtons(v44);
            end
        }) else nil, 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "TagEditor", 
            Enabled = l_enabled_1, 
            Widget = if l_ImprovePluginSpeed_TagEditor_0 then l_props_0.pluginLoaderContext.mainDockWidget else nil, 
            Title = v39.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(300, 200), 
            MinSize = Vector2.new(200, 250), 
            OnClose = v39.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v39.onRestore, 
            OnWidgetCreated = if l_ImprovePluginSpeed_TagEditor_0 then v39.onDockWidgetCreated else nil, 
            [v1.Change.Enabled] = v39.onWidgetEnabledChanged
        }, {
            MainGui = v1.createElement(v20)
        }), 
        WorldView = v1.createElement(v21)
    });
end;
return v23;