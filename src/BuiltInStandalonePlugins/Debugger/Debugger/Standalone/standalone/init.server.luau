if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local l_Common_0 = script.Parent.Parent.Common;
    require(l_Common_0.defineLuaFlags);
    if require(l_Common_0.Parent.Src.Util.DebugFlags).RunningUnderCLI() then
        return;
    elseif not game:FindService("DebuggerUIService") then
        return;
    else
        require(l_Common_0.commonInit)();
        local v2 = game:GetService("StudioService"):HasInternalPermission();
        local v3 = require(l_Parent_0.Packages.Roact);
        local v4 = require(l_Parent_0.Packages.Framework);
        local v5 = require(l_Parent_0.Src.MainPlugin);
        local v6 = nil;
        local v7 = nil;
        local function v9() --[[ Line: 52 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), v3 (copy), v5 (copy), v6 (ref), v2 (copy), v7 (ref), v4 (copy)
            plugin.Name = l_Parent_0.Name;
            local v8 = v3.createElement(v5, {
                Plugin = plugin
            });
            v6 = v3.mount(v8);
            if v2 then
                if v7 then
                    v7:destroy();
                    v7 = nil;
                end;
                v7 = v4.DeveloperTools.forStandalonePlugin(l_Parent_0.Name, plugin, {});
            end;
            if v7 then
                v7:addRoactTree("Roact tree", v6);
            end;
        end;
        local function v10() --[[ Line: 76 ]] --[[ Name: destroyWindow ]]
            -- upvalues: v7 (ref), v6 (ref), v3 (copy)
            if v7 then
                v7:destroy();
                v7 = nil;
            end;
            if v6 then
                v3.unmount(v6);
                v6 = nil;
            end;
        end;
        plugin.Unloading:Connect(v10);
        v9();
        return;
    end;
end;