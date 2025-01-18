local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
if not require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableModerationDialog() then
    return;
elseif require(l_script_FirstAncestor_0.Packages.TestLoader).isCli() then
    error("roblox-cli should not be loading standalone plugins");
    return;
else
    local v1 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
    if v1.get() ~= v1.Standalone then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Bin.Common.setup);
        local v3 = require(l_script_FirstAncestor_0.Bin.Common.setupMain);
        v2(plugin, v3);
        return;
    end;
end;