local l_UserService_0 = game:GetService("UserService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _, l_result_0 = pcall(function() --[[ Line: 6 ]]
    return game:GetService("InsertService");
end);
local _, l_result_1 = pcall(function() --[[ Line: 9 ]]
    return game:GetService("StudioService");
end);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.Cryo);
local v12 = require(l_Parent_0.Otter);
local v13 = require(l_script_FirstAncestor_0.Components.Tile);
local v14 = require(l_script_FirstAncestor_0.Enums.MediaType);
local v15 = require(l_script_FirstAncestor_0.Enums.Radius);
local v16 = require(l_script_FirstAncestor_0.Enums.Theme);
local v17 = require(l_script_FirstAncestor_0.Components.Icon);
local v18 = require(l_script_FirstAncestor_0.Components.Image);
local v19 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v20 = require(l_script_FirstAncestor_0.Components.IconButton);
local v21 = require(l_script_FirstAncestor_0.Components.Button);
local v22 = require(l_script_FirstAncestor_0.Enums.ButtonSize);
local v23 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v24 = require(l_script_FirstAncestor_0.Components.Text);
local v25 = require(l_script_FirstAncestor_0.Components.View);
local v26 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v27 = require(script.Parent.ObjectViewport);
local v28 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v29 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v30 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v31 = {
    [2727067538] = 985731078, 
    [1537690962] = 601130232
};
local v32 = UDim2.fromOffset(150, 225);
local v33 = UDim2.fromOffset(150, 230);
local v34 = UDim2.fromOffset(150, 250);
local v35 = UDim2.fromOffset(300, 280);
local v36 = {
    {
        icon = "icons/actions/friends/friendpending", 
        onActivated = function() --[[ Line: 62 ]] --[[ Name: onActivated ]]
            print("Button Pressed");
        end, 
        isSecondary = true
    }
};
local function v47(_, v38, v39, v40) --[[ Line: 69 ]] --[[ Name: thumbnailOverlayComponents ]]
    -- upvalues: v19 (copy), v10 (copy), v30 (copy), v18 (copy), v29 (copy), v11 (copy), v36 (copy), v25 (copy), v20 (copy)
    local l_Small_0 = v38.Padding.Small;
    local l_Medium_0 = v19.Medium;
    local v43 = v38.Semantic.Icon.Size[l_Medium_0];
    local v45 = v10.useCallback(function(v44) --[[ Line: 74 ]]
        -- upvalues: v40 (copy), v30 (ref)
        v40(v44 == v30.Hover);
    end, {
        v40
    });
    return v10.createElement(v18, {
        onStateChanged = v45, 
        Image = "component_assets/vignette_246", 
        imageStyle = {
            Color3 = v38.Color.ActionSubEmphasis.Foreground.Color3, 
            Transparency = v39 and 0.6 or 1
        }, 
        stateLayer = {
            affordance = v29.None
        }, 
        tag = "size-full radius-medium"
    }, {
        ButtonBackgroundGradient = not v11.isEmpty(v36) and v10.createElement(v25, {
            backgroundStyle = {
                Transparency = 0
            }, 
            Size = UDim2.new(1, 0, 0, v43 + l_Small_0 * 2), 
            tag = "radius-medium anchor-bottom-left position-bottom-left"
        }, {
            UIGradient = v10.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v38.Color.Shift.Shift_200.Color3), 
                    ColorSequenceKeypoint.new(1, v38.Color.Shift.Shift_200.Color3)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, v38.Color.Shift.Shift_200.Transparency)
                })
            })
        }), 
        ButtonContainer = v10.createElement(v25, {
            ZIndex = 2, 
            tag = "padding-small size-full"
        }, {
            PlayerTileButtons = v10.createElement(v25, {
                ZIndex = 2, 
                tag = "auto-y size-full-0 row gap-small align-x-right anchor-bottom-right position-bottom-right"
            }, v11.List.map(v36, function(v46) --[[ Line: 117 ]]
                -- upvalues: v10 (ref), v20 (ref), l_Medium_0 (copy)
                return v10.createElement(v20, {
                    onActivated = v46.onActivated, 
                    isDisabled = v46.isDisabled, 
                    size = l_Medium_0, 
                    icon = v46.icon
                });
            end))
        })
    });
end;
local function v49(v48) --[[ Line: 130 ]] --[[ Name: getPlayerCount ]]
    -- upvalues: v10 (copy), v24 (copy)
    return v10.createElement(v24, {
        textStyle = v48.Color.Content.Default, 
        fontStyle = v48.Typography.TitleLarge, 
        Text = "82% \240\159\145\141 92k \240\159\145\164", 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    });
end;
return {
    name = "Tile", 
    stories = {
        Configurable = {
            name = "Configurable Tile", 
            story = function(v50) --[[ Line: 147 ]] --[[ Name: story ]]
                -- upvalues: v26 (copy), v10 (copy), v13 (copy), v14 (copy), v15 (copy), v49 (copy)
                local v51 = v26();
                return v10.createElement(v13.Root, {
                    fillDirection = v50.controls.fillDirection, 
                    fillBehavior = v50.controls.fillBehavior, 
                    Size = if v50.controls.fillDirection == Enum.FillDirection.Vertical then UDim2.fromOffset(150, 275) else UDim2.fromOffset(300, 150), 
                    spacing = v51.Gap.Small, 
                    backgroundStyle = v51.Color.Shift.Shift_200
                }, {
                    Corner = v10.createElement("UICorner", {
                        CornerRadius = UDim.new(0, v51.Radius.Medium)
                    }), 
                    TileMedia = v10.createElement(v13.Media, {
                        mediaId = v50.controls.itemId, 
                        mediaType = v14.Asset, 
                        aspectRatio = v50.controls.aspectRatio, 
                        background = v51.Color.Shift.Shift_200, 
                        radius = v15.Medium
                    }), 
                    TileContent = v10.createElement(v13.Content, {
                        spacing = v51.Gap.XSmall, 
                        padding = v51.Padding.Small
                    }, {
                        TileHeader = v10.createElement(v13.Header, {
                            title = {
                                text = v50.controls.title, 
                                isLoading = v50.controls.title == nil, 
                                fontStyle = v51.Typography.HeadingSmall, 
                                numLines = v50.controls.numLines
                            }, 
                            subtitle = {
                                text = v50.controls.subtitle, 
                                isLoading = v50.controls.subtitle == nil, 
                                fontStyle = v51.Typography.BodyLarge, 
                                colorStyle = v51.Color.Content.Muted
                            }, 
                            spacing = v51.Gap.Small
                        }), 
                        TileFooter = v10.createElement(v13.Footer, {}, {
                            v49(v51)
                        })
                    })
                });
            end
        }, 
        Fun = {
            name = "Fun Tile", 
            story = function(v52) --[[ Line: 197 ]] --[[ Name: story ]]
                -- upvalues: v26 (copy), v10 (copy), l_MarketplaceService_0 (copy), l_ReplicatedStorage_0 (copy), l_result_0 (copy), v13 (copy), v28 (copy), v15 (copy), v16 (copy), v27 (copy)
                local v53 = v26();
                local v54, v55 = v10.useState({});
                local v56, v57 = v10.useState(nil);
                local l_itemId_0 = v52.controls.itemId;
                v10.useEffect(function() --[[ Line: 203 ]]
                    -- upvalues: v55 (copy), l_MarketplaceService_0 (ref), l_itemId_0 (copy), l_ReplicatedStorage_0 (ref), l_result_0 (ref), v57 (copy)
                    v55({});
                    spawn(function() --[[ Line: 205 ]]
                        -- upvalues: l_MarketplaceService_0 (ref), l_itemId_0 (ref), v55 (ref)
                        wait(2);
                        local l_l_MarketplaceService_0_ProductInfo_0 = l_MarketplaceService_0:GetProductInfo(l_itemId_0);
                        if l_l_MarketplaceService_0_ProductInfo_0.IsPublicDomain then
                            l_l_MarketplaceService_0_ProductInfo_0.PriceInRobux = 0;
                            l_l_MarketplaceService_0_ProductInfo_0.PriceText = "Free";
                        else
                            assert(l_l_MarketplaceService_0_ProductInfo_0.PriceInRobux ~= nil, "Item price will not be nil");
                            l_l_MarketplaceService_0_ProductInfo_0.PriceText = "\238\128\130" .. tostring(l_l_MarketplaceService_0_ProductInfo_0.PriceInRobux);
                        end;
                        v55(l_l_MarketplaceService_0_ProductInfo_0);
                    end);
                    local v60 = l_ReplicatedStorage_0:FindFirstChild((("%*"):format(l_itemId_0))) or if l_result_0 then l_result_0:LoadAsset(l_itemId_0) else nil;
                    if v60 then
                        assert(v60:IsA("Model"), "Fetched item is a Model");
                        v57(v60);
                    end;
                end, {
                    l_itemId_0
                });
                return v10.createElement(v13.Root, {
                    fillDirection = Enum.FillDirection.Horizontal, 
                    fillBehavior = v28.Fit, 
                    spacing = v53.Gap.Small, 
                    backgroundStyle = v53.Color.Shift.Shift_200, 
                    Size = UDim2.fromOffset(300, 150) - UDim2.fromOffset(2, 2)
                }, {
                    UIStroke = v10.createElement("UIStroke", {
                        Color = v53.Color.Stroke.Emphasis.Color3, 
                        Transparency = v53.Color.Stroke.Emphasis.Transparency, 
                        Thickness = 1
                    }), 
                    UICorner = v10.createElement("UICorner", {
                        CornerRadius = UDim.new(0, v53.Radius.Medium)
                    }), 
                    TileMedia = v10.createElement(v13.Media, {
                        aspectRatio = 1, 
                        radius = v15.Medium, 
                        background = "component_assets/itemBG_" .. (v53.Config.Theme.Name == v16.Dark and "dark" or "light")
                    }, {
                        if v56 then v10.createElement(v27, {
                            model = v56, 
                            rotationSpeed = 0.01
                        }) else nil
                    }), 
                    TileContent = v10.createElement(v13.Content, {
                        spacing = v53.Gap.XXSmall, 
                        padding = v53.Padding.Small
                    }, {
                        TileHeader = v10.createElement(v13.Header, {
                            title = {
                                text = v54.Name, 
                                isLoading = v54.Name == nil, 
                                fontStyle = v53.Typography.HeadingSmall, 
                                numLines = 2
                            }, 
                            subtitle = {
                                text = v54.PriceText, 
                                isLoading = v54.PriceText == nil, 
                                fontStyle = v53.Typography.BodyLarge, 
                                colorStyle = v53.Color.Content.Muted
                            }, 
                            spacing = v53.Gap.Small
                        })
                    })
                });
            end
        }, 
        Experience = {
            name = "Experience Tile", 
            story = function(v61) --[[ Line: 282 ]] --[[ Name: story ]]
                -- upvalues: v26 (copy), v10 (copy), v30 (copy), v35 (copy), v31 (copy), l_MarketplaceService_0 (copy), v12 (copy), v25 (copy), v13 (copy), v28 (copy), v34 (copy), v14 (copy), v15 (copy), v16 (copy), v49 (copy), v21 (copy), v22 (copy), v23 (copy)
                local v62 = v26();
                local v63, v64 = v10.useState(false);
                local v65, v66 = v10.useState(false);
                local v68 = v10.useCallback(function(v67) --[[ Line: 288 ]]
                    -- upvalues: v64 (copy), v30 (ref)
                    v64(v67 == v30.Hover);
                end, {
                    v64
                });
                local v70 = v10.useCallback(function(v69) --[[ Line: 292 ]]
                    -- upvalues: v66 (copy), v30 (ref)
                    v66(v69 == v30.Hover);
                end, {
                    v66
                });
                local v71, v72 = v10.useBinding(v35);
                local v73, v74 = v10.useState({});
                local l_placeId_0 = v61.controls.placeId;
                local v76 = v31[l_placeId_0];
                v10.useEffect(function() --[[ Line: 301 ]]
                    -- upvalues: v74 (copy), l_MarketplaceService_0 (ref), l_placeId_0 (copy)
                    v74({});
                    spawn(function() --[[ Line: 303 ]]
                        -- upvalues: l_MarketplaceService_0 (ref), l_placeId_0 (ref), v74 (ref)
                        wait(2);
                        local l_l_MarketplaceService_0_ProductInfo_1 = l_MarketplaceService_0:GetProductInfo(l_placeId_0);
                        v74(l_l_MarketplaceService_0_ProductInfo_1);
                    end);
                end, {
                    l_placeId_0
                });
                local v78 = v10.useRef(nil);
                v10.useEffect(function() --[[ Line: 311 ]]
                    -- upvalues: v12 (ref), v78 (copy), v72 (copy), v35 (ref)
                    local v79 = v12.createSingleMotor(0);
                    v78.current = v79;
                    v79:start();
                    v79:onStep(function(v80) --[[ Line: 316 ]]
                        -- upvalues: v72 (ref), v35 (ref)
                        v72(v35 + UDim2.fromOffset(v80, v80));
                    end);
                    return function() --[[ Line: 320 ]]
                        -- upvalues: v79 (copy)
                        v79:destroy();
                    end;
                end, {});
                v10.useEffect(function() --[[ Line: 325 ]]
                    -- upvalues: v65 (copy), v62 (copy), v78 (copy), v12 (ref)
                    local v81 = if v65 then v62.Padding.Small else 0;
                    if v78.current then
                        v78.current:setGoal(v12.spring(v81, {
                            frequency = 4
                        }));
                    end;
                end, {
                    v65
                });
                return v10.createElement(v25, {
                    tag = "auto-xy gap-large padding-small row"
                }, {
                    Tile = v10.createElement(v13.Root, {
                        fillDirection = Enum.FillDirection.Vertical, 
                        fillBehavior = v28.Fill, 
                        spacing = v62.Gap.Small, 
                        backgroundStyle = v62.Color.Shift.Shift_200, 
                        onStateChanged = v68, 
                        Size = v34 - UDim2.fromOffset(2, 2), 
                        LayoutOrder = 1
                    }, {
                        UIStroke = v10.createElement("UIStroke", {
                            Color = v62.Color.Stroke.Emphasis.Color3, 
                            Transparency = v62.Color.Stroke.Emphasis.Transparency, 
                            Thickness = 1
                        }), 
                        UICorner = v10.createElement("UICorner", {
                            CornerRadius = UDim.new(0, v62.Radius.Medium)
                        }), 
                        TileMedia = v10.createElement(v13.Media, {
                            mediaId = if v63 then l_placeId_0 else v76, 
                            mediaType = if v63 then v14.Asset else v14.GameIcon, 
                            aspectRatio = v63 and 1.7778 or 1, 
                            radius = v15.Medium, 
                            background = "component_assets/avatarBG_" .. (v62.Config.Theme.Name == v16.Dark and "dark" or "light")
                        }), 
                        TileContent = v10.createElement(v13.Content, {
                            spacing = v62.Gap.Small, 
                            padding = v62.Padding.Small
                        }, {
                            TileHeader = v10.createElement(v13.Header, {
                                title = {
                                    text = v73.Name, 
                                    isLoading = v73.Name == nil, 
                                    fontStyle = v62.Typography.HeadingSmall, 
                                    numLines = 2
                                }, 
                                spacing = v62.Gap.Small
                            }), 
                            TileFooter = v10.createElement(v13.Footer, {}, {
                                v49(v62)
                            }), 
                            TileActions = v10.createElement(v13.Actions, {
                                Visible = v63
                            }, {
                                Button = v10.createElement(v21, {
                                    text = "Play", 
                                    size = v22.Small, 
                                    variant = v23.Emphasis, 
                                    fillBehavior = v28.Fill, 
                                    onActivated = function() --[[ Line: 385 ]] --[[ Name: onActivated ]]
                                        print("play pressed!");
                                    end
                                })
                            })
                        })
                    }), 
                    WideTileWrapper = v10.createElement(v25, {
                        Size = v35, 
                        LayoutOrder = 2
                    }, {
                        WideTile = v10.createElement(v13.Root, {
                            fillDirection = Enum.FillDirection.Vertical, 
                            fillBehavior = v28.Fill, 
                            spacing = v62.Gap.Small, 
                            padding = v62.Padding.Small, 
                            backgroundStyle = if v65 then v62.Color.Shift.Shift_200 else nil, 
                            onStateChanged = v70, 
                            Size = v71, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5)
                        }, {
                            UICorner = v10.createElement("UICorner", {
                                CornerRadius = UDim.new(0, v62.Radius.Medium)
                            }), 
                            TileMedia = v10.createElement(v13.Media, {
                                mediaId = v76, 
                                mediaType = v14.GameIcon, 
                                aspectRatio = 1.7778, 
                                radius = v15.Medium, 
                                background = "component_assets/avatarBG_" .. (v62.Config.Theme.Name == v16.Dark and "dark" or "light")
                            }), 
                            TileContent = v10.createElement(v13.Content, {
                                spacing = v62.Gap.Small
                            }, {
                                TileHeader = v10.createElement(v13.Header, {
                                    title = {
                                        text = v73.Name, 
                                        isLoading = v73.Name == nil, 
                                        fontStyle = v62.Typography.TitleLarge, 
                                        numLines = 2
                                    }, 
                                    subtitle = "82% \240\159\145\141 92k \240\159\145\164", 
                                    spacing = v62.Gap.Small
                                }), 
                                TileActions = v10.createElement(v13.Actions, {
                                    Visible = v65
                                }, {
                                    Button = v10.createElement(v21, {
                                        text = "Play", 
                                        size = v22.Small, 
                                        variant = v23.Emphasis, 
                                        fillBehavior = v28.Fill, 
                                        onActivated = function() --[[ Line: 439 ]] --[[ Name: onActivated ]]
                                            print("play pressed!");
                                        end
                                    })
                                })
                            })
                        })
                    }), 
                    WideTileWithPadding = v10.createElement(v25, {
                        Size = v35, 
                        LayoutOrder = 3
                    }, {
                        WideTile = v10.createElement(v13.Root, {
                            fillDirection = Enum.FillDirection.Vertical, 
                            fillBehavior = v28.Fill, 
                            spacing = v62.Gap.Small, 
                            padding = v62.Padding.Small, 
                            backgroundStyle = v62.Color.Shift.Shift_200, 
                            Size = v35, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5)
                        }, {
                            UICorner = v10.createElement("UICorner", {
                                CornerRadius = UDim.new(0, v62.Radius.Medium)
                            }), 
                            TileMedia = v10.createElement(v13.Media, {
                                mediaId = v76, 
                                mediaType = v14.GameIcon, 
                                aspectRatio = 1.7778, 
                                radius = v15.Medium, 
                                background = "component_assets/avatarBG_" .. (v62.Config.Theme.Name == v16.Dark and "dark" or "light")
                            }), 
                            TileContent = v10.createElement(v13.Content, {
                                spacing = v62.Gap.Small
                            }, {
                                TileHeader = v10.createElement(v13.Header, {
                                    title = {
                                        text = v73.Name, 
                                        isLoading = v73.Name == nil, 
                                        fontStyle = v62.Typography.TitleLarge, 
                                        numLines = 2
                                    }, 
                                    subtitle = "82% \240\159\145\141 92k \240\159\145\164", 
                                    spacing = v62.Gap.Small
                                }), 
                                TileActions = v10.createElement(v13.Actions, {}, {
                                    Button = v10.createElement(v21, {
                                        text = "Play", 
                                        size = v22.Small, 
                                        variant = v23.Emphasis, 
                                        fillBehavior = v28.Fill, 
                                        onActivated = function() --[[ Line: 491 ]] --[[ Name: onActivated ]]
                                            print("play pressed!");
                                        end
                                    })
                                })
                            })
                        })
                    })
                });
            end
        }, 
        Item = {
            name = "Item Tile", 
            story = function(v82) --[[ Line: 504 ]] --[[ Name: story ]]
                -- upvalues: v26 (copy), v10 (copy), l_MarketplaceService_0 (copy), v13 (copy), v28 (copy), v33 (copy), v14 (copy), v15 (copy), v16 (copy)
                local v83 = v26();
                local v84, v85 = v10.useState({});
                local l_itemId_1 = v82.controls.itemId;
                v10.useEffect(function() --[[ Line: 509 ]]
                    -- upvalues: v85 (copy), l_MarketplaceService_0 (ref), l_itemId_1 (copy)
                    v85({});
                    spawn(function() --[[ Line: 511 ]]
                        -- upvalues: l_MarketplaceService_0 (ref), l_itemId_1 (ref), v85 (ref)
                        wait(2);
                        local l_l_MarketplaceService_0_ProductInfo_2 = l_MarketplaceService_0:GetProductInfo(l_itemId_1);
                        if l_l_MarketplaceService_0_ProductInfo_2.IsPublicDomain then
                            l_l_MarketplaceService_0_ProductInfo_2.PriceInRobux = 0;
                            l_l_MarketplaceService_0_ProductInfo_2.PriceText = "Free";
                        else
                            assert(l_l_MarketplaceService_0_ProductInfo_2.PriceInRobux ~= nil, "Item price will not be nil");
                            l_l_MarketplaceService_0_ProductInfo_2.PriceText = "\238\128\130" .. tostring(l_l_MarketplaceService_0_ProductInfo_2.PriceInRobux);
                        end;
                        v85(l_l_MarketplaceService_0_ProductInfo_2);
                    end);
                end, {
                    l_itemId_1
                });
                return v10.createElement(v13.Root, {
                    fillDirection = Enum.FillDirection.Vertical, 
                    fillBehavior = v28.Fit, 
                    spacing = v83.Gap.Small, 
                    backgroundStyle = v83.Color.Shift.Shift_200, 
                    Size = v33 - UDim2.fromOffset(2, 2)
                }, {
                    UIStroke = v10.createElement("UIStroke", {
                        Color = v83.Color.Stroke.Emphasis.Color3, 
                        Transparency = v83.Color.Stroke.Emphasis.Transparency, 
                        Thickness = 1
                    }), 
                    UICorner = v10.createElement("UICorner", {
                        CornerRadius = UDim.new(0, v83.Radius.Medium)
                    }), 
                    TileMedia = v10.createElement(v13.Media, {
                        mediaId = l_itemId_1, 
                        mediaType = v14.Asset, 
                        aspectRatio = 1, 
                        radius = v15.Medium, 
                        background = "component_assets/itemBG_" .. (v83.Config.Theme.Name == v16.Dark and "dark" or "light")
                    }), 
                    TileContent = v10.createElement(v13.Content, {
                        spacing = v83.Gap.XXSmall, 
                        padding = v83.Padding.Small
                    }, {
                        TileHeader = v10.createElement(v13.Header, {
                            title = {
                                text = v84.Name, 
                                isLoading = v84.Name == nil, 
                                fontStyle = v83.Typography.HeadingSmall, 
                                numLines = 2
                            }, 
                            subtitle = {
                                text = v84.PriceText, 
                                isLoading = v84.PriceText == nil, 
                                fontStyle = v83.Typography.BodyLarge, 
                                colorStyle = v83.Color.Content.Muted
                            }, 
                            spacing = v83.Gap.Small
                        })
                    })
                });
            end
        }, 
        Player = {
            name = "Player Tile", 
            story = function(v88) --[[ Line: 575 ]] --[[ Name: story ]]
                -- upvalues: v26 (copy), v10 (copy), l_Players_0 (copy), l_result_1 (copy), l_UserService_0 (copy), v25 (copy), v13 (copy), v28 (copy), v32 (copy), v14 (copy), v15 (copy), v16 (copy), v47 (copy), v17 (copy), v19 (copy), v24 (copy), v18 (copy)
                local v89 = v26();
                local v90 = {
                    text = "Hueblox", 
                    icon = "icons/common/play", 
                    fontStyle = v89.Typography.CaptionLarge, 
                    iconTextSpacing = v89.Gap.XSmall, 
                    iconPadding = 0, 
                    iconSize = UDim2.fromOffset(v89.Size.Size_300, v89.Size.Size_300), 
                    textHeight = v89.Size.Size_700, 
                    onActivated = function() --[[ Line: 586 ]] --[[ Name: onActivated ]]
                        print("Relevancy Info Pressed");
                    end
                };
                local v91, v92 = v10.useState({});
                local v93, v94 = v10.useState(false);
                local v95 = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else if l_result_1 then l_result_1:GetUserId() else nil;
                v10.useEffect(function() --[[ Line: 598 ]]
                    -- upvalues: v92 (copy), l_UserService_0 (ref), v95 (copy)
                    v92({});
                    spawn(function() --[[ Line: 600 ]]
                        -- upvalues: l_UserService_0 (ref), v95 (ref), v92 (ref)
                        wait(2);
                        local l_l_UserService_0_UserInfosByUserIdsAsync_0 = l_UserService_0:GetUserInfosByUserIdsAsync({
                            v95
                        });
                        v92(l_l_UserService_0_UserInfosByUserIdsAsync_0[1]);
                    end);
                end, {
                    v95
                });
                return v10.createElement(v25, {
                    tag = "auto-xy gap-large row"
                }, {
                    PlayerTile = v10.createElement(v13.Root, {
                        fillDirection = Enum.FillDirection.Vertical, 
                        fillBehavior = v28.Fit, 
                        spacing = v89.Gap.Small, 
                        Size = v32
                    }, {
                        TileMedia = v10.createElement(v13.Media, {
                            mediaId = v95, 
                            mediaType = v14.Avatar, 
                            aspectRatio = 1, 
                            radius = v15.Medium, 
                            background = "component_assets/avatarBG_" .. (v89.Config.Theme.Name == v16.Dark and "dark" or "light")
                        }, {
                            v47(v88, v89, v93, v94)
                        }), 
                        TileContent = v10.createElement(v13.Content, {
                            spacing = v89.Gap.XSmall
                        }, {
                            TileHeader = v10.createElement(v13.Header, {
                                title = {
                                    text = v91.DisplayName, 
                                    isLoading = v91.DisplayName == nil
                                }, 
                                subtitle = {
                                    text = if v91.Username then "@" .. v91.Username else nil, 
                                    isLoading = v91.Username == nil
                                }
                            }), 
                            TileFooter = v10.createElement(v13.Footer, {}, {
                                RelevancyInfo = v10.createElement(v25, {
                                    tag = "row gap-xsmall auto-y items-y-center size-full-0"
                                }, {
                                    Icon = v10.createElement(v17, {
                                        name = v90.icon, 
                                        size = v19.Small
                                    }), 
                                    Text = v10.createElement(v24, {
                                        textStyle = v89.Color.Content.Emphasis, 
                                        fontStyle = v90.fontStyle, 
                                        Text = v90.text, 
                                        TextXAlignment = Enum.TextXAlignment.Left, 
                                        Size = UDim2.fromScale(1, 0), 
                                        AutomaticSize = Enum.AutomaticSize.Y
                                    })
                                })
                            })
                        })
                    }), 
                    OldPlayerTile = v10.createElement(v13.Root, {
                        fillDirection = Enum.FillDirection.Vertical, 
                        fillBehavior = v28.Fit, 
                        spacing = v89.Gap.Small, 
                        Size = UDim2.fromOffset(90, 115)
                    }, {
                        TileMedia = v10.createElement(v13.Media, {
                            mediaId = v95, 
                            mediaType = v14.AvatarHeadShot, 
                            aspectRatio = 1, 
                            radius = v15.Circle, 
                            background = "component_assets/avatarBG_" .. (v89.Config.Theme.Name == v16.Dark and "dark" or "light")
                        }, {
                            v10.createElement(v18, {
                                Image = "icons/placeholder/placeholderOff", 
                                backgroundStyle = v89.Color.System.Success, 
                                Size = UDim2.fromOffset(28, 28), 
                                Position = UDim2.fromScale(1, 1), 
                                AnchorPoint = Vector2.new(1, 1)
                            }, {
                                UICorner = v10.createElement("UICorner", {
                                    CornerRadius = UDim.new(0, v89.Radius.Circle)
                                })
                            }); 
                            UIStroke = v10.createElement("UIStroke", {
                                Color = v89.Color.Stroke.Emphasis.Color3, 
                                Transparency = v89.Color.Stroke.Emphasis.Transparency, 
                                Thickness = 2
                            })
                        }), 
                        TileContent = v10.createElement(v13.Content, {
                            spacing = v89.Gap.XXSmall
                        }, {
                            TileHeader = v10.createElement(v13.Header, {
                                title = {
                                    text = v91.DisplayName, 
                                    isLoading = v91.DisplayName == nil
                                }, 
                                subtitle = {
                                    text = v90.text, 
                                    isLoading = v91.DisplayName == nil
                                }, 
                                TextXAlignment = Enum.TextXAlignment.Center
                            })
                        })
                    })
                });
            end
        }, 
        Marketplace = {
            name = "Marketplace Tile (work in progress)", 
            story = function(v97) --[[ Line: 718 ]] --[[ Name: story ]]
                -- upvalues: v26 (copy), v10 (copy), v25 (copy), v13 (copy), v28 (copy), v14 (copy), v15 (copy), v16 (copy)
                local v98 = v26();
                return v10.createElement(v25, {
                    tag = "auto-xy gap-large row"
                }, {
                    MarketplaceTile = v10.createElement(v13.Root, {
                        fillDirection = Enum.FillDirection.Horizontal, 
                        fillBehavior = v28.Fit, 
                        spacing = v98.Gap.Small, 
                        Size = UDim2.new(0, 300, 0, 150)
                    }, {
                        TileContent = v10.createElement(v13.Content, {
                            spacing = v98.Gap.XSmall, 
                            LayoutOrder = 1
                        }, {
                            TileHeader = v10.createElement(v13.Header, {
                                title = {
                                    text = "Try out studio!"
                                }, 
                                subtitle = {
                                    text = "Do something exciting in studio."
                                }
                            }), 
                            TileFooter = v10.createElement(v13.Footer, {}, {})
                        }), 
                        TileMedia = v10.createElement(v13.Media, {
                            mediaId = v97.controls.placeId, 
                            mediaType = v14.Asset, 
                            aspectRatio = 1, 
                            radius = v15.Medium, 
                            background = "component_assets/avatarBG_" .. (v98.Config.Theme.Name == v16.Dark and "dark" or "light"), 
                            LayoutOrder = 2
                        })
                    })
                });
            end
        }
    }, 
    controls = {
        fillDirection = {
            Enum.FillDirection.Vertical, 
            Enum.FillDirection.Horizontal
        }, 
        fillBehavior = {
            v28.Fill, 
            v28.Fit
        }, 
        itemId = {
            21070012, 
            125378389, 
            14825332446, 
            3360689775
        }, 
        aspectRatio = 1, 
        title = "Build a Boat for Treasure", 
        numLines = 2, 
        subtitle = "By Koi Koi Studios", 
        placeId = {
            2727067538, 
            1537690962
        }
    }
};