local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local l_Action_0 = require(l_Packages_0.Framework).Util.Action;
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = require(l_script_FirstAncestor_0.Core.Types.SubsequentDialogStatus);
return l_Action_0(script.Name, function(v5, v6) --[[ Line: 9 ]]
    return {
        assetData = v5, 
        status = v6
    };
end);