local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DockWidget_0 = v1.UI.DockWidget;
local v7 = require(l_Parent_0.Src.Actions.SetToolEnabled);
local v8 = require(l_Parent_0.Src.Thunks.UpdateActiveInstanceHighlight);
local v9 = require(l_Parent_0.Src.Components.MainView);
local v10 = require(l_Parent_0.Src.Components.HoverPreviewEnabler);
local v11 = Vector2.new(300, 250);
local v12 = Vector2.new(175, 250);
local v13 = v2.PureComponent:extend("AlignmentToolPlugin");
v13.init = function(v14) --[[ Line: 30 ]] --[[ Name: init ]]
    v14._hasOpenedThisSession = false;
    v14.toggleState = function() --[[ Line: 33 ]]
        -- upvalues: v14 (copy)
        local v15 = not v14.props.toolEnabled;
        v14.setToolEnabled(v15, true);
    end;
    v14.onClose = function() --[[ Line: 39 ]]
        -- upvalues: v14 (copy)
        v14.setToolEnabled(false, true);
    end;
    v14.onRestore = function(v16) --[[ Line: 44 ]]
        -- upvalues: v14 (copy)
        v14.setToolEnabled(v16, false);
    end;
    v14.onDockWidgetCreated = function() --[[ Line: 49 ]]
        -- upvalues: v14 (copy)
        v14.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v14.toggleState);
    end;
    v14.onDockWidgetEnabledChanged = function(v17) --[[ Line: 53 ]]
        -- upvalues: v14 (copy)
        v14.setToolEnabled(v17.Enabled, true);
    end;
    v14.setToolEnabled = function(v18, v19) --[[ Line: 58 ]]
        -- upvalues: v14 (copy)
        local l_props_0 = v14.props;
        l_props_0.setToolEnabled(v18);
        if v18 then
            if v19 then
                l_props_0.Analytics:report("alignToolOpen");
            end;
            if not v14._hasOpenedThisSession then
                l_props_0.Analytics:report("alignToolImpression");
                v14._hasOpenedThisSession = true;
                return;
            end;
        elseif v19 then
            l_props_0.Analytics:report("alignToolClose");
        end;
    end;
end;
v13._renderDockWidgetContents = function(_, v22) --[[ Line: 79 ]] --[[ Name: _renderDockWidgetContents ]]
    -- upvalues: v2 (copy), v10 (copy), v9 (copy)
    if v22 then
        return v2.createElement(v10, {}, {
            MainView = v2.createElement(v9)
        });
    else
        return nil;
    end;
end;
v13.didUpdate = function(v23) --[[ Line: 89 ]] --[[ Name: didUpdate ]]
    v23.props.pluginLoaderContext.mainButton:SetActive(v23.props.toolEnabled);
end;
v13.render = function(v24) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_DockWidget_0 (copy), v11 (copy), v12 (copy)
    local l_props_1 = v24.props;
    local l_Localization_0 = l_props_1.Localization;
    local l_toolEnabled_0 = l_props_1.toolEnabled;
    return v2.createFragment({
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = "AlignmentTool", 
            Enabled = l_toolEnabled_0, 
            Widget = l_props_1.pluginLoaderContext.mainDockWidget, 
            Title = l_Localization_0:getText("Plugin", "WindowTitle"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = v11, 
            MinSize = v12, 
            OnClose = v24.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v24.onRestore, 
            OnWidgetCreated = v24.onDockWidgetCreated, 
            [v2.Change.Enabled] = v24.onDockWidgetEnabledChanged
        }, {
            DockWidgetContent = v24:_renderDockWidgetContents(l_toolEnabled_0)
        })
    });
end;
v13 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics
})(v13);
return v3.connect(function(v28, _) --[[ Line: 125 ]] --[[ Name: mapStateToProps ]]
    return {
        toolEnabled = v28.toolEnabled
    };
end, function(v30) --[[ Line: 131 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy), v8 (copy)
    return {
        setToolEnabled = function(v31) --[[ Line: 133 ]] --[[ Name: setToolEnabled ]]
            -- upvalues: v30 (copy), v7 (ref), v8 (ref)
            v30(v7(v31));
            v30(v8());
        end
    };
end)(v13);