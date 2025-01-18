local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util);
local v5 = require(l_Parent_0.Util.Typecheck);
local l_prioritize_0 = v4.prioritize;
local l_LayoutOrderIterator_0 = v4.LayoutOrderIterator;
local l_formatVoteNumber_0 = v4.formatVoteNumber;
local v9 = require(l_Parent_0.UI.Components.Container);
local v10 = require(l_Parent_0.UI.Components.TextLabel);
local v11 = require(script.Parent.VoteButton);
local v12 = require(script.Parent.Votes);
local v13 = v1.PureComponent:extend("VoteBar");
v5.wrap(v13, script);
v13.init = function(v14) --[[ Line: 40 ]] --[[ Name: init ]]
    v14.onVoteUp = function() --[[ Line: 41 ]]
        -- upvalues: v14 (copy)
        local l_props_0 = v14.props;
        local l_AssetId_0 = l_props_0.AssetId;
        l_props_0.OnVoteUp(l_AssetId_0, l_props_0.Voting);
    end;
    v14.onVoteDown = function() --[[ Line: 47 ]]
        -- upvalues: v14 (copy)
        local l_props_1 = v14.props;
        local l_AssetId_1 = l_props_1.AssetId;
        l_props_1.OnVoteDown(l_AssetId_1, l_props_1.Voting);
    end;
end;
v13.render = function(v19) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), l_LayoutOrderIterator_0 (copy), l_formatVoteNumber_0 (copy), v1 (copy), v11 (copy), v9 (copy), v12 (copy), v10 (copy)
    local l_props_2 = v19.props;
    local l_Stylizer_0 = v19.props.Stylizer;
    local v22 = l_prioritize_0(l_props_2.Size, l_Stylizer_0.Size);
    local v23 = l_LayoutOrderIterator_0.new();
    local v24 = if l_props_2.Voting.VoteCount ~= nil then l_props_2.Voting.VoteCount else 0;
    local v25 = l_formatVoteNumber_0.hasEnoughRatings(v24);
    local v26 = {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 5), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        VoteUp = v1.createElement(v11, {
            CanVote = l_props_2.Voting.CanVote, 
            LayoutOrder = v23:getNextOrder(), 
            OnClick = v19.onVoteUp, 
            UserVote = l_props_2.Voting.UserVote, 
            VoteType = v11.VoteType.UpVote
        }), 
        VoteDown = v1.createElement(v11, {
            CanVote = l_props_2.Voting.CanVote, 
            LayoutOrder = v23:getNextOrder(), 
            OnClick = v19.onVoteDown, 
            UserVote = l_props_2.Voting.UserVote, 
            VoteType = v11.VoteType.DownVote
        })
    };
    return v1.createElement(v9, {
        Background = l_Stylizer_0.Background, 
        BackgroundStyle = l_Stylizer_0.BackgroundStyle, 
        Padding = l_Stylizer_0.Padding, 
        LayoutOrder = l_props_2.LayoutOrder, 
        Position = l_props_2.Position, 
        Size = v22
    }, {
        Left = v1.createElement(v9, {
            Size = UDim2.new(0.6, 0, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                Padding = UDim.new(0, 5), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Votes = if not v25 then nil else v1.createElement(v12, {
                LayoutOrder = v23:getNextOrder(), 
                Size = UDim2.new(0, 65, 1, 0), 
                Style = l_Stylizer_0.Votes, 
                Voting = l_props_2.Voting
            }), 
            VoteCount = v1.createElement(v10, {
                LayoutOrder = v23:getNextOrder(), 
                Size = if not v25 then UDim2.new(1, 0, 1, 0) else UDim2.new(1, -65, 1, 0), 
                Style = l_Stylizer_0.VoteCount, 
                Text = l_formatVoteNumber_0.getFormattedVoteNumberAndText(v24, v19.props.Localization, false, true), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        }), 
        Right = v1.createElement(v9, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(0.4, 0, 1, 0)
        }, v26)
    });
end;
return (l_withContext_0({
    Localization = v2.Localization, 
    Stylizer = v2.Stylizer
})(v13));