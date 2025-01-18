if not plugin then
    return;
else
    require(script.Parent.defineLuaFlags);
    require(script.Parent.commonInit)();
    local l_Parent_0 = script.Parent.Parent;
    if not require(l_Parent_0.Src.Util.shouldPluginRun)() then
        return;
    else
        local v1 = require(l_Parent_0.Packages.Roact);
        local v2 = require(l_Parent_0.Packages.Rodux);
        local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
        local _ = require(l_Parent_0.Src.Types);
        local v5 = require(script.Parent.createContextItems);
        local v6 = require(l_Parent_0.Src.MainPlugin);
        local v7 = require(l_Parent_0.Src.Reducers.MainReducer);
        (function() --[[ Line: 28 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), v2 (copy), v7 (copy), v5 (copy), v1 (copy), v6 (copy)
            plugin.Name = l_Parent_0.Name;
            local v8 = nil;
            local v9 = v2.Store.new(v7, nil, {
                v2.thunkMiddleware
            });
            local v10 = v5(plugin, v9);
            local v11 = v1.createElement(v6, v10);
            local v12 = v1.mount(v11);
            if v8 then
                v8:addRoactTree("Roact tree", v12);
            end;
            plugin.Unloading:Connect(function() --[[ Line: 48 ]]
                -- upvalues: v8 (ref), v12 (ref), v1 (ref), v9 (ref), v10 (ref)
                if v8 then
                    v8:destroy();
                    v8 = nil;
                end;
                if v12 then
                    v1.unmount(v12);
                    v12 = nil;
                end;
                if v9 then
                    v9:destruct();
                    v9 = nil;
                end;
                if v10 then
                    for _, v14 in pairs(v10) do
                        v14:destroy();
                    end;
                    v10 = nil;
                end;
            end);
        end)();
        return;
    end;
end;