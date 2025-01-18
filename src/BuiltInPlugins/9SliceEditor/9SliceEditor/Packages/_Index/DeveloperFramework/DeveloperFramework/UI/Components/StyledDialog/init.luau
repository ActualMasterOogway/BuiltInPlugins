local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v1.withContext;
local v3 = require(l_Parent_0.Parent.Roact);
local v4 = require(l_Parent_0.Style.Padding);
local l_prioritize_0 = require(l_Parent_0.Util).prioritize;
local v6 = require(l_Parent_0.Util.Typecheck);
local v7 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v8 = require(l_Parent_0.UI.Components.Pane);
local v9 = require(l_Parent_0.UI.Components.Dialog);
local v10 = require(l_Parent_0.Styling.supportsStyleSheets);
local v11 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkStyledDialogButtonTooltip);
local v12 = v3.PureComponent:extend("StyledDialog");
v12.defaultProps = {
    Enabled = true
};
v12.init = function(v13) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v4 (copy), l_prioritize_0 (copy), v3 (copy), v7 (copy)
    v13.getComputedSizes = function(v14) --[[ Line: 56 ]]
        -- upvalues: v13 (copy), v11 (ref), v4 (ref)
        local l_Buttons_0 = v13.props.Buttons;
        local l_ButtonWidth_0 = v14.ButtonWidth;
        local l_ButtonHeight_0 = v14.ButtonHeight;
        local v18 = nil;
        if v11() and l_Buttons_0 and #l_Buttons_0 ~= 0 or not v11() and l_Buttons_0 and #l_Buttons_0 then
            local v19 = v4(v14.ButtonPadding);
            local l_ButtonSpacing_0 = v14.ButtonSpacing;
            local v21 = #l_Buttons_0 * l_ButtonWidth_0 + l_ButtonSpacing_0 * (#l_Buttons_0 - 1) + v19.Horizontal;
            local v22 = l_ButtonHeight_0 + v19.Vertical;
            v18 = Vector2.new(v21, v22);
        else
            v18 = Vector2.new(0, 0);
        end;
        local l_MinContentSize_0 = v13.props.MinContentSize;
        local v24 = v4(v14.ContentPadding);
        local v25 = math.max(l_MinContentSize_0.X + v24.Horizontal, v18.X);
        local v26 = l_MinContentSize_0.Y + v24.Vertical + v18.Y;
        return Vector2.new(v25, v26), v18;
    end;
    v13.getButtons = function(v27) --[[ Line: 84 ]]
        -- upvalues: v13 (copy), l_prioritize_0 (ref), v11 (ref), v3 (ref), v7 (ref)
        local l_Stylizer_0 = v13.props.Stylizer;
        local l_OnButtonPressed_0 = v13.props.OnButtonPressed;
        local l_Buttons_1 = v13.props.Buttons;
        local v31 = v27.Buttons or {};
        local l_ButtonWidth_1 = l_Stylizer_0.ButtonWidth;
        local l_ButtonHeight_1 = l_Stylizer_0.ButtonHeight;
        local v34 = {};
        for v35, v36 in ipairs(l_Buttons_1) do
            assert(v36.Key ~= nil, string.format("Dialog buttons must have keys. Missing at index : %d", v35));
            local v37 = v31[v35] or {};
            local l_Key_0 = v36.Key;
            local v39 = l_prioritize_0(v36.Style, v37.Style, "Round");
            local l_Text_0 = v36.Text;
            local l_StyleModifier_0 = v36.StyleModifier;
            local v42 = if v11() then v36.Tooltip else nil;
            v34[tostring(v35)] = v3.createElement(v7, {
                LayoutOrder = v35, 
                OnClick = function() --[[ Line: 108 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_OnButtonPressed_0 (copy), l_Key_0 (copy)
                    l_OnButtonPressed_0(l_Key_0);
                end, 
                Size = UDim2.fromOffset(l_ButtonWidth_1, l_ButtonHeight_1), 
                Style = v39, 
                StyleModifier = l_StyleModifier_0, 
                Text = l_Text_0, 
                Tooltip = v42
            });
        end;
        return v34;
    end;
end;
v12.render = function(v43) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v3 (copy), v9 (copy), v8 (copy), v10 (copy)
    local l_Stylizer_1 = v43.props.Stylizer;
    local l_Design_0 = v43.props.Design;
    local l_AutomaticSize_0 = v43.props.AutomaticSize;
    local v47 = l_prioritize_0(v43.props.BackgroundColor3, l_Stylizer_1.Background);
    local v48 = l_prioritize_0(v43.props.ButtonHorizontalAlignment, l_Stylizer_1.ButtonHorizontalAlignment);
    local l_Enabled_0 = v43.props.Enabled;
    local v50 = l_prioritize_0(v43.props.Modal, l_Stylizer_1.Modal);
    local v51 = l_prioritize_0(v43.props.Resizable, l_Stylizer_1.Resizable);
    local l_OnClose_0 = v43.props.OnClose;
    local l_Title_0 = v43.props.Title;
    local l_ZIndexBehavior_0 = v43.props.ZIndexBehavior;
    local v55, v56 = v43.getComputedSizes(l_Stylizer_1);
    return v3.createElement(v9, {
        Enabled = l_Enabled_0, 
        Modal = v50, 
        OnClose = l_OnClose_0, 
        Resizable = v51, 
        Size = v55, 
        MinSize = v55, 
        Title = l_Title_0, 
        ZIndexBehavior = l_ZIndexBehavior_0
    }, {
        SolidBackground = v3.createElement(v8, {
            BackgroundColor = v47, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = l_Stylizer_1.ContentPadding
        }, {
            Contents = v3.createElement(v8, {
                AutomaticSize = l_AutomaticSize_0, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 1, -v56.Y)
            }, v43.props[v3.Children]), 
            ButtonContainer = v3.createElement(v8, {
                HorizontalAlignment = v48, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 2, 
                Padding = l_Stylizer_1.ButtonPadding, 
                Size = UDim2.new(1, 0, 0, v56.Y), 
                Spacing = l_Stylizer_1.ButtonSpacing
            }, v43.getButtons(l_Stylizer_1))
        }), 
        StyleLink = if v10 then v3.createElement("StyleLink", {
            StyleSheet = l_Design_0:get()
        }) else nil
    });
end;
v12 = l_withContext_0({
    Stylizer = v1.Stylizer, 
    Design = if v10 then v1.Design else nil
})(v12);
v6.wrap(v12, script);
return v12;