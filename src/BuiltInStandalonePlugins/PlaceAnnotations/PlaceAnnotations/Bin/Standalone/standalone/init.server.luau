local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local l_registerStandaloneCallbacks_0 = require(l_script_FirstAncestor_0.Src.Util.CrossDMCallbacks).registerStandaloneCallbacks;
local v2 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
if not v2.fflagCOLLAB6176PlaceAnnotations then
    return;
elseif not v2.fflagPlaceAnnotationsPublicRelease and not game:GetService("StudioService"):HasInternalPermission() then
    return;
elseif require(l_script_FirstAncestor_0.Packages.TestLoader).isCli() then
    error("roblox-cli should not be loading standalone plugins");
    return;
else
    local v3 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
    if v3.get() ~= v3.Standalone then
        return;
    else
        l_registerStandaloneCallbacks_0(plugin);
        local v4 = require(l_script_FirstAncestor_0.Bin.Common.setup);
        local v5 = require(l_script_FirstAncestor_0.Bin.Common.setupMain);
        v4(plugin, v5);
        return;
    end;
end;