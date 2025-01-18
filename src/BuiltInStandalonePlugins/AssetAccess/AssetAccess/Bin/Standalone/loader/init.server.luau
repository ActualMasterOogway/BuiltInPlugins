local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local l_SharedFlags_0 = l_script_FirstAncestor_0.Src.SharedFlags;
if not require(l_SharedFlags_0.getFFlagAssetAccessErrorMessageImprovements)() then
    return;
else
    local v2 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v2.launch("AssetAccess", l_script_FirstAncestor_0.Src);
    if v2.isCli() then
        return;
    else
        plugin.Name = l_script_FirstAncestor_0.Name;
        require(script.Parent.main)(plugin);
        return;
    end;
end;