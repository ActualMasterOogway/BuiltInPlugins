if not plugin then
    return;
else
    local l_Common_0 = script.Parent.Parent.Common;
    require(l_Common_0.defineLuaFlags);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if not l_status_0 or not l_result_0 then
        return;
    else
        require(l_Common_0.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local v4 = require(l_Parent_0.Packages.Roact);
        local v5 = require(l_Parent_0.Packages.Framework);
        local v6 = require(l_Parent_0.Src.MainPlugin);
        local v7 = require(l_Parent_0.Src.Util.DMBridge);
        local v8 = nil;
        local v9 = nil;
        local function v11() --[[ Line: 37 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), v7 (copy), v4 (copy), v6 (copy), v8 (ref), l_result_0 (copy), v9 (ref), v5 (copy)
            plugin.Name = l_Parent_0.Name;
            v7.setPluginObject(plugin);
            local v10 = v4.createElement(v6, {
                Plugin = plugin
            });
            v8 = v4.mount(v10);
            if l_result_0 then
                v9 = v5.DeveloperTools.forStandalonePlugin(l_Parent_0.Name, plugin, {
                    rootInstance = v8, 
                    rootPrefix = {
                        "UserInputPlaybackGui"
                    }
                });
            end;
            if v9 then
                v9:addRoactTree("Roact tree", v8);
            end;
        end;
        plugin.Unloading:Connect(function() --[[ Line: 60 ]]
            -- upvalues: v9 (ref), v8 (ref), v4 (copy)
            if v9 then
                v9:destroy();
            end;
            if v8 then
                v4.unmount(v8);
                v8 = nil;
            end;
        end);
        v11();
        return;
    end;
end;