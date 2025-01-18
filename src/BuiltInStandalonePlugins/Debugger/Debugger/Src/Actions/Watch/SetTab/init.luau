local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_Action_0 = v1.Util.Action;
local l_Models_0 = l_Parent_0.Src.Models;
local v4 = require(l_Models_0.Watch.TableTab);
local l_includes_0 = v1.Dash.includes;
return l_Action_0(script.Name, function(v6) --[[ Line: 16 ]]
    -- upvalues: l_includes_0 (copy), v4 (copy)
    assert(l_includes_0(v4, v6));
    return {
        currentTab = v6
    };
end);