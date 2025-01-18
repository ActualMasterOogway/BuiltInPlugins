return function(v0, v1) --[[ Line: 1 ]]
    if not v0 then
        return;
    else
        require(script.Parent.defineLuaFlags);
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local v3 = require(l_Parent_0.Packages.Roact);
        local v4 = require(l_Parent_0.Src.MainPlugin);
        local v5 = require(l_Parent_0.Src.Util.hasInternalPermission)();
        local v6 = nil;
        local v7 = nil;
        if v5 then
            v7 = require(l_Parent_0.Packages.Dev.DeveloperTools).forPlugin(l_Parent_0.Name, v0);
        end;
        local function v9() --[[ Line: 25 ]] --[[ Name: init ]]
            -- upvalues: v0 (copy), l_Parent_0 (copy), v3 (copy), v4 (copy), v1 (copy), v6 (ref), v7 (ref)
            v0.Name = l_Parent_0.Name;
            local v8 = v3.createElement(v4, {
                Plugin = v0, 
                PluginLoaderContext = v1
            });
            v6 = v3.mount(v8);
            if v7 then
                v7:addRoactTree("R15 Migrator", v6);
            end;
        end;
        v0.Unloading:Connect(function() --[[ Line: 40 ]]
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