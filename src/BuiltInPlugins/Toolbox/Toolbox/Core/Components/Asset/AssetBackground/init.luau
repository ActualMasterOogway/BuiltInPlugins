local l_Packages_0 = script.Parent.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local v2 = require(l_Packages_0.Cryo);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = v1.Component:extend("AssetBackground1");
v5.render = function(v6) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_props_0 = v6.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_icon_0 = l_Stylizer_0.asset.icon;
    local v10 = Color3.fromRGB(255, 255, 255);
    local v11 = 0;
    v10 = l_Stylizer_0.asset.background.color;
    v11 = l_Stylizer_0.asset.background.borderSize;
    l_props_0 = v2.Dictionary.join(l_props_0, {
        BackgroundColor3 = v10, 
        Image = "", 
        BorderColor3 = l_icon_0.borderColor, 
        BorderSizePixel = v11, 
        ScaleType = Enum.ScaleType.Tile, 
        TileSize = UDim2.new(0.125, 0, 0.125, 0), 
        backgroundIndex = v2.None, 
        Stylizer = v2.None
    });
    return v1.createElement("ImageLabel", l_props_0);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));