local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = require(l_Parent_0.Packages.Framework).Util;
local v2 = {
    analytics = require(l_Parent_0.Src.Resources.AnalyticsHolder)
};
return {
    (l_Util_0.ThunkWithArgsMiddleware(v2))
};