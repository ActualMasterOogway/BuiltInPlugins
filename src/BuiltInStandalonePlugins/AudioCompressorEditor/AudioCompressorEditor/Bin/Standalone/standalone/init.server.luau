local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
if not require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableEditor() then
    return;
elseif require(l_script_FirstAncestor_0.Packages.TestLoader).isCli() then
    error("roblox-cli should not be loading standalone plugins");
    return;
else
    local v1 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
    require(l_script_FirstAncestor_0.Src.Util.AnalyzerUtil).setPlugin(plugin);
    if v1.get() ~= v1.Standalone then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Bin.Common.setup);
        local v3 = require(l_script_FirstAncestor_0.Bin.Common.setupMain);
        v2(plugin, v3);
        return;
    end;
end;