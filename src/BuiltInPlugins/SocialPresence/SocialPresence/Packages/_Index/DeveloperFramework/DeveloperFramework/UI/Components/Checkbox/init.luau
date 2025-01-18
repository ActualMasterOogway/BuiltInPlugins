local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local l_getFFlagDevFrameworkCheckboxGoodAlignment_0 = l_Parent_0.SharedFlags.getFFlagDevFrameworkCheckboxGoodAlignment;
local v5 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v6 = require(l_Parent_0.Styling.supportsStyleSheets);
local v7 = require(l_Parent_0.Styling.joinTags);
local v8 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v9 = require(l_Parent_0.UI.Components.IconButton);
local v10 = require(l_Parent_0.UI.Components.Pane);
local v11 = require(l_Parent_0.UI.Components.TextLabel);
local v12 = require(l_Parent_0.Util);
local v13 = require(l_Parent_0.Util.StyleModifier);
local l_Symbol_0 = v12.Symbol;
local v15 = require(l_Parent_0.Util.Typecheck);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v17 = v1.PureComponent:extend("Checkbox");
v15.wrap(v17, script);
v17.Indeterminate = l_Symbol_0.named("Indeterminate");
v17.defaultProps = {
    Checked = false, 
    Disabled = false, 
    Key = "", 
    OnClick = function() --[[ Line: 53 ]] --[[ Name: OnClick ]]

    end
};
v17.init = function(v18) --[[ Line: 56 ]] --[[ Name: init ]]
    v18.onClick = function() --[[ Line: 57 ]]
        -- upvalues: v18 (copy)
        local l_Disabled_0 = v18.props.Disabled;
        local l_OnClick_0 = v18.props.OnClick;
        if not l_Disabled_0 and l_OnClick_0 then
            l_OnClick_0(v18.props.Key);
        end;
    end;
end;
v17.render = function(v21) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v13 (copy), v17 (ref), v7 (copy), v5 (copy), v1 (copy), v9 (copy), v8 (copy), l_join_0 (copy), v11 (copy), l_getFFlagDevFrameworkCheckboxGoodAlignment_0 (copy), v10 (copy)
    local l_props_0 = v21.props;
    local l_Checked_0 = l_props_0.Checked;
    local l_Disabled_1 = l_props_0.Disabled;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v26 = l_props_0.Text or "";
    local l_TextWrapped_0 = l_props_0.TextWrapped;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v29 = nil;
    local v30 = nil;
    if l_Disabled_1 then
        if not v6 then
            v29 = v13.Disabled;
        end;
        v30 = "Disabled";
    elseif l_Checked_0 == v17.Indeterminate then
        if not v6 then
            v29 = v13.Indeterminate;
        end;
        v30 = "Indeterminate";
    elseif l_Checked_0 then
        if not v6 then
            v29 = v13.Selected;
        end;
        v30 = "Checked";
    end;
    local v31 = if v6 then v7("Component-Checkbox", v30, l_props_0[v5.Tag] or "X-Fit X-Left X-Middle X-RowS IconOnly Compact") else nil;
    local v32 = if v6 then {
        LeftIcon = {}, 
        OnClick = v21.onClick, 
        [v5.Tag] = v31
    } else {
        OnClick = v21.onClick, 
        Size = l_Stylizer_0.ImageSize, 
        Style = l_Stylizer_0, 
        StyleModifier = v29
    };
    if v26 == "" then
        return v1.createElement(if v6 then v9 else v8, l_join_0(v32, {
            LayoutOrder = l_LayoutOrder_0
        }), l_props_0[v1.Children]);
    else
        local v33 = {
            Button = v1.createElement(if v6 then v9 else v8, l_join_0(v32, {
                LayoutOrder = 1
            })), 
            Label = v1.createElement(v11, if v6 then {
                LayoutOrder = 2, 
                Text = v26, 
                TextWrapped = l_TextWrapped_0, 
                [v5.Tag] = v7("X-Fit", v30, l_getFFlagDevFrameworkCheckboxGoodAlignment_0 and "Top Left" or nil)
            } else {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2, 
                StyleModifier = v29, 
                Text = v26, 
                TextWrapped = l_TextWrapped_0, 
                TextXAlignment = if l_getFFlagDevFrameworkCheckboxGoodAlignment_0 then Enum.TextXAlignment.Left else nil, 
                TextYAlignment = if l_getFFlagDevFrameworkCheckboxGoodAlignment_0 then Enum.TextYAlignment.Top else nil
            }, {
                UIPadding = if l_getFFlagDevFrameworkCheckboxGoodAlignment_0 then v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, -2)
                }) else nil
            })
        };
        local v34 = if v6 then {
            Position = l_props_0.Position, 
            [v5.Tag] = v31
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            OnClick = v21.onClick, 
            Position = l_props_0.Position, 
            Spacing = l_Stylizer_0.Spacing, 
            VerticalAlignment = if l_getFFlagDevFrameworkCheckboxGoodAlignment_0 then Enum.VerticalAlignment.Top else nil
        };
        if l_props_0[v1.Children] then
            v33 = l_join_0({
                Wrapper = v1.createElement(v10, v34, v33)
            }, l_props_0[v1.Children]);
            return v1.createElement(v10, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = l_LayoutOrder_0
            }, v33);
        else
            return v1.createElement(v10, l_join_0(v34, {
                LayoutOrder = l_LayoutOrder_0
            }), v33);
        end;
    end;
end;
if not v6 then
    v17 = l_withContext_0({
        Stylizer = v2.Stylizer
    })(v17);
end;
return v17;