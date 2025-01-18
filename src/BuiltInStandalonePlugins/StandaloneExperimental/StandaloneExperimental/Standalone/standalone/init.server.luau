if not plugin then
    return;
else
    local l_Common_0 = script.Parent.Parent.Common;
    require(l_Common_0.defineFlags);
    if not game:GetFastFlag("DebugEnableStandaloneExperimentalPlugin") then
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
            return game:GetService("StudioService"):HasInternalPermission();
        end);
        if not l_status_0 or not l_result_0 then
            return;
        else
            require(l_Common_0.commonInit)();
            local l_Parent_0 = script.Parent.Parent;
            local v4 = require(l_Parent_0.Packages.Roact);
            local v5 = require(l_Parent_0.Packages.Rodux);
            local v6 = require(l_Parent_0.Packages.Framework);
            local v7 = require(l_Parent_0.Src.Reducers.MainReducer);
            local v8 = require(l_Common_0.createContextItems);
            local v9 = require(l_Parent_0.Src.MainPlugin);
            local v10 = nil;
            local v11 = nil;
            if l_result_0 then
                v11 = v6.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
            end;
            (function() --[[ Line: 47 ]] --[[ Name: init ]]
                -- upvalues: l_Parent_0 (copy), v5 (copy), v7 (copy), v8 (copy), v4 (copy), v9 (copy), v10 (ref), v11 (ref)
                plugin.Name = l_Parent_0.Name;
                local v12 = v5.Store.new(v7, nil, {
                    v5.thunkMiddleware
                });
                local v13 = v8(plugin, v12);
                local v14 = v4.createElement(v9, v13);
                v10 = v4.mount(v14);
                if v11 then
                    v11:addRoactTree("Roact tree", v10);
                end;
                plugin.Unloading:Connect(function() --[[ Line: 64 ]]
                    -- upvalues: v11 (ref), v10 (ref), v4 (ref), v12 (ref), v13 (ref)
                    if v11 then
                        v11:destroy();
                    end;
                    if v10 then
                        v4.unmount(v10);
                        v10 = nil;
                    end;
                    if v12 then
                        v12:destruct();
                        v12 = nil;
                    end;
                    if v13 then
                        for _, v16 in pairs(v13) do
                            v16:destroy();
                        end;
                        v13 = nil;
                    end;
                end);
            end)();
            return;
        end;
    end;
end;