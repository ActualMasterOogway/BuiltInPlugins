local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_formatLocalDateTime_0 = v3.Util.formatLocalDateTime;
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v8 = require(l_AssetConfiguration_0.VersionDivider);
local l_Util_0 = l_Parent_0.Core.Util;
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.Urls);
local v12 = require(l_Util_0.Images);
local v13 = v2.PureComponent:extend("VersionItem");
local v14 = {
    CURRENT = 1, 
    SELECTED = 2, 
    DEFAULT = 3
};
v13.init = function(v15, _) --[[ Line: 43 ]] --[[ Name: init ]]
    v15.state = {};
end;
v13.render = function(v17) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v11 (copy), v10 (copy), v2 (copy), l_formatLocalDateTime_0 (copy), v12 (copy), v8 (copy)
    local l_props_0 = v17.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local _ = l_Stylizer_0.versions;
    local v21 = l_props_0.ItemInfo or {};
    local l_IsCurrent_0 = l_props_0.IsCurrent;
    local l_SelectVersion_0 = l_props_0.SelectVersion;
    local v24 = nil;
    v24 = if l_IsCurrent_0 then v14.CURRENT else if l_SelectVersion_0 == v21.assetVersionNumber then v14.SELECTED else v14.DEFAULT;
    local _ = v11.constructAssetThumbnailUrl(v21.assetId, v10.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v10.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE);
    local l_versions_1 = l_Stylizer_0.versions;
    local l_createElement_0 = v2.createElement;
    local v28 = "Frame";
    local v29 = {
        Size = l_props_0.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder
    };
    local v30 = {
        Version = v2.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 120, 0, 25), 
            Size = UDim2.new(1, -67, 0, 20), 
            Text = "V" .. tostring(v21.assetVersionNumber), 
            TextColor3 = l_versions_1.textColor, 
            Font = v10.FONT_BOLD, 
            TextSize = v10.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }), 
        LastChange = v2.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.new(0, 120, 0, 35), 
            Size = UDim2.new(1, -67, 0, 20), 
            Text = l_formatLocalDateTime_0(v21.created, "L LTS", v17.props.Localization:getLocale()), 
            TextColor3 = l_versions_1.textColor, 
            Font = v10.FONT, 
            TextSize = v10.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        })
    };
    local v31 = false;
    if v24 ~= v14.CURRENT then
        v31 = v2.createElement("ImageButton", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -160, 0.5, 0), 
            Size = UDim2.new(0, 28, 0, 28), 
            Image = v12.MAKE_CURRENT_VERSION, 
            BackgroundTransparency = 1, 
            ImageColor3 = v24 == v14.DEFAULT and l_versions_1.buttonDefaultColor or l_versions_1.buttonSelectedColor, 
            [v2.Event.Activated] = function(_) --[[ Line: 139 ]]
                -- upvalues: l_props_0 (copy), v21 (copy)
                l_props_0.ItemClickCallBack(v21);
            end, 
            BorderSizePixel = 0
        });
    end;
    v30.SelectButton = v31;
    v30.Divider = v2.createElement(v8, {
        AnchorPoint = l_props_0.DividerAnchorPoint, 
        Position = l_props_0.DividerPosition, 
        Size = l_props_0.DividerSize, 
        BorderSizePixel = 0
    });
    return l_createElement_0(v28, v29, v30);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13));