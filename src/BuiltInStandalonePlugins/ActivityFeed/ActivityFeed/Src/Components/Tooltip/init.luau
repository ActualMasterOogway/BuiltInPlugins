local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = v2.Util.LayoutOrderIterator.new();
local l_joinTags_0 = v2.Styling.joinTags;
return function(v5) --[[ Line: 15 ]] --[[ Name: Tooltip ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy), v3 (copy)
    local v6 = {};
    for v7, v8 in pairs(v5.Fragments) do
        v6[v7] = v1.createElement("TextLabel", {
            [v1.Tag] = l_joinTags_0("CX-Invisible", "X-Fit", "X-Column"), 
            Text = v8, 
            RichText = true, 
            LayoutOrder = v3:getNextOrder()
        });
    end;
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("Component-Tooltip"), 
        LayoutOrder = v3:getNextOrder()
    }, v6);
end;