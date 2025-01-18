local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_joinTags_0 = require(l_Parent_0.Packages.Framework).Styling.joinTags;
local v3 = v1.PureComponent:extend("ActivityHistoryBubbleListFooter");
v3.render = function(v4) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy)
    local l_props_0 = v4.props;
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Fill", "CX-Invisible", "Component-ActivityHistoryBubbleListFooter"), 
        LayoutOrder = l_props_0.layoutOrder
    }, {
        Title = v1.createElement("TextLabel", {
            [v1.Tag] = l_joinTags_0("X-Fit", "CX-Invisible"), 
            Text = l_props_0.title
        })
    });
end;
return v3;