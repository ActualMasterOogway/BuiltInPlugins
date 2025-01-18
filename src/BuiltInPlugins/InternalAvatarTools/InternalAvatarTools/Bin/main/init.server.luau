if not plugin then
    return;
else
    require(script.Parent.defineLuaFlags);
    if not game:GetFastFlag("DebugAvatarInternalToolsPlugin") then
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
            return game:GetService("StudioService"):HasInternalPermission();
        end);
        if not l_status_0 or not l_result_0 then
            return;
        else
            local l_Parent_0 = script.Parent.Parent;
            if require(l_Parent_0.Src.Util.DebugFlags).RunTests() then
                return;
            else
                require(script.Parent.commonInit)();
                local v3 = require(l_Parent_0.Packages.Roact);
                local v4 = require(l_Parent_0.Packages.Framework);
                local v5 = require(l_Parent_0.Src.MainPlugin);
                local v6 = nil;
                local v7 = nil;
                if l_result_0 then
                    v7 = v4.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                end;
                local function v9() --[[ Line: 48 ]] --[[ Name: init ]]
                    -- upvalues: l_Parent_0 (copy), v3 (copy), v5 (copy), v6 (ref), v7 (ref)
                    plugin.Name = l_Parent_0.Name;
                    local v8 = v3.createElement(v5, {
                        Plugin = plugin
                    });
                    v6 = v3.mount(v8);
                    if v7 then
                        v7:addRoactTree("Roact tree", v6);
                    end;
                end;
                plugin.Unloading:Connect(function() --[[ Line: 62 ]]
                    -- upvalues: v7 (ref), v6 (ref), v3 (copy)
                    if v7 then
                        v7:destroy();
                    end;
                    if v6 then
                        v3.unmount(v6);
                        v6 = nil;
                    end;
                end);
                v9();
                return;
            end;
        end;
    end;
end;