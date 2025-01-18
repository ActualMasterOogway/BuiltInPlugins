local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v4 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageFixLastViewed)();
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v5.Util.counter;
local l_Localization_0 = v5.ContextServices.Localization;
local l_UI_0 = v5.UI;
local l_Image_0 = l_UI_0.Image;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v12 = require(l_script_FirstAncestor_0.Src.Components.Shimmer);
local v13 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v14 = require(l_script_FirstAncestor_0.Src.Components.Pill);
local v15 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local v16 = require(l_script_FirstAncestor_0.Src.Util.formatISOTimestamp);
local v17 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageWrappedTitles)();
local v18 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageRemoveAgeRecBadge)();
return function(v19) --[[ Line: 66 ]] --[[ Name: InfoTile ]]
    -- upvalues: l_Localization_0 (copy), l_counter_0 (copy), v15 (copy), l_useState_0 (copy), v1 (copy), v12 (copy), v4 (copy), v16 (copy), l_Image_0 (copy), v3 (copy), v14 (copy), v18 (copy), v17 (copy), l_CaptureFocus_0 (copy), v13 (copy)
    local v20 = l_Localization_0:use();
    local v21 = l_counter_0();
    local v22, v23 = v15("PointingHand");
    local v24, v25 = l_useState_0(false);
    local v26, v27 = l_useState_0(nil);
    local v28, v29 = l_useState_0(Vector2.new(0, 0));
    if v19.Cell.IsPlaceholder then
        return v1.createElement(v12.Component, {
            Size = v19.Size, 
            Position = v19.Position
        });
    else
        local l_Cell_0 = v19.Cell;
        local v31 = nil;
        if v4 then
            if l_Cell_0.LastViewed then
                v31 = v16(l_Cell_0.LastViewed, if v4 then v20 else nil);
            end;
        elseif l_Cell_0.Updated then
            v31 = v16(l_Cell_0.Updated, if v4 then v20 else nil);
        end;
        local v32 = {};
        if l_Cell_0.TeamCreatePresence then
            for v33 = 1, math.min(#l_Cell_0.TeamCreatePresence, 2) do
                table.insert(v32, v1.createElement("Frame", {
                    Size = UDim2.new(0, 35, 0, 35), 
                    [v1.Tag] = "X-Fit X-Middle X-Center StartPage-TeamCreateOnlineBackground StartPage-Circular"
                }, {
                    v1.createElement("Frame", {
                        Size = UDim2.new(0, 30, 0, 30), 
                        [v1.Tag] = "X-Fit X-Middle X-Center StartPage-Standard StartPage-Circular"
                    }, {
                        v1.createElement(l_Image_0, {
                            Style = {
                                Image = l_Cell_0.TeamCreatePresence[v33]
                            }, 
                            Size = UDim2.new(0, 30, 0, 30)
                        })
                    })
                }));
            end;
            if #l_Cell_0.TeamCreatePresence > 2 then
                table.insert(v32, v1.createElement("Frame", {
                    Size = UDim2.new(0, 35, 0, 35), 
                    [v1.Tag] = "X-Fit X-Middle X-Center StartPage-Standard StartPage-Circular"
                }, {
                    v1.createElement("TextLabel", {
                        Size = UDim2.new(0, 30, 0, 30), 
                        Text = "+" .. tostring(#l_Cell_0.TeamCreatePresence - 2), 
                        Font = Enum.Font.BuilderSans, 
                        TextSize = 18, 
                        [v1.Tag] = "X-Fit X-Transparent StartPage-StandardDarkTextColor"
                    })
                }));
            end;
        end;
        local v34 = nil;
        v34 = if l_Cell_0.ImageUrl then v1.createElement(l_Image_0, {
            Style = {
                Image = l_Cell_0.ImageUrl
            }, 
            Size = v19.ImageSize, 
            LayoutOrder = v21(), 
            [v1.Tag] = "X-Corner X-Bottom X-Right"
        }, {
            v1.createElement("Frame", {
                [v1.Tag] = "X-Pad X-Fit X-Row X-Transparent"
            }, v32)
        }) else if l_Cell_0.NoLoadableImage then v1.createElement("Frame", {
            Size = v19.ImageSize, 
            BackgroundTransparency = 0.84, 
            LayoutOrder = v21(), 
            [v1.Tag] = "X-Corner X-Center X-Middle StartPage-StandardDarkBackground"
        }, {
            v1.createElement(l_Image_0, {
                Style = {
                    Image = "rbxasset://studio_svg_textures/Lua/StartPage/Light/SI-Standard/Placeholder.png"
                }, 
                Size = UDim2.new(0, 100, 0, 100), 
                [v1.Tag] = "X-Corner"
            })
        }) else v1.createElement(v12.Component, {
            Size = v19.ImageSize
        });
        if not v3 then
            assert(l_Cell_0.SetNetworkResults, "Cell must have a SetNetworkResults callback (temporary hack)");
        end;
        return v1.createElement("TextButton", {
            Position = v19.Position, 
            Size = v19.Size, 
            [v1.Event.Activated] = function() --[[ Line: 186 ]]
                -- upvalues: v19 (copy), l_Cell_0 (copy), v25 (copy)
                v19.OnClick(l_Cell_0);
                v25(false);
            end, 
            [v1.Event.MouseEnter] = v22, 
            [v1.Event.MouseLeave] = v23, 
            [v1.Tag] = "X-Transparent"
        }, {
            v1.createElement("Frame", {
                [v1.Tag] = "X-Fill StartPage-TileBackground StartPage-TilePadding StartPage-RoundedCorner8 X-Column"
            }, {
                Image = v34, 
                Body = v1.createElement("Frame", {
                    LayoutOrder = v21(), 
                    [v1.Tag] = "X-Fit X-Row StartPage-DescPadding X-Transparent"
                }, {
                    Options = v1.createElement("Frame", {
                        Size = UDim2.new(0, 170, 1, -200), 
                        LayoutOrder = v21(), 
                        [v1.Tag] = "X-Fit X-Top StartPage-SearchResultRowColumn X-Transparent"
                    }, {
                        Privacy = if v19.IsPrivacyVisible and l_Cell_0.PrivacyType then v1.createElement("Frame", {
                            LayoutOrder = v21(), 
                            [v1.Tag] = "X-RowS X-Fit X-Transparent"
                        }, {
                            v1.createElement(v14, {
                                Text = v20:getText("Plugin", (("PrivacyType.%*"):format(l_Cell_0.PrivacyType))), 
                                [v1.Tag] = "X-Fit"
                            }), 
                            if not v18 and l_Cell_0.AgeRecommendation and l_Cell_0.AgeRecommendation == 17 then v1.createElement(v14, {
                                Text = l_Cell_0.AgeRecommendation .. "+", 
                                [v1.Tag] = "X-Fit"
                            }) else nil
                        }) else nil, 
                        Title = v1.createElement("TextLabel", {
                            AutomaticSize = if v17 then Enum.AutomaticSize.Y else nil, 
                            Text = l_Cell_0.Name, 
                            TextWrapped = true, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            Size = UDim2.new(1, -30, 0, v17 and 0 or 18), 
                            LayoutOrder = v21(), 
                            [v1.Tag] = "StartPage-TextColor StartPage-TextSize StartPage-FontBold X-Transparent"
                        }, if v17 then {
                            Size = v1.createElement("UISizeConstraint", {
                                MaxSize = Vector2.new(1e999, 50)
                            })
                        } else nil), 
                        FormattedDate = if v31 and v19.IsDateModifiedVisible then v1.createElement("TextLabel", {
                            Text = v20:getText("Plugin", "LastModified", {
                                lastModified = v31
                            }), 
                            TextSize = 12, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            LayoutOrder = v21(), 
                            [v1.Tag] = "X-Fit StartPage-MutedTextColor X-Transparent StartPage-Font"
                        }) else nil, 
                        Description = if l_Cell_0.Description and v19.IsDescriptionVisible then v1.createElement("TextLabel", {
                            Text = l_Cell_0.Description, 
                            TextSize = 12, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            LayoutOrder = v21(), 
                            [v1.Tag] = "X-Fit StartPage-MutedTextColor X-Transparent StartPage-Font"
                        }) else nil, 
                        CreatorName = if l_Cell_0.CreatorName and v19.IsCreatorNameVisible then v1.createElement("TextLabel", {
                            Text = "@" .. l_Cell_0.CreatorName, 
                            TextSize = 12, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            LayoutOrder = v21(), 
                            [v1.Tag] = "X-Fit StartPage-MutedTextColor X-Transparent StartPage-Font"
                        }) else nil
                    }), 
                    Kebab = if v19.IsDropdownMenuVisible then v1.createElement("ImageButton", {
                        Position = UDim2.new(1, -32, 0, 0), 
                        Selectable = false, 
                        [v1.Event.Activated] = function() --[[ Line: 302 ]]
                            -- upvalues: v25 (copy)
                            v25(true);
                        end, 
                        [v1.Event.MouseEnter] = v22, 
                        [v1.Event.MouseLeave] = v23, 
                        [v1.Change.AbsolutePosition] = function(v35) --[[ Line: 307 ]]
                            -- upvalues: v27 (copy)
                            v27(v35.AbsolutePosition);
                        end, 
                        LayoutOrder = v21(), 
                        [v1.Tag] = "X-Corner StartPage-TileBackground StartPage-NoBorder StartPage-KebabIcon"
                    }, {}) else nil, 
                    Focus = if v24 then v1.createElement(l_CaptureFocus_0, {
                        OnFocusLost = function() --[[ Line: 317 ]] --[[ Name: OnFocusLost ]]
                            -- upvalues: v25 (copy)
                            v25(false);
                        end, 
                        [v1.Tag] = "X-Fill X-Transparent"
                    }, {
                        v1.createElement(v13, {
                            Position = UDim2.new(0, v26.X - v28.X + 32, 0, v26.Y - v28.Y), 
                            Hide = not v24 or v28.X == 0 or v28.Y == 0, 
                            KebabMenu = v19.KebabMenu, 
                            SetNetworkResults = if v3 then nil else l_Cell_0.SetNetworkResults, 
                            Cell = l_Cell_0, 
                            OnItemActivated = function() --[[ Line: 334 ]] --[[ Name: OnItemActivated ]]
                                -- upvalues: v25 (copy)
                                v25(false);
                            end, 
                            MenuContainerSizeChanged = function(v36) --[[ Line: 338 ]] --[[ Name: MenuContainerSizeChanged ]]
                                -- upvalues: v29 (copy)
                                v29(v36);
                            end
                        })
                    }) else nil
                })
            })
        });
    end;
end;