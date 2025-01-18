local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_Votes_0 = v3.UI.Votes;
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v2.PureComponent:extend("VoteBar");
v8.render = function(v9) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy), l_Votes_0 (copy)
    local l_props_0 = v9.props;
    local _ = l_props_0.Stylizer;
    local l_UpVotes_0 = l_props_0.voting.UpVotes;
    local l_DownVotes_0 = l_props_0.voting.DownVotes;
    local l_VoteCount_0 = l_props_0.voting.VoteCount;
    local l_UpVotePercent_0 = l_props_0.voting.UpVotePercent;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0) or UDim2.new(1, 0, 0, v4.ASSET_VOTING_HEIGHT)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v4.ASSET_INNER_PADDING)
        }), 
        Votes = v2.createElement(l_Votes_0, {
            Voting = {
                UpVotes = l_UpVotes_0, 
                DownVotes = l_DownVotes_0, 
                VoteCount = l_VoteCount_0, 
                UpVotePercent = l_UpVotePercent_0
            }, 
            TextSize = v4.ASSET_VOTE_COUNT_FONT_SIZE, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Font = v4.FONT, 
            Size = UDim2.new(0, 0, 0, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = v4.ASSET_VOTE_COUNT_HORIZONTAL_PADDING, 
            IncludeVoteCount = true, 
            VoteCountHeight = v4.ASSET_VOTE_COUNT_HEIGHT
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));