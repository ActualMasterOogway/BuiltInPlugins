if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
    local l_Common_0 = l_script_FirstAncestor_0.Bin.Common;
    require(l_Common_0.defineLuaFlags);
    local l_SharedFlags_0 = l_script_FirstAncestor_0.Src.SharedFlags;
    local v3 = require(l_SharedFlags_0.getFFlagAssetAccessErrorMessageImprovements);
    local v4 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v4.launch("AssetAccess", l_script_FirstAncestor_0.Src);
    if v4.isCli() then
        return;
    elseif not v3() then
        return;
    elseif plugin.HostDataModelType ~= Enum.StudioDataModelType.Edit then
        return;
    else
        local v5 = require(l_script_FirstAncestor_0.Src.Util.ShareDialogController).new(plugin);
        plugin.Unloading:Once(function() --[[ Line: 41 ]]
            -- upvalues: v5 (copy)
            v5:Destroy();
        end);
        return;
    end;
end;