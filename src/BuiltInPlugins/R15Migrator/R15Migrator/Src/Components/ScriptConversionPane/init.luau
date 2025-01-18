local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v9 = require(l_script_FirstAncestor_0.Src.Components.ProgressBar);
local v10 = require(l_script_FirstAncestor_0.Src.Components.ReplacementRulesExpandablePane);
local v11 = require(l_script_FirstAncestor_0.Src.Components.ScriptConversionExpandablePane);
local v12 = require(l_script_FirstAncestor_0.Src.Util.findAllInServices);
local v13 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateScriptAnalytics);
local v15 = v2.PureComponent:extend("ScriptConversionPane");
v15.init = function(v16) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v16.state = {
        paneSize = Vector2.new(0, 0), 
        replaceRulesPaneSize = Vector2.new(0, 0)
    };
    v16.ref = v2.createRef();
end;
v15.initConnections = function(v17) --[[ Line: 32 ]] --[[ Name: initConnections ]]
    local v18 = v17.ref:getValue();
    if not v18 then
        return;
    else
        local l_ReplacementRulesExpandablePane_0 = v18.ReplacementRulesExpandablePane;
        v17.onPaneSizeChanged = v18:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 40 ]]
            -- upvalues: v17 (copy), v18 (copy)
            v17:setState({
                paneSize = v18.AbsoluteSize
            });
        end);
        v17.replaceRulesPaneSizeChanged = l_ReplacementRulesExpandablePane_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 48 ]]
            -- upvalues: v17 (copy), l_ReplacementRulesExpandablePane_0 (copy)
            v17:setState({
                replaceRulesPaneSize = l_ReplacementRulesExpandablePane_0.AbsoluteSize
            });
        end);
        return;
    end;
end;
v15.didMount = function(v20) --[[ Line: 55 ]] --[[ Name: didMount ]]
    -- upvalues: v13 (copy), v12 (copy)
    local l_props_0 = v20.props;
    local l_diagnostics_0 = l_props_0.diagnostics;
    local l_Analytics_0 = l_props_0.Analytics;
    local v25 = v12(function(v24) --[[ Line: 60 ]] --[[ Name: isScript ]]
        -- upvalues: v13 (ref)
        if not v24:IsA("LuaSourceContainer") then
            return false;
        elseif v24:GetAttribute(v13.AttributeUnificationScriptName) then
            return false;
        else
            return true;
        end;
    end);
    l_props_0.updateScriptAnalytics(v25, l_diagnostics_0, l_Analytics_0);
    v20:initConnections();
end;
v15.didUpdate = function(v26) --[[ Line: 76 ]] --[[ Name: didUpdate ]]
    if v26.ref.current and not v26.onPaneSizeChanged and not v26.replaceRulesPaneSizeChanged then
        v26:initConnections();
    end;
end;
v15.getScriptExpandablePaneSize = function(v27) --[[ Line: 82 ]] --[[ Name: getScriptExpandablePaneSize ]]
    local l_props_1 = v27.props;
    local l_state_0 = v27.state;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v31 = l_state_0.paneSize.Y - l_state_0.replaceRulesPaneSize.Y - l_Stylizer_0.ExpandablePaneHeaderSize.Y.Offset;
    return UDim2.fromOffset(l_state_0.paneSize.X, v31);
end;
v15.hasScripts = function(v32) --[[ Line: 93 ]] --[[ Name: hasScripts ]]
    local v33 = true;
    if next(v32.props.diagnostics) == nil then
        v33 = next(v32.props.completedScripts) ~= nil;
    end;
    return v33;
end;
v15.render = function(v34) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v10 (copy), v11 (copy), v9 (copy)
    local l_props_2 = v34.props;
    local l_progressBarMessageKey_0 = l_props_2.progressBarMessageKey;
    local l_replaceProgress_0 = l_props_2.replaceProgress;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local l_Localization_0 = l_props_2.Localization;
    local v40 = l_LayoutOrderIterator_0.new();
    if not v34:hasScripts() then
        return v2.createElement(l_Pane_0, {}, {
            Label = v2.createElement(l_TextLabel_0, {
                Text = l_Localization_0:getText("ScriptConversion", "NoScripts")
            })
        });
    else
        return v2.createElement(l_Pane_0, {
            BackgroundColor3 = l_Stylizer_1.BackgroundColor, 
            BorderSizePixel = 0, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            ForwardRef = v34.ref
        }, {
            ReplacementRulesExpandablePane = v2.createElement(v10, {
                LayoutOrder = v40:getNextOrder(), 
                HeaderSize = l_Stylizer_1.ExpandablePaneHeaderSize
            }), 
            ScriptConversionExpandablePane = v2.createElement(v11, {
                LayoutOrder = v40:getNextOrder(), 
                HeaderSize = l_Stylizer_1.ExpandablePaneHeaderSize, 
                ContentSize = v34:getScriptExpandablePaneSize(), 
                OnResetPlugin = l_props_2.OnResetPlugin
            }), 
            ReplaceProgressBar = if l_replaceProgress_0 then v2.createElement(v9, {
                Text = l_Localization_0:getText("ProgressBar", l_progressBarMessageKey_0), 
                Progress = l_replaceProgress_0
            }) else nil
        });
    end;
end;
v15.willUnmount = function(v41) --[[ Line: 142 ]] --[[ Name: willUnmount ]]
    if v41.onPaneSizeChanged then
        v41.onPaneSizeChanged:Disconnect();
        v41.onPaneSizeChanged = nil;
    end;
    if v41.replaceRulesPaneSizeChanged then
        v41.replaceRulesPaneSizeChanged:Disconnect();
        v41.replaceRulesPaneSizeChanged = nil;
    end;
end;
v15 = l_ContextServices_0.withContext({
    Analytics = l_ContextServices_0.Analytics, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v15);
return v3.connect(function(v42, _) --[[ Line: 160 ]] --[[ Name: mapStateToProps ]]
    return {
        diagnostics = v42.ScriptConversion.diagnostics, 
        completedScripts = v42.ScriptConversion.completedScripts, 
        replaceProgress = v42.ScriptConversion.replaceProgress, 
        progressBarMessageKey = v42.ScriptConversion.messageKey
    };
end, function(v44) --[[ Line: 169 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy)
    return {
        updateScriptAnalytics = function(v45, v46, v47) --[[ Line: 171 ]] --[[ Name: updateScriptAnalytics ]]
            -- upvalues: v44 (copy), v14 (ref)
            v44(v14(v45, v46, v47));
        end
    };
end)(v15);