local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.LayoutOrderIterator);
local l_Util_0 = l_Parent_0.Util;
local v6 = require(l_Util_0.deepCopy);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v8 = require(l_Parent_0.UI.Components.ExpandablePane);
local v9 = require(l_Parent_0.UI.Components.Pane);
local v10 = require(l_Parent_0.UI.Components.ScrollingFrame);
local v11 = require(l_Parent_0.UI.Components.Separator);
local v12 = require(script.FormItem);
local v13 = v1.PureComponent:extend("Form");
v13.defaultProps = {
    UseScrollingFrame = true
};
v13.init = function(v14) --[[ Line: 51 ]] --[[ Name: init ]]
    v14.LabelWidths = {};
    v14.MaxLabelWidth = 0;
end;
v13.render = function(v15) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v12 (copy), v6 (copy), v4 (copy), v9 (copy), v8 (copy), l_join_0 (copy), v11 (copy), v10 (copy)
    local l_props_0 = v15.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v18 = {};
    for v19, v20 in l_props_0.Items do
        local v21 = {};
        for v22, v23 in v20.Children do
            local l_Disabled_0 = v23.Disabled;
            local l_Height_0 = v23.Height;
            local l_Hidden_0 = v23.Hidden;
            local l_MinWidth_0 = v23.MinWidth;
            local l_Value_0 = v23.Value;
            local l_Validate_0 = v23.Validate;
            v21[v23.Id] = if not (l_Value_0 ~= nil) or l_Hidden_0 then nil else v1.createElement(v12, {
                ItemChildren = v23.Children, 
                Disabled = l_Disabled_0, 
                FormWidth = v15.state.FormWidth, 
                Height = l_Height_0, 
                Layout = v23.Layout, 
                LayoutOrder = v22, 
                Label = v23.Label, 
                LabelHeight = l_props_0.LabelHeight, 
                LabelWidth = if not l_props_0.LabelWidth then UDim.new(0, v15.MaxLabelWidth) else l_props_0.LabelWidth, 
                Localization = l_props_0.Localization, 
                MinWidth = l_MinWidth_0, 
                OnLabelWidthChanged = function(v30, v31) --[[ Line: 86 ]] --[[ Name: OnLabelWidthChanged ]]
                    -- upvalues: v15 (copy)
                    if v30 then
                        table.remove(v15.LabelWidths, table.find(v15.LabelWidths, v30));
                    end;
                    if v31 then
                        table.insert(v15.LabelWidths, v31);
                    end;
                    local l_MaxLabelWidth_0 = v15.MaxLabelWidth;
                    if v31 and l_MaxLabelWidth_0 < v31 then
                        v15.MaxLabelWidth = v31;
                        v15:setState({
                            MaxLabelWidth = v15.MaxLabelWidth
                        });
                        return;
                    else
                        if v30 == l_MaxLabelWidth_0 and #v15.LabelWidths > 0 then
                            v15.MaxLabelWidth = math.max(unpack(v15.LabelWidths));
                            v15:setState({
                                MaxLabelWidth = v15.MaxLabelWidth
                            });
                        end;
                        return;
                    end;
                end, 
                OnChanged = function(v33) --[[ Line: 112 ]] --[[ Name: OnChanged ]]
                    -- upvalues: l_props_0 (copy), v19 (copy), v22 (copy), v6 (ref)
                    if v33 == l_props_0.Items[v19].Children[v22].Value then
                        return;
                    else
                        local v34 = v6(l_props_0.Items);
                        v34[v19].Children[v22].Value = v33;
                        l_props_0.OnChange(v34);
                        return;
                    end;
                end, 
                OnChildrenChanged = function(v35) --[[ Line: 122 ]] --[[ Name: OnChildrenChanged ]]
                    -- upvalues: v6 (ref), l_props_0 (copy), v19 (copy), v22 (copy)
                    local v36 = v6(l_props_0.Items);
                    v36[v19].Children[v22].Children = v35;
                    l_props_0.OnChange(v36);
                end, 
                OnValidate = l_Validate_0, 
                Renderers = l_props_0.Renderers, 
                Schema = v23.Schema, 
                Style = l_props_0.Stylizer, 
                Tooltip = v23.Tooltip, 
                Value = l_Value_0
            });
        end;
        local v37 = v20.Expandable == nil or v20.Expandable;
        local v38 = v20.Separator ~= nil and v20.Separator;
        local v39 = v4.new();
        local v40 = l_props_0.Expansion[v20.Id];
        if l_props_0.ExpandByDefault then
            v40 = v40 or v40 == nil;
        end;
        v18[v20.Id] = v1.createElement(v9, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v19, 
            Spacing = l_Stylizer_0.FormItem.Spacing, 
            Size = UDim2.fromScale(1, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            ExpandablePane = v1.createElement(v8, {
                AlwaysExpanded = not v37, 
                ContentPadding = 0, 
                Expanded = v40, 
                LayoutOrder = 1, 
                OnExpandedChanged = function() --[[ Line: 159 ]] --[[ Name: OnExpandedChanged ]]
                    -- upvalues: l_props_0 (copy), l_join_0 (ref), v20 (copy)
                    l_props_0.OnExpansionChange(l_join_0(l_props_0.Expansion, {
                        [v20.Id] = not l_props_0.Expansion[v20.Id]
                    }));
                end, 
                Style = "Section", 
                Text = v20.Label, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, v21), 
            Separator = if v38 then v1.createElement(v9, {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v39:getNextOrder(), 
                Size = UDim2.new(1, -l_Stylizer_0.FormItem.Spacing * 2, 0, 1)
            }, {
                v1.createElement(v11, {
                    DominantAxis = Enum.DominantAxis.Width
                })
            }) else nil
        });
    end;
    local v41 = {
        Anchorpoint = l_props_0.AnchorPoint, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Padding = {
            Bottom = l_Stylizer_0.FormItem.Spacing
        }, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size
    };
    if l_props_0.UseScrollingFrame then
        return v1.createElement(v10, v41, {
            Pane = v1.createElement(v9, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Size = UDim2.fromScale(1, 0), 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                [v1.Change.AbsoluteSize] = function(v42) --[[ Line: 199 ]]
                    -- upvalues: v15 (copy)
                    v15:setState({
                        FormWidth = v42.AbsoluteSize.X
                    });
                end
            }, v18)
        });
    else
        return v1.createElement(v9, l_join_0(v41, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            [v1.Change.AbsoluteSize] = function(v43) --[[ Line: 213 ]]
                -- upvalues: v15 (copy)
                v15:setState({
                    FormWidth = v43.AbsoluteSize.X
                });
            end
        }), v18);
    end;
end;
return (l_withContext_0({
    Localization = v2.Localization, 
    Stylizer = v2.Stylizer
})(v13));