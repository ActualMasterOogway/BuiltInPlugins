local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_join_0 = v4.join;
local l_keys_0 = v4.keys;
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_SimpleExpandablePane_0 = l_UI_0.SimpleExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v13 = require(l_script_FirstAncestor_0.Src.Components.ScriptIssueTreeView);
local v14 = require(l_script_FirstAncestor_0.Src.Components.ScriptConversionPaneHeader);
local v15 = require(l_script_FirstAncestor_0.Src.Components.ScriptConversionPaneFooter);
local v16 = v2.PureComponent:extend("ScriptConversionExpandablePane");
v16.init = function(v17) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: l_keys_0 (copy), v2 (copy), l_Pane_0 (copy), l_join_0 (copy), l_TextLabel_0 (copy)
    v17.customHeader = function(v18) --[[ Line: 27 ]]
        -- upvalues: v17 (copy), l_keys_0 (ref), v2 (ref), l_Pane_0 (ref), l_join_0 (ref), l_TextLabel_0 (ref)
        local l_props_0 = v17.props;
        local l_Localization_0 = l_props_0.Localization;
        local l_initialIssueCounts_0 = l_props_0.initialIssueCounts;
        local v22 = #l_keys_0(l_initialIssueCounts_0);
        local v23 = 0;
        for _, v25 in l_initialIssueCounts_0 do
            v23 = v23 + v25;
        end;
        return v2.createElement(l_Pane_0, l_join_0({
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Horizontal
        }, v18), {
            MessageText = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_Localization_0:getText("ScriptConversion", "HeaderMessage", {
                    scriptCount = string.format("%d", v22), 
                    issueCount = string.format("%d", v23)
                })
            })
        });
    end;
end;
v16.render = function(v26) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_SimpleExpandablePane_0 (copy), l_Pane_0 (copy), v14 (copy), v13 (copy), v15 (copy)
    local l_props_1 = v26.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_HeaderSize_0 = l_props_1.HeaderSize;
    local l_ContentSize_0 = l_props_1.ContentSize;
    local v32 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_SimpleExpandablePane_0, {
        HeaderComponent = v26.customHeader, 
        Size = l_HeaderSize_0, 
        Style = "Section", 
        LayoutOrder = l_LayoutOrder_0, 
        Text = "Scripts", 
        Expanded = true, 
        ContentPadding = 0, 
        ContentSpacing = 0
    }, {
        Container = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Size = l_ContentSize_0
        }, {
            ScriptConversionPaneHeader = v2.createElement(v14, {
                LayoutOrder = v32:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.HeaderHeight)
            }), 
            ScriptIssueTreeView = v2.createElement(v13, {
                LayoutOrder = v32:getNextOrder(), 
                Size = UDim2.new(1, 0, 1, -l_Stylizer_0.HeaderHeight - l_Stylizer_0.FooterHeight), 
                OnResetPlugin = l_props_1.OnResetPlugin
            }), 
            ScriptConversionPaneFooter = v2.createElement(v15, {
                LayoutOrder = v32:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.FooterHeight)
            })
        })
    });
end;
v16 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v16);
return v3.connect(function(v33, _) --[[ Line: 106 ]] --[[ Name: mapStateToProps ]]
    return {
        initialIssueCounts = v33.ScriptConversion.initialIssueCounts
    };
end)(v16);