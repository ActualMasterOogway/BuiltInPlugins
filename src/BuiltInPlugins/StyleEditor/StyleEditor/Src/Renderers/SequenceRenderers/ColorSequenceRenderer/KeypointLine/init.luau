local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_joinTags_0 = require(l_Parent_0.Packages.Framework).Styling.joinTags;
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
return function(v4) --[[ Line: 17 ]] --[[ Name: KeypointLine ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy)
    return v1.createElement("Frame", {
        LayoutOrder = v4.LayoutOrder, 
        Position = v4.Position, 
        [v1.Tag] = l_joinTags_0("ColorSequenceLine", v4.Selected and "Selected" or nil), 
        [v1.Event.MouseEnter] = function() --[[ Line: 23 ]]
            -- upvalues: v4 (copy)
            v4.OnHoverStart();
        end
    });
end;