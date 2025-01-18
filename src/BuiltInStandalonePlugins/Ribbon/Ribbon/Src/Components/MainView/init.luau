local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
local v6 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_copy_0 = v6.copy;
local l_join_0 = v6.join;
local v9 = game:DefineFastFlag("DebugRemoveRibbonTabs", false);
local l_AddTestModesJson_0 = game:GetFastFlag("AddTestModesJson");
local v11 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioFloatingRibbon)();
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v13 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v13.Util.counter;
local l_Localization_0 = v13.ContextServices.Localization;
local v16 = require(l_script_FirstAncestor_0.Src.Components.ControlsView);
local v17 = require(l_script_FirstAncestor_0.Src.Components.RibbonTabs);
local v18 = require(l_script_FirstAncestor_0.Src.Util.addCustomControls);
local v19 = require(l_script_FirstAncestor_0.Src.Util.RibbonCustomizationHelper);
local v20 = require(l_script_FirstAncestor_0.Src.Util.TestingModesHelper);
local v21 = require(l_script_FirstAncestor_0.Src.Hooks.useMenu);
local v22 = require(l_script_FirstAncestor_0.Src.Hooks.useWidgets);
local v23 = require(l_script_FirstAncestor_0.Src.Hooks.useCurrentTestMode);
local function v29(v24, v25, v26, v27) --[[ Line: 61 ]] --[[ Name: createActiveTabControlsFromRibbonDef ]]
    -- upvalues: l_copy_0 (copy), v18 (copy)
    local v28 = nil;
    if v25.TabControls[v26] then
        v28 = l_copy_0(v25.TabControls[v26]);
    elseif v25.CustomControls and v25.CustomControls[v26] then
        v28 = l_copy_0(v25.CustomControls[v26]);
    else
        warn((("Tab \"%*\" is not known!"):format(v26)));
        return {};
    end;
    v18(v24, v26, v28, v27);
    return v28;
end;
return function(v30) --[[ Line: 80 ]] --[[ Name: MainView ]]
    -- upvalues: l_counter_0 (copy), v21 (copy), v16 (copy), v22 (copy), l_useRef_0 (copy), l_join_0 (copy), l_useState_0 (copy), l_Localization_0 (copy), v19 (copy), l_AddTestModesJson_0 (copy), v23 (copy), l_useEffect_0 (copy), v11 (copy), v1 (copy), v29 (copy), v2 (copy), v20 (copy), v9 (copy), v17 (copy)
    local v31 = l_counter_0();
    local v32 = v21(v16);
    local l_Expanded_0 = v30.Expanded;
    local l_PluginUri_0 = v30.PluginUri;
    local v35 = v22();
    local v36 = l_useRef_0(nil);
    local v37 = l_join_0(v30.PluginUri, {
        Category = "Widgets", 
        ItemId = "Mezzanine"
    });
    local v38 = nil;
    local l_RibbonDefinitionAsync_0 = v30.Plugin:GetPluginComponent("RibbonConfiguration"):GetRibbonDefinitionAsync();
    local v40, v41 = l_useState_0(l_RibbonDefinitionAsync_0);
    local v42 = l_Localization_0:use();
    local function v44() --[[ Line: 97 ]]
        -- upvalues: v19 (ref), v30 (copy), v41 (copy)
        local v43 = v19.getLatestRibbonControlsAsync(v30.Plugin);
        v41(v43);
    end;
    local function v47() --[[ Line: 101 ]]
        -- upvalues: v30 (copy)
        local l_HttpService_0 = game:GetService("HttpService");
        local v46 = v30.Plugin:GetPluginComponent("Actions"):ListAsync();
        print(l_HttpService_0:JSONEncode(v46));
    end;
    task.defer(function() --[[ Line: 107 ]]
        -- upvalues: v19 (ref), v30 (copy), v42 (copy), v44 (copy), v47 (copy)
        v19.createCustomizationActionsAsync(v30.Plugin, v42, v44, v47);
    end);
    if l_AddTestModesJson_0 then
        v38 = v23(v30.Plugin);
    end;
    l_useEffect_0(function() --[[ Line: 120 ]]
        -- upvalues: v36 (copy), v35 (copy), v37 (copy)
        if v36.current then
            v35:register(v37, v36.current);
        end;
        return function() --[[ Line: 124 ]]
            -- upvalues: v35 (ref), v37 (ref)
            v35:deregister(v37);
        end;
    end, {});
    local function v51(_, v49) --[[ Line: 129 ]] --[[ Name: onInputBegan ]]
        -- upvalues: v30 (copy), l_join_0 (ref), v11 (ref), v32 (copy), v37 (copy)
        if v49.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return;
        elseif not v30.Expanded then
            return;
        else
            local v50 = {
                Type = "Column", 
                Children = {
                    {
                        Id = "ShowHideLabels", 
                        Type = "Option", 
                        Action = l_join_0(v30.PluginUri, {
                            Category = "Actions", 
                            ItemId = "ShowHideLabels"
                        })
                    }, 
                    {
                        Id = v11 and "DockUndockRibbon" or "ShowHideRibbon", 
                        Type = "Option", 
                        Action = l_join_0(v30.PluginUri, {
                            Category = "Actions", 
                            ItemId = v11 and "DockUndockRibbon" or "ShowHideRibbon"
                        })
                    }, 
                    {
                        Type = "Separator"
                    }, 
                    {
                        Id = "ReloadTabs", 
                        Type = "Option", 
                        Action = l_join_0(v30.PluginUri, {
                            Category = "Actions", 
                            ItemId = "ReloadTabs"
                        })
                    }, 
                    {
                        Id = "PrintActions", 
                        Type = "Option", 
                        Action = l_join_0(v30.PluginUri, {
                            Category = "Actions", 
                            ItemId = "PrintActions"
                        })
                    }
                }
            };
            v32({
                v50
            }, v37, {
                SubjectAnchorPoint = Vector2.new(0, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(v49.Position.X, v49.Position.Y)
            });
            return;
        end;
    end;
    local function v53() --[[ Line: 184 ]] --[[ Name: renderButtons ]]
        -- upvalues: v1 (ref), v16 (ref), l_join_0 (ref), v30 (copy), v31 (copy), v29 (ref), l_PluginUri_0 (copy), v40 (copy), v11 (ref), v2 (ref)
        local v52 = v1.createElement(v16, {
            WidgetUri = l_join_0(v30.PluginUri, {
                Category = "Widgets", 
                ItemId = ("Tabs/%*"):format(v30.ActiveTab)
            }), 
            LayoutOrder = v31(), 
            Plugin = v30.Plugin, 
            Controls = v29(l_PluginUri_0, v40, v30.ActiveTab, v30.CustomTools), 
            ShowMore = true, 
            HideLabels = not v30.ShowLabels, 
            [v1.Tag] = "X-PadRibbon X-Middle X-RowSpace100 X-FitX"
        });
        if v11 and v30.ShowFloating then
            return v2.createPortal(v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                [v1.Event.MouseLeave] = function() --[[ Line: 211 ]]
                    -- upvalues: v30 (ref)
                    v30.OnClose(true);
                end
            }, {
                Buttons = v52, 
                StyleLink = v1.createElement("StyleLink", {
                    StyleSheet = v30.Design
                })
            }), v30.Floating);
        else
            return v52;
        end;
    end;
    return v1.createElement("Frame", {
        [v1.Change.AbsoluteSize] = v30.OnResize, 
        [v1.Tag] = "Role-Surface100 X-Fill X-Column", 
        [v1.Event.InputBegan] = v51, 
        [v1.Event.MouseEnter] = if v11 then v30.OnOpen else nil, 
        [v1.Event.MouseLeave] = v11 and function() --[[ Line: 234 ]]
            -- upvalues: v30 (copy)
            v30.OnClose(false);
        end or nil
    }, {
        Mezzanine = v1.createElement("Frame", {
            LayoutOrder = v31(), 
            Size = UDim2.new(1, 0, 0, 44), 
            [v1.Tag] = "Role-Surface", 
            ref = v36
        }, {
            Left = if l_Expanded_0 then v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                [v1.Tag] = "Role-Surface X-Fit X-Row"
            }, {
                LeftMezzanineControls = v1.createElement(v16, {
                    WidgetUri = l_join_0(v30.PluginUri, {
                        Category = "Widgets", 
                        ItemId = "LeftMezzanine"
                    }), 
                    Plugin = v30.Plugin, 
                    Controls = if l_AddTestModesJson_0 then v20.getMezzanineFromTestModeSetting(v40, v38) else v40.MezzanineControls.LeftMezzanine, 
                    [v1.Tag] = "X-MezzPaddingLeft X-Middle X-RowSpace100 X-Fit"
                })
            }) else nil, 
            Tabs = if not l_Expanded_0 or v9 then nil else v1.createElement(v17, {
                WidgetUri = l_join_0(v30.PluginUri, {
                    Category = "Widgets", 
                    ItemId = "Tabs"
                }), 
                OnSelectTab = v30.OnSelectTab, 
                ActiveTab = v30.ActiveTab, 
                Scale = v30.Scale, 
                Plugin = v30.Plugin
            }), 
            Right = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                [v1.Tag] = "Role-Surface X-Fit X-Row"
            }, {
                RightMezzanineControls = v1.createElement(v16, {
                    WidgetUri = l_join_0(v30.PluginUri, {
                        Category = "Widgets", 
                        ItemId = "RightMezzanine"
                    }), 
                    Plugin = v30.Plugin, 
                    Controls = if l_Expanded_0 then v40.MezzanineControls.RightMezzanine else v40.MezzanineControls.RightMezzanineStartPage, 
                    [v1.Tag] = "X-MezzPaddingLeft X-MezzPaddingRight X-Middle X-Right X-RowSpace100 X-Fit"
                })
            })
        }), 
        Divider = if l_Expanded_0 then v1.createElement("Frame", {
            LayoutOrder = v31(), 
            [v1.Tag] = "Role-Surface Role-DividerH"
        }, {
            Divider = v1.createElement("Frame")
        }) else nil, 
        Buttons = if l_Expanded_0 then v53() else nil, 
        StyleLink = v1.createElement("StyleLink", {
            StyleSheet = v30.Design
        })
    });
end;