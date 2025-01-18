local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.VoteButton);
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v6 = require(l_Parent_0.Util);
local l_formatVoteNumber_0 = v6.formatVoteNumber;
local v8 = require(l_Parent_0.Util.formatLocalDateTime);
local l_Immutable_0 = v6.Immutable;
local l_LayoutOrderIterator_0 = v6.LayoutOrderIterator;
local l_prioritize_0 = v6.prioritize;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v13 = require(l_Parent_0.UI.Components.HoverArea);
local v14 = require(l_Parent_0.UI.Components.Image);
local v15 = require(l_Parent_0.UI.Components.Pane);
local v16 = require(l_Parent_0.UI.Components.Separator);
local v17 = require(l_Parent_0.UI.Components.TextLabel);
local v18 = require(l_Parent_0.UI.Components.Tooltip);
local v19 = require(l_Parent_0.Wrappers.withAbsoluteSize);
local v20 = require(script.Parent.Favorites);
local v21 = require(script.Parent.Votes);
local v22 = v2.PureComponent:extend("AssetPreviewDetails");
v22.render = function(v23) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), l_LayoutOrderIterator_0 (copy), v8 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), l_formatVoteNumber_0 (copy), v2 (copy), v15 (copy), l_join_0 (copy), v21 (copy), v17 (copy), v1 (copy), v16 (copy), v20 (copy), l_Immutable_0 (copy), v14 (copy), v18 (copy), v13 (copy)
    local l_props_0 = v23.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v27 = l_prioritize_0(l_props_0.Size, l_Stylizer_0.Size);
    local l_LeftWidthScale_0 = l_Stylizer_0.LeftWidthScale;
    local v29 = l_LayoutOrderIterator_0.new();
    local v30 = nil;
    local v31 = nil;
    if l_props_0.LastUpdatedDate then
        v30 = v8(l_props_0.LastUpdatedDate, "LL", l_Localization_0:getLocale());
        v31 = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "LastUpdatedDate", {
            date = v30
        });
    end;
    local v32 = 0;
    local v33 = false;
    if l_props_0.Voting then
        v32 = if l_props_0.Voting.VoteCount ~= nil then l_props_0.Voting.VoteCount else 0;
        v33 = l_formatVoteNumber_0.hasEnoughRatings(v32);
    end;
    local l_Horizontal_0 = Enum.FillDirection.Horizontal;
    local l_VoteSpacingHorizontal_0 = l_Stylizer_0.VoteSpacingHorizontal;
    if l_props_0.AbsoluteSize.X < l_Stylizer_0.MinBreakpointWidth then
        l_Horizontal_0 = Enum.FillDirection.Vertical;
        l_VoteSpacingHorizontal_0 = l_Stylizer_0.VoteSpacingVertical;
    end;
    local v36 = l_props_0.Voting and l_props_0.Voting.CanVote;
    local v37 = v36 and not l_props_0.IsUninstalledPlugin;
    return v2.createElement(v15, l_join_0({
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor = l_Stylizer_0.BackgroundColor, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Padding = l_Stylizer_0.Padding, 
        Position = l_props_0.Position, 
        Size = v27, 
        Spacing = 10, 
        Style = "RoundBox"
    }, l_props_0.WrapperProps), {
        VoteBar = v2.createElement(v15, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v29:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Left = if l_props_0.Voting then v2.createElement(v15, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = l_Horizontal_0, 
                LayoutOrder = v29:getNextOrder(), 
                Size = UDim2.new(l_LeftWidthScale_0, 0, 0, 0), 
                Spacing = l_VoteSpacingHorizontal_0, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                Votes = if v33 and l_props_0.Voting then v2.createElement(v21, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v29:getNextOrder(), 
                    Style = l_Stylizer_0.Votes, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    Voting = l_props_0.Voting
                }) else nil, 
                VoteCount = v2.createElement(v17, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v29:getNextOrder(), 
                    Style = l_Stylizer_0.VoteCount, 
                    Text = l_formatVoteNumber_0.getFormattedVoteNumberAndText(v32, l_Localization_0, false, true), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                })
            }) else nil, 
            Right = if v37 then v2.createElement(v15, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(0, 0, 0, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                Spacing = l_Stylizer_0.AssetHeader.VoteSpacing, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v29:getNextOrder(), 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                VoteUp = v2.createElement(v1, {
                    CanVote = v36, 
                    LayoutOrder = v29:getNextOrder(), 
                    OnClick = v23.props.OnVoteUp, 
                    UserVote = l_props_0.Voting.UserVote, 
                    VoteType = v1.VoteType.UpVote
                }), 
                VoteDown = v2.createElement(v1, {
                    CanVote = v36, 
                    LayoutOrder = v29:getNextOrder(), 
                    OnClick = v23.props.OnVoteDown, 
                    UserVote = l_props_0.Voting.UserVote, 
                    VoteType = v1.VoteType.DownVote
                })
            }) else nil
        }), 
        VoteSeparator = if l_props_0.Favorites then v2.createElement(v16, {
            LayoutOrder = v29:getNextOrder()
        }) else nil, 
        Favorites = if l_props_0.Favorites then v2.createElement(v15, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v29:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Left = v2.createElement(v15, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = l_Horizontal_0, 
                LayoutOrder = v29:getNextOrder(), 
                Size = UDim2.new(l_LeftWidthScale_0, 0, 0, 0), 
                Spacing = l_VoteSpacingHorizontal_0, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                FavoriteLabel = v2.createElement(v17, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v29:getNextOrder(), 
                    Style = l_Stylizer_0.InfoRow.TitleText, 
                    Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "Favorites"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                })
            }), 
            Right = v2.createElement(v15, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(1, 0), 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v29:getNextOrder(), 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(1 - l_LeftWidthScale_0, 0, 0, 0), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                Favorites = v2.createElement(v20, l_Immutable_0.JoinDictionaries({
                    AutomaticSize = Enum.AutomaticSize.X, 
                    LayoutOrder = v29:getNextOrder(), 
                    Size = UDim2.new(0, 0, 0, 20)
                }, l_props_0.Favorites))
            })
        }) else nil, 
        Separator = if (not not l_props_0.Voting or l_props_0.Favorites) and (l_props_0.IsPackage or l_props_0.HasScripts) then v2.createElement(v16, {
            LayoutOrder = v29:getNextOrder()
        }) else nil, 
        PackageContainer = if l_props_0.IsPackage then v2.createElement(v15, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v29:getNextOrder(), 
            Spacing = l_Stylizer_0.InfoRow.ElementPadding, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            PackageIconContainer = v2.createElement(v15, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v29:getNextOrder(), 
                Padding = {
                    Top = 2
                }, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                PackageIcon = v2.createElement(v14, {
                    LayoutOrder = v29:getNextOrder(), 
                    Style = l_Stylizer_0.PackageIcon
                })
            }), 
            TitleContainer = v2.createElement(v15, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v29:getNextOrder(), 
                Spacing = l_Stylizer_0.InfoRow.DescriptionSpacing
            }, {
                UpdateableText = v2.createElement(v17, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v29:getNextOrder(), 
                    Style = l_Stylizer_0.InfoRow.TitleText, 
                    Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "Updateable"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }), 
                LastUpdatedText = if l_props_0.LastUpdatedDate then v2.createElement(v17, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v29:getNextOrder(), 
                    Style = l_Stylizer_0.InfoRow.DescriptionText, 
                    Text = v31, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }) else nil
            })
        }) else nil, 
        ScriptsContainer = if l_props_0.HasScripts then v2.createElement(v15, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v29:getNextOrder(), 
            Spacing = l_Stylizer_0.InfoRow.ElementPadding
        }, {
            ScriptIcon = v2.createElement(v14, {
                LayoutOrder = v29:getNextOrder(), 
                Style = l_Stylizer_0.ScriptArea.ScriptIcon
            }), 
            ScriptText = v2.createElement(v17, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextWrapped = false, 
                Style = l_Stylizer_0.InfoRow.TitleText, 
                LayoutOrder = v29:getNextOrder(), 
                Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "ContainsScripts")
            }), 
            ScriptInfoIcon = v2.createElement(v14, {
                LayoutOrder = v29:getNextOrder(), 
                Style = l_Stylizer_0.ScriptArea.ScriptInfoIcon
            }, {
                Tooltip = v2.createElement(v18, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetPreview", "HasScriptsTooltip")
                }), 
                HoverArea = v2.createElement(v13, {
                    Cursor = "PointingHand"
                })
            })
        }) else nil
    });
end;
return v19((l_withContext_0({
    Localization = v3.Localization, 
    Stylizer = v3.Stylizer
})(v22)));