if not plugin then
    return;
else
    require(script.Parent.defineLuaFlags);
    if not game:GetService("StudioService"):HasInternalPermission() then
        return;
    else
        local l_Parent_0 = script.Parent.Parent;
        if require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
            return;
        else
            require(l_Parent_0.Src.Util.commonInit)();
            local v1 = require(l_Parent_0.Src.MainPlugin);
            local v2 = nil;
            local v3 = require(l_Parent_0.Packages.Roact);
            v3.setGlobalConfig({
                typeChecks = true, 
                propValidation = true, 
                elementTracing = true
            });
            local function _() --[[ Line: 37 ]] --[[ Name: init ]]
                -- upvalues: v3 (copy), v1 (copy), v2 (ref)
                plugin.Name = "DeveloperInspector";
                local v4 = v3.createElement(v1, {
                    Plugin = plugin
                });
                v2 = v3.mount(v4);
            end;
            plugin.Unloading:Connect(function() --[[ Line: 47 ]]
                -- upvalues: v2 (ref), v3 (copy)
                if v2 then
                    v3.unmount(v2);
                    v2 = nil;
                end;
            end);
            plugin.Name = "DeveloperInspector";
            local v6 = v3.createElement(v1, {
                Plugin = plugin
            });
            v2 = v3.mount(v6);
            return;
        end;
    end;
end;