local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = game:DefineFastFlag("FixDebugRibbon", false);
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagRibbonDynamicBackground)();
local v4 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagDevFrameworkRibbonHooks)();
local v5 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioFloatingRibbon)();
local v6 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHandlers);
local v7 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Styling_0 = v7.Styling;
local l_makeTheme_0 = v7.Style.makeTheme;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_ContextServices_0 = v7.ContextServices;
local l_registerPluginStyles_0 = l_Styling_0.registerPluginStyles;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v18 = require(l_script_FirstAncestor_0.Src.Util.SettingsHelper);
local v19 = if v4 then l_ContextServices_0.Design else require(l_script_FirstAncestor_0.Src.Util.DesignContext);
local v20 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
local v21 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_append_0 = v21.append;
local l_map_0 = v21.map;
local l_join_0 = v21.join;
local v25 = require(l_script_FirstAncestor_0.Src.Components.MainView);
local v26 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioEnableInteractionTelemetry);
local v27 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioRibbonDeferInteractionTelemetry);
local v28 = v1.PureComponent:extend("MainPlugin");
v28.init = function(v29, v30) --[[ Line: 66 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v5 (copy), v26 (copy), l_join_0 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v6 (copy), l_registerPluginStyles_0 (copy), v27 (copy), v20 (copy), l_makeTheme_0 (copy), l_script_FirstAncestor_0 (copy), l_Mouse_0 (copy), v3 (copy), l_map_0 (copy), v18 (copy)
    local l_Plugin_1 = v30.Plugin;
    local v32 = nil;
    v32 = if v2 then v30.EditMode else false;
    v29.state = {
        expanded = v32, 
        currentTab = "Home", 
        customTools = {}, 
        scale = "Large", 
        showRibbon = not v5 or nil, 
        showFloating = not v5 and nil, 
        showLabels = true
    };
    v29.pluginUri = v30.Plugin:GetUri();
    v29.Tools = v30.Plugin:GetPluginComponent("Tools");
    v29.Panels = v30.Plugin:GetPluginComponent("Panels");
    v29.Widgets = v30.Plugin:GetPluginComponent("Widgets");
    v29.InteractionTelemetry = if v26() then v30.Plugin:GetPluginComponent("InteractionTelemetry") else nil;
    if v5 then
        v29.panelUri = l_join_0(v29.pluginUri, {
            Category = "Panels", 
            ItemId = "Ribbon"
        });
        v29.floatingUri = l_join_0(v29.pluginUri, {
            Category = "Panels", 
            ItemId = "Floating"
        });
        v29.widgetUri = l_join_0(v29.pluginUri, {
            Category = "Widgets", 
            ItemId = "Ribbon"
        });
        v29.Panels:SetSizeAsync(v29.panelUri, Vector2.new(0, v32 and 129 or 44));
    else
        v29.widgetUri = l_join_0(l_Plugin_1:GetUri(), {
            Category = "Widget", 
            ItemId = "Ribbon"
        });
        v29.Panels:SetSizeAsync(v29.widgetUri, Vector2.new(0, v32 and 129 or 44));
    end;
    v29.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Ribbon"
    });
    v29.analytics = l_ContextServices_0.Analytics.new(v6);
    v29.design = l_registerPluginStyles_0(v30.Plugin);
    if v5 then
        v29.floatingDesign = l_registerPluginStyles_0(v30.Plugin);
    end;
    v29.onSelectTab = function(v33, v34, v35) --[[ Line: 130 ]]
        -- upvalues: v29 (copy), v5 (ref), v26 (ref), v27 (ref), v20 (ref)
        if v29.state.currentTab ~= v33 then
            v29:setState({
                currentTab = v33, 
                showRibbon = not v5 or nil
            });
            if v26() then
                if v27() then
                    task.defer(function() --[[ Line: 138 ]]
                        -- upvalues: v29 (ref), v20 (ref), v34 (copy)
                        v29.InteractionTelemetry:ReportInteractionAsync({
                            functionType = "Navigation", 
                            sourceType = "Widget", 
                            sourceData = v20.toString(v34)
                        });
                    end);
                    return;
                else
                    v29.InteractionTelemetry:ReportInteractionAsync({
                        functionType = "Navigation", 
                        sourceType = "Widget", 
                        sourceData = v20.toString(v34)
                    });
                    return;
                end;
            end;
        elseif v35 then
            if v5 then
                v29.onToggleFloating();
                return;
            else
                v29.onToggleRibbon();
            end;
        end;
    end;
    v29.theme = l_makeTheme_0(l_script_FirstAncestor_0.Src.Components)();
    v29.mouse = l_Mouse_0.new(v30.Plugin:GetMouse());
    v29.mouse:__pushCursor("Arrow", 0);
    v29.expand = function() --[[ Line: 167 ]]
        -- upvalues: v29 (copy), v3 (ref)
        v29:setState({
            expanded = true
        });
        if v3 then
            v29.design:FindFirstChild(".Role-Surface100"):SetProperties({
                BackgroundColor3 = "$DEPRECATED_MainBackground", 
                BorderSizePixel = "$BorderNone"
            });
        end;
    end;
    v29.compact = function() --[[ Line: 180 ]]
        -- upvalues: v29 (copy), v3 (ref), v5 (ref), v30 (copy)
        v29:setState({
            expanded = false
        });
        if v3 then
            v29.design:FindFirstChild(".Role-Surface100"):SetProperties({
                BackgroundColor3 = "$SemanticColorSurface100", 
                BorderSizePixel = "$BorderNone"
            });
        end;
        if v5 then
            v30.Floating.Enabled = false;
        end;
    end;
    v29.onToolChanged = function(v36) --[[ Line: 198 ]]
        -- upvalues: v29 (copy), l_map_0 (ref), v20 (ref)
        v29:setState(function(v37) --[[ Line: 199 ]]
            -- upvalues: l_map_0 (ref), v20 (ref), v36 (copy)
            return {
                customTools = l_map_0(v37.customTools, function(v38) --[[ Line: 201 ]]
                    -- upvalues: v20 (ref), v36 (ref)
                    if v20.toString(v36.Uri) == v20.toString(v38.Uri) then
                        return v36;
                    else
                        return v38;
                    end;
                end)
            };
        end);
    end;
    if v5 then
        v29.width = 0;
    end;
    v29.onResize = function(v39) --[[ Line: 214 ]]
        -- upvalues: v29 (copy), v5 (ref)
        local l_X_0 = v39.AbsoluteSize.X;
        if l_X_0 > 1380 then
            v29:setState({
                scale = "Large"
            });
        elseif l_X_0 > 1160 then
            v29:setState({
                scale = "Medium"
            });
        else
            v29:setState({
                scale = "Small"
            });
        end;
        if v5 then
            v29.width = l_X_0 - 5;
            v29.Panels:SetSizeAsync(v29.floatingUri, Vector2.new(v29.width, 88));
        end;
    end;
    v29.onToggleLabels = function() --[[ Line: 236 ]]
        -- upvalues: v29 (copy)
        v29:setState(function(v41) --[[ Line: 237 ]]
            return {
                showLabels = not v41.showLabels
            };
        end);
    end;
    if v5 then
        v29.onToggleFloating = function() --[[ Line: 244 ]]
            -- upvalues: v29 (copy), v30 (copy)
            local v42 = not v29.state.showFloating;
            if v42 then
                v29.Panels:FocusAsync(v29.floatingUri);
                v29.Panels:SetSizeAsync(v29.floatingUri, Vector2.new(v29.width, 88));
            else
                v30.Floating.Enabled = false;
            end;
            v29:setState({
                showFloating = v42
            });
        end;
    else
        v29.onToggleRibbon = function() --[[ Line: 258 ]]
            -- upvalues: v29 (copy)
            v29:setState(function(v43) --[[ Line: 259 ]]
                return {
                    showRibbon = not v43.showRibbon
                };
            end);
        end;
    end;
    local l_l_Plugin_1_PluginComponent_0 = l_Plugin_1:GetPluginComponent("Actions");
    l_l_Plugin_1_PluginComponent_0:CreateAsync({
        Uri = l_join_0(v29.pluginUri, {
            Category = "Actions", 
            ItemId = "ShowHideLabels"
        }), 
        Enabled = true, 
        Exists = true, 
        Visible = true, 
        Text = v29.localization:getText("Plugin", "ShowHideLabels")
    }, true)[1]:Connect(v29.onToggleLabels);
    l_l_Plugin_1_PluginComponent_0:CreateAsync({
        Uri = l_join_0(v29.pluginUri, {
            Category = "Actions", 
            ItemId = v5 and "DockUndockRibbon" or "ShowHideRibbon"
        }), 
        Enabled = true, 
        Exists = true, 
        Visible = true, 
        Text = v29.localization:getText("Plugin", v5 and "DockUndockRibbon" or "ShowHideRibbon")
    }, true)[1]:Connect(if v5 then v29.onToggleFloating else v29.onToggleRibbon);
    if v5 then
        v29.toggleTask = nil;
        v29.onOpen = function() --[[ Line: 297 ]]
            -- upvalues: v29 (copy)
            if v29.state.showFloating and v29.state.expanded then
                if v29.toggleTask then
                    task.cancel(v29.toggleTask);
                end;
                v29.toggleTask = task.delay(0.3, function() --[[ Line: 302 ]]
                    -- upvalues: v29 (ref)
                    v29.Panels:FocusAsync(v29.floatingUri);
                end);
            end;
        end;
        v29.onClose = function(v45) --[[ Line: 307 ]]
            -- upvalues: v29 (copy), v30 (copy)
            if v29.toggleTask then
                task.cancel(v29.toggleTask);
            end;
            if not v45 and v30.Floating.Enabled then
                return;
            else
                v29.toggleTask = task.delay(0.3, function() --[[ Line: 319 ]]
                    -- upvalues: v30 (ref)
                    v30.Floating.Enabled = false;
                end);
                return;
            end;
        end;
    end;
    v18.createSettings(l_Plugin_1, v29.localization);
end;
v28.didMount = function(v46) --[[ Line: 329 ]] --[[ Name: didMount ]]
    -- upvalues: l_append_0 (copy), v5 (copy)
    local l_PluginComponent_0 = v46.props.Plugin:GetPluginComponent("PlaceManager");
    l_PluginComponent_0.PlaceDocPanelShown:Connect(v46.expand);
    l_PluginComponent_0.PlaceDocPanelClosed:Connect(v46.compact);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 339 ]]
        -- upvalues: l_PluginComponent_0 (copy)
        return l_PluginComponent_0:IsPlaceDocumentOpen();
    end);
    if l_status_0 and l_result_0 then
        v46.expand();
    end;
    v46.Tools.Added:Connect(function(v50) --[[ Line: 346 ]]
        -- upvalues: v46 (copy), l_append_0 (ref)
        v46.Tools:BindAsync(v50.Uri):Connect(v46.onToolChanged);
        local l_Async_0 = v46.Tools:GetAsync({
            v50.Uri
        });
        v46:setState(function(v52) --[[ Line: 350 ]]
            -- upvalues: l_append_0 (ref), l_Async_0 (copy)
            return {
                customTools = l_append_0({}, v52.customTools, l_Async_0)
            };
        end);
    end);
    v46.Widgets:RegisterAsync({
        {
            Uri = v46.pluginUri, 
            Widget = v46.props.Widget, 
            DEPRECATED_PluginGui = v46.props.Widget
        }
    });
    if v5 then
        v46.Panels:SetAttachmentAsync(v46.floatingUri, {
            TargetWidgetUri = v46.widgetUri, 
            TargetAnchorPoint = Vector2.new(0, 1), 
            SubjectAnchorPoint = Vector2.new(0, 0), 
            Offset = Vector2.new(0, 0)
        });
    end;
    task.defer(function() --[[ Line: 374 ]]
        -- upvalues: v46 (copy)
        local v53 = v46.Tools:ListAsync();
        for _, v55 in v53 do
            v46.Tools:BindAsync(v55):Connect(v46.onToolChanged);
        end;
        local l_Async_1 = v46.Tools:GetAsync(v53);
        v46:setState({
            customTools = l_Async_1
        });
    end);
end;
v28.didUpdate = function(v57, _, v59) --[[ Line: 389 ]] --[[ Name: didUpdate ]]
    -- upvalues: v5 (copy)
    if v5 then
        if v57.state.showFloating ~= v59.showFloating or v57.state.showLabels ~= v59.showLabels or v57.state.expanded ~= v59.expanded then
            if not v57.state.showFloating and v57.state.expanded then
                if v57.state.showLabels then
                    v57.Panels:SetSizeAsync(v57.panelUri, Vector2.new(0, 129));
                    v57.Panels:SetSizeAsync(v57.floatingUri, Vector2.new(v57.width + 1, 88));
                    return;
                else
                    v57.Panels:SetSizeAsync(v57.panelUri, Vector2.new(0, 116));
                    v57.Panels:SetSizeAsync(v57.floatingUri, Vector2.new(v57.width + 1, 75));
                    return;
                end;
            else
                v57.Panels:SetSizeAsync(v57.panelUri, Vector2.new(0, 44));
                return;
            end;
        end;
    elseif v57.state.showRibbon ~= v59.showRibbon or v57.state.showLabels ~= v59.showLabels or v57.state.expanded ~= v59.expanded then
        if v57.state.showRibbon and v57.state.expanded then
            if v57.state.showLabels then
                v57.Panels:SetSizeAsync(v57.widgetUri, Vector2.new(0, 129));
                return;
            else
                v57.Panels:SetSizeAsync(v57.widgetUri, Vector2.new(0, 116));
                return;
            end;
        else
            v57.Panels:SetSizeAsync(v57.widgetUri, Vector2.new(0, 44));
        end;
    end;
end;
v28.render = function(v60) --[[ Line: 431 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Focus_0 (copy), v19 (copy), v1 (copy), v25 (copy), v5 (copy)
    local l_props_0 = v60.props;
    local l_state_0 = v60.state;
    local l_Plugin_2 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_2), 
        v60.mouse, 
        l_Focus_0.new(l_props_0.Widget), 
        v19.new(v60.design), 
        v60.theme, 
        v60.localization, 
        v60.analytics
    }, {
        Surface = v1.createElement(v25, {
            ActiveTab = l_state_0.currentTab, 
            CustomTools = l_state_0.customTools, 
            Design = v60.design, 
            Expanded = l_state_0.expanded, 
            Floating = if v5 then l_props_0.Floating else nil, 
            FloatingDesign = if v5 then v60.floatingDesign else nil, 
            OnResize = v60.onResize, 
            OnSelectTab = v60.onSelectTab, 
            OnToggleFloating = if v5 then v60.onToggleFloating else nil, 
            OnToggleLabels = v60.onToggleLabels, 
            OnToggleRibbon = if v5 then nil else v60.onToggleRibbon, 
            OnOpen = v60.onOpen, 
            OnClose = v60.onClose, 
            ShowLabels = l_state_0.showLabels, 
            ShowRibbon = if v5 then nil else l_state_0.showRibbon, 
            ShowFloating = if v5 then l_state_0.showFloating else nil, 
            Plugin = l_Plugin_2, 
            PluginUri = v60.pluginUri, 
            Scale = l_state_0.scale
        })
    });
end;
return v28;