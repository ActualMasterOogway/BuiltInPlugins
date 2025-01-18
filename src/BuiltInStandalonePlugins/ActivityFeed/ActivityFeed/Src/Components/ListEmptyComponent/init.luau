local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local v4 = v2.Util.LayoutOrderIterator.new();
local l_joinTags_0 = v2.Styling.joinTags;
return function(v6) --[[ Line: 16 ]] --[[ Name: ListEmptyComponent ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), l_joinTags_0 (copy), v4 (copy)
    local v7 = l_Localization_0:use();
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Column", "X-Center", "Component-ListEmptyComponent")
    }, {
        NoFilterResultsIcon = v1.createElement("ImageLabel", {
            LayoutOrder = v4:getNextOrder()
        }), 
        Description = v1.createElement("TextLabel", {
            [v1.Tag] = l_joinTags_0("CX-Invisible", "X-Fit"), 
            LayoutOrder = v4:getNextOrder(), 
            Text = v7:getText("EmptyComponent", "NoEventsText")
        }), 
        Edit = v1.createElement("TextButton", {
            [v1.Tag] = l_joinTags_0("X-Fit"), 
            [v1.Event.Activated] = function() --[[ Line: 33 ]]
                -- upvalues: v6 (copy)
                v6.openFiltersFn();
            end, 
            Text = v7:getText("EmptyComponent", "EditButtonText"), 
            LayoutOrder = v4:getNextOrder()
        })
    });
end;