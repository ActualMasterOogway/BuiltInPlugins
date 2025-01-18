local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_LoadingIndicator_0 = v2.UI.LoadingIndicator;
return function() --[[ Line: 11 ]] --[[ Name: ListLoadingIndicator ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy), l_LoadingIndicator_0 (copy)
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("Component-ListLoadingIndicator", "X-Center", "X-Middle")
    }, {
        LoadingIndicator = v1.createElement(l_LoadingIndicator_0, {})
    });
end;