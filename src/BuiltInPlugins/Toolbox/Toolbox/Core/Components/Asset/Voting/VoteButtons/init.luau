local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LOCALIZATION_PROJECT_NAME_0 = v4.Resources.LOCALIZATION_PROJECT_NAME;
local v8 = require(l_Parent_0.Core.Util.Constants);
local v9 = require(l_Parent_0.Core.Components.Asset.Voting.VoteButton);
local v10 = require(l_Parent_0.Core.Networking.Requests.PostUnvoteRequest);
local v11 = require(l_Parent_0.Core.Networking.Requests.PostVoteRequest);
local v12 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v13 = v2.PureComponent:extend("VoteButtons");
v13.init = function(v14, _) --[[ Line: 33 ]] --[[ Name: init ]]
    local l_assetId_0 = v14.props.assetId;
    local l_onVoteRequested_0 = v14.props.onVoteRequested;
    local l_onUnvoteRequested_0 = v14.props.onUnvoteRequested;
    v14.onVoteUpClicked = function(_, _, _) --[[ Line: 39 ]]
        -- upvalues: v14 (copy), l_onUnvoteRequested_0 (copy), l_assetId_0 (copy), l_onVoteRequested_0 (copy)
        local l_networkInterface_0 = v14.props.Network.networkInterface;
        local l_voting_0 = v14.props.voting;
        if l_voting_0.HasVoted and l_voting_0.UserVote then
            l_onUnvoteRequested_0(l_networkInterface_0, l_assetId_0);
            return;
        else
            l_onVoteRequested_0(l_networkInterface_0, l_assetId_0, true);
            return;
        end;
    end;
    v14.onVoteDownClicked = function(_, _, _) --[[ Line: 49 ]]
        -- upvalues: v14 (copy), l_onUnvoteRequested_0 (copy), l_assetId_0 (copy), l_onVoteRequested_0 (copy)
        local l_networkInterface_1 = v14.props.Network.networkInterface;
        local l_voting_1 = v14.props.voting;
        if l_voting_1.HasVoted and not l_voting_1.UserVote then
            l_onUnvoteRequested_0(l_networkInterface_1, l_assetId_0);
            return;
        else
            l_onVoteRequested_0(l_networkInterface_1, l_assetId_0, false);
            return;
        end;
    end;
end;
v13.render = function(v29) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), v9 (copy)
    local l_props_0 = v29.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_voting_2 = l_Stylizer_0.asset.voting;
    local l_Localization_0 = l_props_0.Localization;
    local l_showBackgroundBox_0 = l_props_0.showBackgroundBox;
    return v2.createElement("Frame", {
        BackgroundTransparency = l_showBackgroundBox_0 and 0.95 or 1, 
        BackgroundColor3 = if l_showBackgroundBox_0 then l_voting_2.votingButtonsBackgroundBoxColor else nil, 
        LayoutOrder = nil, 
        Size = UDim2.new(1, 0, 0, v8.ASSET_VOTING_BUTTONS_HEIGHT)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, v8.ASSET_VOTE_BUTTONS_HORIZONTAL_PADDING), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UICorner = if l_showBackgroundBox_0 then v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v8.ASSET_VOTING_BUTTONS_BACKGROUND_BOX_CORNER_RADIUS)
        }) else nil, 
        RateText = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0, 
            Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "VoteButons", "Rate"), 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v8.FONT, 
            TextSize = v8.FONT_SIZE_SMALL, 
            TextColor3 = l_Stylizer_0.asset.voting.rateTextColor
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v8.ASSET_VOTE_BUTTONS_TEXT_PADDING)
            })
        }), 
        VoteUpButton = v2.createElement(v9, {
            isVoteUp = true, 
            hasVoted = l_props_0.voting.HasVoted, 
            userVote = l_props_0.voting.UserVote, 
            onClicked = v29.onVoteUpClicked
        }), 
        VoteDownButton = v2.createElement(v9, {
            isVoteUp = false, 
            hasVoted = l_props_0.voting.HasVoted, 
            userVote = l_props_0.voting.UserVote, 
            onClicked = v29.onVoteDownClicked
        })
    });
end;
v13 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v12
})(v13);
return v3.connect(nil, function(v35) --[[ Line: 127 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v10 (copy)
    return {
        onVoteRequested = function(v36, v37, v38) --[[ Line: 129 ]] --[[ Name: onVoteRequested ]]
            -- upvalues: v35 (copy), v11 (ref)
            v35(v11(v36, v37, v38));
        end, 
        onUnvoteRequested = function(v39, v40) --[[ Line: 133 ]] --[[ Name: onUnvoteRequested ]]
            -- upvalues: v35 (copy), v10 (ref)
            v35(v10(v39, v40));
        end
    };
end)(v13);