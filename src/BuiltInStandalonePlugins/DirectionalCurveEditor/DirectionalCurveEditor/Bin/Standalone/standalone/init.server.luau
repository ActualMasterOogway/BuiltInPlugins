local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
if not require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagCLI_109818() then
    return;
else
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("DirectionalCurveEditor", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
        if v2.get() ~= v2.standalone then
            return;
        else
            local v3 = require(l_script_FirstAncestor_0.Bin.Common.setup);
            local v4 = require(l_script_FirstAncestor_0.Bin.Common.setupMain);
            v3(plugin, v4);
            return;
        end;
    end;
end;