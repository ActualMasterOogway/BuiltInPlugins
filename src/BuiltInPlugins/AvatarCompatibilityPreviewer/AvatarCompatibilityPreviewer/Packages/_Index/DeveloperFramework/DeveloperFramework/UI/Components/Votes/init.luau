local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util);
local l_formatVoteNumber_0 = v4.formatVoteNumber;
local v6 = require(l_Parent_0.Util.Typecheck);
local l_prioritize_0 = v4.prioritize;
local v8 = require(l_Parent_0.UI.Components.Image);
local v9 = require(l_Parent_0.UI.Components.TextLabel);
local v10 = v1.PureComponent:extend("Votes");
v6.wrap(v10, script);
v10.render = function(v11) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v1 (copy), v8 (copy), v9 (copy), l_formatVoteNumber_0 (copy)
    local l_props_0 = v11.props;
    local l_Voting_0 = l_props_0.Voting;
    local v14 = 0;
    local v15 = if l_Voting_0.VoteCount ~= nil then l_Voting_0.VoteCount else 0;
    v14 = l_Voting_0.UpVotePercent or 0;
    local l_Stylizer_0 = v11.props.Stylizer;
    local v17 = l_prioritize_0(l_props_0.Size, l_Stylizer_0.Size);
    local v18 = l_prioritize_0(l_props_0.Font, l_Stylizer_0.Font);
    local v19 = nil;
    v19 = if l_props_0.VoteCountHeight then UDim2.new(0, 0, 0, l_props_0.VoteCountHeight) else UDim2.new(0, 0, 1, 0);
    local v20 = nil;
    local v21 = nil;
    if v15 ~= nil then
        if v15 < 20 then
            v20 = l_Stylizer_0.ThumbUp.Colors.Gray;
        elseif v14 >= 70 then
            v20 = l_Stylizer_0.ThumbUp.Colors.Green;
            v21 = l_Stylizer_0.GoodRatingColor;
        elseif v14 < 70 and v14 >= 40 then
            v20 = l_Stylizer_0.ThumbUp.Colors.Yellow;
            v21 = l_Stylizer_0.OkayRatingColor;
        else
            v20 = l_Stylizer_0.ThumbUp.Colors.Red;
            v21 = l_Stylizer_0.PoorRatingColor;
        end;
    end;
    return v1.createElement("Frame", {
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_props_0.Position, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = v17, 
        BackgroundTransparency = 1
    }, {
        Layout = v1.createElement("UIListLayout", {
            Padding = if l_props_0.Padding ~= nil then UDim.new(0, l_props_0.Padding) else UDim.new(0, 5), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = if l_props_0.VerticalAlignment ~= nil then l_props_0.VerticalAlignment else Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Icon = v1.createElement(v8, {
            ImageColor3 = v20, 
            Image = l_Stylizer_0.ThumbUp.Icon, 
            LayoutOrder = 10, 
            Style = l_Stylizer_0.Icon
        }), 
        Text = v1.createElement(v9, {
            LayoutOrder = 20, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = string.format("%d%%", v14), 
            TextColor = v21, 
            Style = l_Stylizer_0.Text, 
            TextSize = l_props_0.TextSize
        }), 
        VoteCount = if l_props_0.IncludeVoteCount then v1.createElement(v9, {
            LayoutOrder = 30, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = v19, 
            Text = l_formatVoteNumber_0.getFormattedVoteNumberAndText(v15, l_props_0.Localization, true, false), 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Style = l_Stylizer_0.VoteCount, 
            Font = v18, 
            TextSize = l_props_0.TextSize, 
            TextXAlignment = Enum.TextXAlignment.Left
        }) else nil
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer, 
    Localization = v2.Localization
})(v10));