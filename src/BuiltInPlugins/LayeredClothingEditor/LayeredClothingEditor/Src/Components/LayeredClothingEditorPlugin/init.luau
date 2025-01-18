local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_LuaMeshEditingModule_0 = l_Parent_0.Packages.LuaMeshEditingModule;
local v6 = require(l_LuaMeshEditingModule_0.Tools.PointTool);
local l_ConfirmDialog_0 = v4.Components.ConfirmDialog;
local l_LuaMeshEditingModuleContext_0 = v4.Contexts.LuaMeshEditingModuleContext;
local l_EditingItemContext_0 = v4.Contexts.EditingItemContext;
local l_Signals_0 = v4.Contexts.Signals;
local l_RunService_0 = game:GetService("RunService");
local l_DockWidget_0 = v3.UI.DockWidget;
local l_ContextServices_0 = v3.ContextServices;
local v14 = require(l_Parent_0.Src.Components.ServiceWrapper);
local v15 = require(l_Parent_0.Src.Reducers.MainReducer);
local v16 = require(l_Parent_0.Src.Middleware.MainMiddleware);
local v17 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
local v18 = require(l_Parent_0.Src.Resources.PluginTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local v21 = require(l_Parent_0.Src.Components.LayeredClothingEditor);
local v22 = require(l_Parent_0.Src.Thunks.CloseEditor);
local _ = require(l_Parent_0.Src.Thunks.ReleaseEditor);
local v24 = require(l_Parent_0.Src.Util.makePluginActions);
local v25 = require(l_Parent_0.Src.Util.Constants);
local v26 = require(l_Parent_0.Src.Util.ShowDialog);
local v27 = require(l_Parent_0.Bin.ClothesHelper);
local v28 = require(l_Parent_0.Src.Thunks.FinishSelectingFromExplorer);
local v29 = v1.PureComponent:extend("LayeredClothingEditorPlugin");
local v30 = Vector2.new(380, 550);
local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
v29.showEditorInPlayModeError = function(v32) --[[ Line: 68 ]] --[[ Name: showEditorInPlayModeError ]]
    -- upvalues: v26 (copy), l_ConfirmDialog_0 (copy)
    v26(v32.plugin, v32.localization, l_ConfirmDialog_0, {
        Text = v32.localization:getText("EditorErrors", "OpenedWhileRunning")
    });
end;
v29.init = function(v33) --[[ Line: 74 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), v2 (copy), v15 (copy), v16 (copy), v18 (copy), v17 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v4 (copy), l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 (copy), v27 (copy), v22 (copy), l_RunService_0 (copy), v24 (copy), l_Signals_0 (copy), v25 (copy), l_EditingItemContext_0 (copy), v6 (copy), l_LuaMeshEditingModuleContext_0 (copy)
    local l_plugin_0 = v33.props.plugin;
    l_plugin_0.Name = "AccessoryFittingTool";
    v33.plugin = l_ContextServices_0.Plugin.new(l_plugin_0);
    v33.state = {
        enabled = false
    };
    v33.store = v2.Store.new(v15, {}, v16);
    v33.theme = v18.makePluginTheme();
    v33.analytics = l_ContextServices_0.Analytics.new(v17);
    v33.localization = l_ContextServices_0.Localization.new({
        pluginName = "AccessoryFittingTool", 
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        libraries = {
            [v4.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v4.Resources.SourceStrings, 
                translationResourceTable = v4.Resources.LocalizedStrings
            }
        }
    });
    local v35 = if l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then l_plugin_0:CreateToolbar("Avatar") else l_plugin_0:CreateToolbar(v33.localization:getText("Meta", "ToolbarName"));
    v33.toolbarButton = v35:CreateButton("LayeredClothingEditorButton", v33.localization:getText("Main", "Tooltip"), "rbxlocaltheme://AccessoryFittingTool", v33.localization:getText("Main", "ToolbarButton"));
    v27:init(v33.plugin, v35, v33.localization, v33.analytics);
    v33.onClose = function() --[[ Line: 113 ]]
        -- upvalues: v33 (copy), v22 (ref), l_plugin_0 (copy)
        v33:setState({
            enabled = false
        });
        v33.store:dispatch(v22(l_plugin_0, v33.analytics, v33.meshEditingContext));
    end;
    v33.onToggleWidget = function() --[[ Line: 120 ]]
        -- upvalues: l_RunService_0 (ref), v33 (copy), l_plugin_0 (copy), v22 (ref)
        if not l_RunService_0:IsEdit() then
            v33:showEditorInPlayModeError();
            return;
        else
            if not v33.state.enabled then
                l_plugin_0:Activate(true);
                v33.analytics:getHandler("PluginOpened")();
            end;
            v33:setState(function(v36) --[[ Line: 128 ]]
                return {
                    enabled = not v36.enabled
                };
            end);
            if not v33.state.enabled then
                v33.store:dispatch(v22(l_plugin_0, v33.analytics, v33.meshEditingContext));
            end;
            return;
        end;
    end;
    v33.pluginActions = l_ContextServices_0.PluginActions.new(l_plugin_0, v24(l_plugin_0, v33.localization));
    v33.signals = l_Signals_0.new(v25.SIGNAL_KEYS);
    v33.editingItemContext = l_EditingItemContext_0.new();
    local v37 = v6.new();
    v37:setFalloff(v25.DEFAULT_FALLOFF);
    v33.meshEditingContext = l_LuaMeshEditingModuleContext_0.new({
        [v25.TOOL_MODE.Point] = v37
    });
    v33.toolbarButton.Click:connect(v33.onToggleWidget);
    v33.onFocus = function() --[[ Line: 153 ]]
        -- upvalues: l_plugin_0 (copy), v33 (copy), v25 (ref)
        game:GetService("Selection"):Set({});
        if not l_plugin_0:IsActivatedWithExclusiveMouse() then
            l_plugin_0:Activate(true);
        end;
        task.delay(0, function() --[[ Line: 159 ]]
            -- upvalues: v33 (ref), v25 (ref)
            v33.toolbarButton:SetActive(true);
            v33.signals:get(v25.SIGNAL_KEYS.PluginWindowFocused):Fire();
        end);
    end;
    v33.onWidgetEnabledChanged = function(v38) --[[ Line: 165 ]]
        -- upvalues: l_RunService_0 (ref), v33 (copy)
        if v38.Enabled and not l_RunService_0:IsEdit() then
            v33:setState({
                enabled = false
            });
            v33:showEditorInPlayModeError();
            return;
        else
            v33:setState({
                enabled = v38.Enabled
            });
            return;
        end;
    end;
end;
v29.render = function(v39) --[[ Line: 181 ]] --[[ Name: render ]]
    -- upvalues: v28 (copy), v1 (copy), v14 (copy), l_DockWidget_0 (copy), v30 (copy), v21 (copy)
    v39.toolbarButton:SetActive(v39.state.enabled);
    if not v39.state.enabled then
        v39.store:dispatch(v28());
    end;
    return v1.createElement(v14, {
        plugin = v39.plugin, 
        analytics = v39.analytics, 
        localization = v39.localization, 
        theme = v39.theme, 
        store = v39.store, 
        pluginActions = v39.pluginActions, 
        mouse = v39.props.plugin:getMouse(), 
        signals = v39.signals, 
        editingItemContext = v39.editingItemContext, 
        meshEditingContext = v39.meshEditingContext
    }, {
        Widget = v1.createElement(l_DockWidget_0, {
            Id = "LayeredClothingEditor", 
            Title = v39.localization:getText("Main", "Title"), 
            Enabled = v39.state.enabled, 
            Size = v30, 
            InitialDockState = Enum.InitialDockState.Left, 
            MinSize = v30, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            ShouldRestore = true, 
            Plugin = v39.plugin, 
            OnClose = v39.onClose, 
            OnWidgetRestored = function() --[[ Line: 211 ]] --[[ Name: OnWidgetRestored ]]

            end, 
            OnWidgetFocused = v39.onFocus, 
            [v1.Change.Enabled] = v39.onWidgetEnabledChanged
        }, {
            LayeredClothingEditor = v39.state.enabled and v1.createElement(v21)
        })
    });
end;
return v29;