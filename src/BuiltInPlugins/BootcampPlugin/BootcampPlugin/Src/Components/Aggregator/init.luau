local l_STUDIOAUTO1302_0 = game:GetFastFlag("STUDIOAUTO1302");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v3.ContextServices.withContext;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_TutorialComponents_0 = l_Parent_0.Src.Components.TutorialComponents;
local v7 = require(l_TutorialComponents_0.MyJiraTicket);
local v8 = v2.PureComponent:extend("Aggregator");
v8.render = function(_) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_STUDIOAUTO1302_0 (copy), v7 (copy)
    return v2.createElement(v2.Fragment, {}, {
        BootcampComponent = l_STUDIOAUTO1302_0 and v2.createElement(v7) or nil
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v8));