return function(v0, v1) --[[ Line: 1 ]]
    if not v0 then
        return;
    else
        local l_Parent_0 = script.Parent.Parent;
        local v3 = require(l_Parent_0.Packages.Roact);
        local v4 = require(l_Parent_0.Src.Components.PlayerEmulatorPlugin);
        (function() --[[ Line: 12 ]] --[[ Name: main ]]
            -- upvalues: v3 (copy), v4 (copy), v0 (copy), v1 (copy)
            local v5 = nil;
            local function v6() --[[ Line: 15 ]] --[[ Name: onPluginWillDestroy ]]
                -- upvalues: v5 (ref), v3 (ref)
                if v5 then
                    v3.unmount(v5);
                end;
            end;
            local v7 = v3.createElement(v4, {
                plugin = v0, 
                onPluginWillDestroy = v6, 
                pluginLoaderContext = v1
            });
            v5 = v3.mount(v7);
        end)();
        return;
    end;
end;