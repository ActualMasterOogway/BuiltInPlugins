local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Tooltip_0 = v2.UI.Tooltip;
local v4 = v2.Util.LayoutOrderIterator.new();
local l_joinTags_0 = v2.Styling.joinTags;
return function(v6) --[[ Line: 18 ]] --[[ Name: CheckButton ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy), v4 (copy), l_Tooltip_0 (copy)
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0(v6[v1.Tag], "Component-CheckButton", "X-Transparent", "data-testid=Component-CheckButtonFrame"), 
        LayoutOrder = v6.LayoutOrder
    }, {
        Image = v1.createElement("ImageButton", {
            [v1.Tag] = l_joinTags_0("CheckButton-Image", "X-AnchorCenter", v6.isChecked and "Checked" or "Unchecked", "data-testid=Component-CheckButtonImage"), 
            LayoutOrder = v4:getNextOrder(), 
            [v1.Event.Activated] = function() --[[ Line: 36 ]]
                -- upvalues: v6 (copy)
                v6.onClick(not v6.isChecked);
            end
        }, {
            Tooltip = if v6.tooltipText and #v6.tooltipText > 0 then v1.createElement(l_Tooltip_0, {
                Text = v6.tooltipText
            }) else nil
        })
    });
end;