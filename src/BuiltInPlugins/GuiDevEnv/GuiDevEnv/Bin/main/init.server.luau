local l_Parent_0 = script.Parent.Parent;
local l_EnableGuiDevEnv_0 = game:GetFastFlag("EnableGuiDevEnv");
if not game:GetService("StudioService"):HasInternalPermission() then
    return;
elseif not l_EnableGuiDevEnv_0 then
    return;
else
    require(script.Parent.commonInit)();
    local v2 = require(l_Parent_0.Packages.Roact);
    local v3 = require(l_Parent_0.Src.MainPlugin);
    local v4 = nil;
    local function _() --[[ Line: 19 ]] --[[ Name: init ]]
        -- upvalues: v2 (copy), v3 (copy), v4 (ref)
        plugin.Name = "Guide";
        local v5 = v2.createElement(v3, {
            plugin = plugin
        });
        v4 = v2.mount(v5);
    end;
    plugin.Unloading:Connect(function() --[[ Line: 29 ]]
        -- upvalues: v4 (ref), v2 (copy)
        if v4 then
            v2.unmount(v4);
            v4 = nil;
        end;
    end);
    plugin.Name = "Guide";
    local v7 = v2.createElement(v3, {
        plugin = plugin
    });
    v4 = v2.mount(v7);
    return;
end;