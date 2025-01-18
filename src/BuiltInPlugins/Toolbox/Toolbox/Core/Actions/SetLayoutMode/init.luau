local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local l_Action_0 = require(l_Packages_0.Framework).Util.Action;
local _ = require(l_script_FirstAncestor_0.Core.Types.LayoutMode);
return l_Action_0(script.Name, function(v4) --[[ Line: 10 ]]
    return {
        layoutMode = v4
    };
end);