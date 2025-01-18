local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.createAnalyticsHandlers);
local v2 = require(l_script_FirstAncestor_0.Src.Resources.Localization.createLocalization);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useSizeCalculator);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useVisualizationModeCombiner);
local v8 = require(l_script_FirstAncestor_0.Src.Components.Actions.VisualizationModeActions);
local v9 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModesMainView);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioVisualizationModesUI);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioRestorePopupFocus);
local l_UI_0 = v3.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_Pane_0 = l_UI_0.Pane;
local l_Popup_0 = l_UI_0.Popup;
local l_ContextServices_0 = v3.ContextServices;
local l_StudioTheme_0 = v3.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v3.Styling.registerPluginStyles;
local function v30(v20) --[[ Line: 38 ]] --[[ Name: VisualizationModesPopup ]]
    -- upvalues: l_ContextServices_0 (copy), v4 (copy), v6 (copy), l_registerPluginStyles_0 (copy), l_script_FirstAncestor_0 (copy), v11 (copy), l_Popup_0 (copy), l_Pane_0 (copy), v9 (copy)
    local v21 = l_ContextServices_0.Localization:use();
    local v22 = l_ContextServices_0.Analytics:use();
    local v23 = l_ContextServices_0.Plugin:use():get();
    local v24 = v4.useRef(true);
    local v25 = v6({
        Width = 325, 
        HeaderHeight = 32, 
        MaxHeight = 700, 
        InnerPadding = 5, 
        Padding = Vector2.new(10, 10)
    });
    local v28 = v4.useState(function() --[[ Line: 52 ]]
        -- upvalues: l_registerPluginStyles_0 (ref), v23 (copy), l_script_FirstAncestor_0 (ref)
        local v26, v27 = l_registerPluginStyles_0(v23, l_script_FirstAncestor_0);
        return {
            design = v26, 
            conn = v27
        };
    end, {
        v23
    });
    v4.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v28 (copy)
        if v28.conn == nil then
            return nil;
        else
            return function() --[[ Line: 65 ]]
                -- upvalues: v28 (ref)
                v28.conn:Disconnect();
            end;
        end;
    end, {
        v28.conn
    });
    local v29 = v4.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v20 (copy)
        v20.ToggleState.disable();
    end);
    v4.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v20 (copy), v22 (copy)
        if v20.ToggleState.enabled then
            v22:report("openPlugin");
        end;
    end, {
        v22, 
        v20.ToggleState.enabled
    });
    if not v20.PluginButton then
        return nil;
    elseif not v20.ToggleState.enabled and v24.current then
        return nil;
    else
        if v11() then
            v24.current = false;
        end;
        return v4.createElement(l_Popup_0, {
            CreateWidgetImmediately = false, 
            Enabled = v20.ToggleState.enabled, 
            Modal = false, 
            Title = v21:getText("Plugin", "Name"), 
            Size = v25.size, 
            OnClose = v29, 
            PopupTarget = v20.PluginButton, 
            PopupSelfAnchorPoint = Vector2.new(1, 0), 
            PopupTargetAnchorPoint = Vector2.new(1, 1)
        }, {
            Wrapper = v4.createElement(l_Pane_0, {
                [v4.Tag] = "X-Fill X-Column X-Top VisualizationModes-Popup"
            }, {
                VisualizationModesMainView = v4.createElement(v9, {
                    VisualizationModeCategories = v20.CombinerState.state.categories, 
                    RecentVisualizationModes = v20.CombinerState.state.recentModes, 
                    SizeCalculator = v25, 
                    OnVisualizationModeToggle = v20.CombinerState.onVisualizationModeToggle, 
                    OnVisualizationModeCategoryToggle = v20.CombinerState.onVisualizationModeCategoryToggle
                })
            }), 
            VisualizationModesStrokePane = v4.createElement("Frame", {
                [v4.Tag] = "VisualizationModesStrokePane"
            }), 
            StyleLink = v4.createElement("StyleLink", {
                StyleSheet = v28.design
            })
        });
    end;
end;
local function v37() --[[ Line: 125 ]] --[[ Name: MainPluginState ]]
    -- upvalues: v5 (copy), v4 (copy), l_ContextServices_0 (copy), v7 (copy), v10 (copy), v8 (copy), l_PluginToolbar_0 (copy), l_PluginButton_0 (copy), v30 (copy)
    local v31 = v5.useToggleState();
    local v32 = v4.useRef(nil);
    local v33 = l_ContextServices_0.Localization:use();
    local v34 = l_ContextServices_0.Plugin:use():get();
    local v35 = v7();
    if not v10() then
        return nil;
    else
        return v4.createElement(v4.Fragment, {}, {
            Actions = v4.createElement(v8, {
                VisualizationModeCategories = v35.state.categories, 
                OnVisualizationModeToggle = v35.onVisualizationModeToggle
            }), 
            Toolbar = v4.createElement(l_PluginToolbar_0, {
                Title = "visualizationModesToolbar", 
                Plugin = v34, 
                RenderButtons = function(v36) --[[ Line: 145 ]] --[[ Name: RenderButtons ]]
                    -- upvalues: v4 (ref), l_PluginButton_0 (ref), v31 (copy), v33 (copy), v32 (copy)
                    return {
                        Toggle = v4.createElement(l_PluginButton_0, {
                            Toolbar = v36, 
                            Active = v31.enabled, 
                            Id = "visualizationModesButton", 
                            Title = v33:getText("Plugin", "Button"), 
                            Tooltip = v33:getText("Plugin", "Tooltip"), 
                            Icon = "rbxlocaltheme://VisualizationModes", 
                            OnClick = v31.toggle, 
                            ClickableWhenViewportHidden = false, 
                            ref = v32
                        })
                    };
                end
            }), 
            Popup = v4.createElement(v30, {
                ToggleState = v31, 
                CombinerState = v35, 
                PluginButton = v32.current and v32.current.button
            })
        });
    end;
end;
return function(v38) --[[ Line: 169 ]] --[[ Name: VisualizationModesPlugin ]]
    -- upvalues: v4 (copy), v2 (copy), l_ContextServices_0 (copy), v1 (copy), l_StudioTheme_0 (copy), v37 (copy)
    local v39 = v4.useState(function() --[[ Line: 170 ]]
        -- upvalues: v2 (ref)
        return v2();
    end);
    local v40 = v4.useState(function() --[[ Line: 174 ]]
        -- upvalues: l_ContextServices_0 (ref), v1 (ref)
        return l_ContextServices_0.Analytics.new(v1);
    end);
    local v41 = v4.useState(function() --[[ Line: 178 ]]
        -- upvalues: l_StudioTheme_0 (ref)
        return l_StudioTheme_0.new();
    end);
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(v38.Plugin), 
        l_ContextServices_0.Mouse.new(v38.Plugin:GetMouse()), 
        v41, 
        v39, 
        v40
    }, {
        Main = v4.createElement(v37)
    });
end;