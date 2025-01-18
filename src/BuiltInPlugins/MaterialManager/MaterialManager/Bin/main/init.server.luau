if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    require(script.Parent.defineLuaFlags);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    require(script.Parent.commonInit)();
    local v3 = require(l_Parent_0.Packages.TestLoader);
    v3.launch(l_Parent_0.Name, l_Parent_0.Src);
    if v3.isCli() then
        return;
    else
        local v4 = require(l_Parent_0.Packages.Roact);
        local v5 = require(l_Parent_0.Packages.Framework);
        local v6 = require(l_Parent_0.Src.MainPlugin);
        local v7 = nil;
        local v8 = nil;
        if l_status_0 and l_result_0 then
            v8 = v5.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
        end;
        local function v10() --[[ Line: 36 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), v4 (copy), v6 (copy), v7 (ref), v8 (ref)
            plugin.Name = l_Parent_0.Name;
            local v9 = v4.createElement(v6, {
                Plugin = plugin
            });
            v7 = v4.mount(v9);
            if v8 then
                v8:addRoactTree("Roact tree", v7);
            end;
        end;
        plugin.Unloading:Connect(function() --[[ Line: 50 ]]
            -- upvalues: v8 (ref), v7 (ref), v4 (copy)
            if v8 then
                v8:destroy();
            end;
            if v7 then
                v4.unmount(v7);
                v7 = nil;
            end;
        end);
        v10();
        return;
    end;
end;