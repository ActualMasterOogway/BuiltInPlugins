local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dash);
local v5 = require(l_script_FirstAncestor_0.Components.Tile);
local v6 = require(l_script_FirstAncestor_0.Enums.MediaType);
local v7 = require(l_script_FirstAncestor_0.Enums.Radius);
local v8 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v9 = require(l_script_FirstAncestor_0.Enums.Theme);
local v10 = require(l_script_FirstAncestor_0.Components.Badge);
local v11 = require(l_script_FirstAncestor_0.Enums.BadgeVariant);
local v12 = require(l_script_FirstAncestor_0.Enums.BadgeSize);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v14 = UDim2.fromOffset(150, 230);
return {
    summary = "Badge", 
    stories = v4.map(v11, function(v15) --[[ Line: 25 ]]
        -- upvalues: v13 (copy), v3 (copy), l_MarketplaceService_0 (copy), v5 (copy), v8 (copy), v14 (copy), v6 (copy), v7 (copy), v9 (copy), v10 (copy)
        return {
            name = v15, 
            story = function(v16) --[[ Line: 28 ]] --[[ Name: story ]]
                -- upvalues: v13 (ref), v3 (ref), l_MarketplaceService_0 (ref), v5 (ref), v8 (ref), v14 (ref), v6 (ref), v7 (ref), v9 (ref), v10 (ref), v15 (copy)
                local v17 = v13();
                local v18, v19 = v3.useState({});
                v3.useEffect(function() --[[ Line: 32 ]]
                    -- upvalues: v19 (copy), l_MarketplaceService_0 (ref)
                    v19({});
                    spawn(function() --[[ Line: 34 ]]
                        -- upvalues: l_MarketplaceService_0 (ref), v19 (ref)
                        wait(2);
                        local l_l_MarketplaceService_0_ProductInfo_0 = l_MarketplaceService_0:GetProductInfo(21070012);
                        if l_l_MarketplaceService_0_ProductInfo_0.IsPublicDomain then
                            l_l_MarketplaceService_0_ProductInfo_0.PriceInRobux = 0;
                            l_l_MarketplaceService_0_ProductInfo_0.PriceText = "Free";
                        else
                            assert(l_l_MarketplaceService_0_ProductInfo_0.PriceInRobux ~= nil, "Item price will not be nil");
                            l_l_MarketplaceService_0_ProductInfo_0.PriceText = "\238\128\130" .. tostring(l_l_MarketplaceService_0_ProductInfo_0.PriceInRobux);
                        end;
                        v19(l_l_MarketplaceService_0_ProductInfo_0);
                    end);
                end, {
                    21070012
                });
                if v16.controls.onTile then
                    return v3.createElement(v5.Root, {
                        fillDirection = Enum.FillDirection.Vertical, 
                        fillBehavior = v8.Fit, 
                        spacing = v17.Gap.Small, 
                        backgroundStyle = v17.Color.Shift.Shift_200, 
                        Size = v14 - UDim2.fromOffset(2, 2)
                    }, {
                        UIStroke = v3.createElement("UIStroke", {
                            Color = v17.Color.Stroke.Emphasis.Color3, 
                            Transparency = v17.Color.Stroke.Emphasis.Transparency, 
                            Thickness = 1
                        }), 
                        UICorner = v3.createElement("UICorner", {
                            CornerRadius = UDim.new(0, v17.Radius.Medium)
                        }), 
                        TileMedia = v3.createElement(v5.Media, {
                            mediaId = 21070012, 
                            mediaType = v6.Asset, 
                            aspectRatio = 1, 
                            radius = v7.Medium, 
                            background = "component_assets/itemBG_" .. (v17.Config.Theme.Name == v9.Dark and "dark" or "light")
                        }, {
                            UIListLayout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            UIPadding = v3.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, v17.Padding.XSmall), 
                                PaddingBottom = UDim.new(0, v17.Padding.XSmall), 
                                PaddingLeft = UDim.new(0, v17.Padding.XSmall), 
                                PaddingRight = UDim.new(0, v17.Padding.XSmall)
                            }), 
                            Badge = v3.createElement(v10, {
                                text = v16.controls.text, 
                                icon = if v16.controls.icon ~= "" then v16.controls.icon else nil, 
                                size = v16.controls.size, 
                                isDisabled = v16.controls.isDisabled, 
                                variant = v15
                            })
                        }), 
                        TileContent = v3.createElement(v5.Content, {
                            spacing = v17.Gap.XXSmall, 
                            padding = v17.Gap.Small
                        }, {
                            TileHeader = v3.createElement(v5.Header, {
                                title = {
                                    text = v18.Name, 
                                    isLoading = v18.Name == nil, 
                                    fontStyle = v17.Typography.HeadingSmall, 
                                    numLines = 2
                                }, 
                                subtitle = {
                                    text = v18.PriceText, 
                                    isLoading = v18.PriceText == nil, 
                                    fontStyle = v17.Typography.BodyLarge, 
                                    colorStyle = v17.Color.Content.Muted
                                }, 
                                spacing = v17.Gap.Small
                            })
                        })
                    });
                else
                    return v3.createElement(v10, {
                        text = v16.controls.text, 
                        icon = if v16.controls.icon ~= "" then v16.controls.icon else nil, 
                        size = v16.controls.size, 
                        isDisabled = v16.controls.isDisabled, 
                        variant = v15
                    });
                end;
            end
        };
    end), 
    controls = {
        text = "NEW", 
        icon = {
            "icons/placeholder/placeholderOn_small", 
            "icons/menu/clothing/limited_on", 
            ""
        }, 
        size = v4.values(v12), 
        isDisabled = false, 
        onTile = false
    }
};