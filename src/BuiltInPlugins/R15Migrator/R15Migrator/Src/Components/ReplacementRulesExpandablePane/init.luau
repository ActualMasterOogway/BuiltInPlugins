local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_SimpleExpandablePane_0 = v1.UI.SimpleExpandablePane;
local v4 = require(l_script_FirstAncestor_0.Src.Components.ReplaceOptionsPane);
local v5 = v2.PureComponent:extend("ReplacementRulesExpandablePane");
v5.render = function(v6) --[[ Line: 12 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_SimpleExpandablePane_0 (copy), v4 (copy)
    local l_props_0 = v6.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Size_0 = l_props_0.Size;
    return v2.createElement(l_SimpleExpandablePane_0, {
        Size = l_Size_0, 
        Style = "Section", 
        LayoutOrder = l_LayoutOrder_0, 
        Text = "Replacement Rules", 
        Expanded = true
    }, {
        ReplaceOptionsPane = v2.createElement(v4)
    });
end;
return v5;