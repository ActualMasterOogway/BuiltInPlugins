local v0 = nil;
pcall(function() --[[ Line: 13 ]]
    -- upvalues: v0 (ref)
    v0 = game:GetService("StudioWidgetsService");
end);
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local l_Focus_0 = v3.Focus;
local v6 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkAvoidSpawnInCreatePluginWidget);
local v7 = game:DefineFastFlag("DevFrameworkDialogResizes2", false);
local v8 = game:DefineFastFlag("DevFrameworkDialogResetOnClose", false);
return function(v9, v10) --[[ Line: 29 ]] --[[ Name: createPluginWidget ]]
    -- upvalues: v2 (copy), l_Focus_0 (copy), v8 (copy), v7 (copy), v0 (ref), v6 (copy), v3 (copy), l_withContext_0 (copy)
    local v11 = v2.PureComponent:extend(v9);
    v11.init = function(v12) --[[ Line: 31 ]] --[[ Name: init ]]
        v12.state = {};
    end;
    v11.createWidget = function(v13) --[[ Line: 35 ]] --[[ Name: createWidget ]]
        -- upvalues: v10 (copy), v2 (ref), l_Focus_0 (ref)
        if v13.widget or not v13.isMounted then
            return;
        else
            local l_props_0 = v13.props;
            local l_Title_0 = l_props_0.Title;
            local l_OnClose_0 = l_props_0.OnClose;
            local v17 = v10(l_props_0);
            if not v13.isMounted then
                v17:Destroy();
                return;
            else
                v17.Name = l_Title_0 or "";
                v17.ZIndexBehavior = l_props_0.ZIndexBehavior or Enum.ZIndexBehavior.Sibling;
                if v17:IsA("PluginGui") then
                    if type(l_OnClose_0) == "function" then
                        v17:BindToClose(l_OnClose_0);
                    end;
                    if v13.props.OnWidgetFocused then
                        v13.windowFocusedConnection = v17.WindowFocused:Connect(function() --[[ Line: 62 ]]
                            -- upvalues: v13 (copy)
                            v13.props.OnWidgetFocused(v13.widget);
                        end);
                    end;
                    if v13.props.OnWidgetFocusReleased then
                        v13.windowFocusReleasedConnection = v17.WindowFocusReleased:Connect(function() --[[ Line: 68 ]]
                            -- upvalues: v13 (copy)
                            v13.props.OnWidgetFocusReleased(v13.widget);
                        end);
                    end;
                    if v17:IsA("DockWidgetPluginGui") and v17.HostWidgetWasRestored and l_props_0.OnWidgetRestored then
                        l_props_0.OnWidgetRestored(v17.Enabled);
                    end;
                    if v17:IsA("DockWidgetPluginGui") and l_props_0.OnWidgetCreated then
                        l_props_0.OnWidgetCreated(v17.Enabled, v17.HostWidgetWasRestored);
                    end;
                end;
                v13.widgetEnabledChangedConnection = v17:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 86 ]]
                    -- upvalues: v13 (copy), v2 (ref)
                    local v18 = v13.props[v2.Change.Enabled];
                    if v18 and v13.widget and v13.widget.Enabled ~= v13.props.Enabled then
                        v18(v13.widget);
                    end;
                end);
                v13.focus = l_Focus_0.new(v17);
                v13.widget = v17;
                v13:setState({
                    _widgetReady = true
                });
                return;
            end;
        end;
    end;
    v11.updateWidget = function(v19, v20) --[[ Line: 102 ]] --[[ Name: updateWidget ]]
        -- upvalues: v8 (ref), v7 (ref), v0 (ref)
        local l_props_1 = v19.props;
        local l_Enabled_0 = l_props_1.Enabled;
        local l_OnClose_1 = l_props_1.OnClose;
        local l_Title_1 = l_props_1.Title;
        local l_widget_0 = v19.widget;
        if l_widget_0 then
            if l_Enabled_0 ~= nil then
                l_widget_0.Enabled = l_Enabled_0;
            end;
            if l_Title_1 ~= nil and l_widget_0:IsA("PluginGui") then
                l_widget_0.Title = l_Title_1;
            end;
            if v8 and type(l_OnClose_1) == "function" and l_OnClose_1 ~= v20.OnClose and l_widget_0:IsA("PluginGui") then
                l_widget_0:BindToClose(l_OnClose_1);
            end;
            if v7 and v0 ~= nil and l_props_1.Size ~= v20.Size then
                v0:GetWidgetFromPluginGui(l_widget_0):SetFixedSize(l_props_1.Size.X, l_props_1.Size.Y);
            end;
        end;
    end;
    v11.didMount = function(v26) --[[ Line: 132 ]] --[[ Name: didMount ]]
        -- upvalues: v6 (ref)
        v26.isMounted = true;
        if v26.props.CreateWidgetImmediately then
            v26:createWidget();
            return;
        elseif v6() then
            task.spawn(function() --[[ Line: 139 ]]
                -- upvalues: v26 (copy)
                v26:createWidget();
            end);
            return;
        else
            spawn(function() --[[ Line: 143 ]]
                -- upvalues: v26 (copy)
                v26:createWidget();
            end);
            return;
        end;
    end;
    v11.didUpdate = function(v27, v28) --[[ Line: 150 ]] --[[ Name: didUpdate ]]
        -- upvalues: v7 (ref)
        v27:updateWidget(if v7 then v28 else nil);
    end;
    v11.render = function(v29) --[[ Line: 154 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v2 (ref)
        if not v29.widget or not v29.focus then
            return nil;
        else
            return v3.provide({
                v29.focus
            }, {
                Child = v2.createElement(v2.Portal, {
                    target = v29.widget
                }, v29.props[v2.Children])
            });
        end;
    end;
    v11.willUnmount = function(v30) --[[ Line: 169 ]] --[[ Name: willUnmount ]]
        v30.isMounted = false;
        if v30.widgetEnabledChangedConnection then
            v30.widgetEnabledChangedConnection:Disconnect();
            v30.widgetEnabledChangedConnection = nil;
        end;
        if v30.windowFocusReleasedConnection then
            v30.windowFocusReleasedConnection:Disconnect();
            v30.windowFocusReleasedConnection = nil;
        end;
        if v30.windowFocusedConnection then
            v30.windowFocusedConnection:Disconnect();
            v30.windowFocusedConnection = nil;
        end;
        if v30.widget then
            v30.widget:Destroy();
            v30.widget = nil;
        end;
    end;
    return (l_withContext_0({
        Plugin = v3.Plugin
    })(v11));
end;