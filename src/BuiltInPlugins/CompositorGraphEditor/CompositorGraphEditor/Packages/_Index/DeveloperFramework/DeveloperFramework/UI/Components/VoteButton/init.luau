local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local l_prioritize_0 = require(l_Parent_0.Util).prioritize;
local v5 = require(l_Parent_0.Util.StyleModifier);
local v6 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v7 = require(l_Parent_0.UI.Components.HoverArea);
local v8 = require(l_Parent_0.UI.Components.Pane);
local v9 = v1.PureComponent:extend("VoteButton");
v9.VoteType = {
    UpVote = "UpVote", 
    DownVote = "DownVote"
};
v9.init = function(v10) --[[ Line: 40 ]] --[[ Name: init ]]
    v10.onClick = function() --[[ Line: 41 ]]
        -- upvalues: v10 (copy)
        local l_props_0 = v10.props;
        if l_props_0.CanVote then
            l_props_0.OnClick();
        end;
    end;
end;
v9.render = function(v12) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v9 (ref), v5 (copy), v1 (copy), v6 (copy), v8 (copy), v7 (copy)
    local l_props_1 = v12.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v15 = l_prioritize_0(l_props_1.Size, l_Stylizer_0.Size);
    local v16 = l_prioritize_0(l_props_1.Style, l_Stylizer_0["&" .. l_props_1.VoteType]);
    local v17 = l_props_1.CanVote and v16.CanVote or v16;
    local v18 = l_props_1.VoteType == v9.VoteType.UpVote;
    local v19 = nil;
    if l_props_1.CanVote then
        if l_props_1.UserVote == true and v18 or l_props_1.UserVote == false and not v18 then
            v19 = v5.Selected;
        end;
    else
        v19 = v5.Disabled;
    end;
    return v1.createElement(v6, {
        LayoutOrder = l_props_1.LayoutOrder, 
        Style = v17, 
        StyleModifier = v19, 
        OnClick = v12.onClick, 
        Size = v15
    }, {
        UIListLayout = v1.createElement(v8, {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Thumb = v1.createElement("ImageLabel", v17.ThumbStyle), 
        HoverArea = l_props_1.CanVote and v1.createElement(v7, {
            Cursor = "PointingHand"
        })
    });
end;
v9 = l_withContext_0({
    Stylizer = v2.Stylizer
})(v9);
return v9;