local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
v1.launch("StartPage", l_script_FirstAncestor_0.Src);
if v1.isCli() then
    return;
else
    local v2 = require(l_script_FirstAncestor_0.Packages.React);
    local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
    local v4 = require(l_script_FirstAncestor_0.Src.MainPlugin);
    local v5 = v2.createElement(v4, {
        Plugin = plugin
    });
    local l_Frame_0 = Instance.new("Frame");
    v3.createRoot(l_Frame_0):render(v5);
    return;
end;