local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("InfoBanner");
v7.render = function(v8) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy)
    local l_props_0 = v8.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_FONT_SIZE_LARGE_0 = v4.FONT_SIZE_LARGE;
    local v12 = l_FONT_SIZE_LARGE_0 + 2 * v4.INFO_BANNER_PADDING;
    local v13 = l_props_0.Position or UDim2.new(0, 0, 0, 0);
    local v14 = l_props_0.Size or UDim2.new(1, 0, 0, v12);
    local v15 = l_props_0.ZIndex or 0;
    local v16 = l_props_0.Visible ~= nil and l_props_0.Visible or l_props_0.Visible == nil;
    local v17 = l_props_0.Text or "";
    local l_infoBanner_0 = l_Stylizer_0.infoBanner;
    return v2.createElement("TextLabel", {
        Position = v13, 
        Size = v14, 
        BackgroundTransparency = 1, 
        ZIndex = v15, 
        Visible = v16, 
        Text = v17, 
        TextColor3 = l_infoBanner_0.textColor, 
        Font = v4.FONT, 
        TextSize = l_FONT_SIZE_LARGE_0, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextWrapped = true, 
        ClipsDescendants = true
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));