local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_Button_0 = v3.UI.Button;
local v8 = v2.PureComponent:extend("AssetConfigFooter");
v8.render = function(v9) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy)
    local l_props_0 = v9.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_tryPublish_0 = l_props_0.tryPublish;
    local l_tryCancel_0 = l_props_0.tryCancel;
    local l_footer_0 = l_Stylizer_0.footer;
    local l_CanSave_0 = l_props_0.CanSave;
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_footer_0.backgroundColor, 
        BorderSizePixel = 1, 
        BorderColor3 = l_footer_0.borderColor, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 35), 
            PaddingRight = UDim.new(0, 35), 
            PaddingTop = UDim.new(0, 0)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 24)
        }), 
        CancelButton = v2.createElement(l_Button_0, {
            LayoutOrder = 2, 
            OnClick = l_tryCancel_0, 
            Size = UDim2.new(0, 120, 0, 35), 
            Style = "Round", 
            Text = l_Localization_0:getText("Action", "Cancel")
        }), 
        PublishButton = v2.createElement(l_Button_0, {
            LayoutOrder = 3, 
            OnClick = l_tryPublish_0, 
            Size = UDim2.new(0, 120, 0, 35), 
            Style = "RoundPrimary", 
            StyleModifier = if not l_CanSave_0 then l_StyleModifier_0.Disabled else nil, 
            Text = l_Localization_0:getText("Action", "Submit")
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v8));