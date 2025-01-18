return function(v0, v1) --[[ Line: 1 ]]
    if not v0 then
        return;
    else
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local v3 = require(l_Parent_0.Packages.Roact);
        local v4 = require(l_Parent_0.Packages.Framework);
        local v5 = require(l_Parent_0.Src.MainPlugin);
        local v6 = require(l_Parent_0.Src.Util.hasInternalPermission)();
        local v7 = nil;
        local v8 = nil;
        if v6 then
            v8 = v4.DeveloperTools.forPlugin(l_Parent_0.Name, v0);
        end;
        local function v10() --[[ Line: 33 ]] --[[ Name: init ]]
            -- upvalues: v0 (copy), l_Parent_0 (copy), v3 (copy), v5 (copy), v1 (copy), v7 (ref), v8 (ref)
            v0.Name = l_Parent_0.Name;
            local v9 = v3.createElement(v5, {
                Plugin = v0, 
                pluginLoaderContext = v1
            });
            v7 = v3.mount(v9);
            if v8 then
                v8:addRoactTree("Roact tree", v7);
            end;
        end;
        v0.Unloading:Connect(function() --[[ Line: 48 ]]
            -- upvalues: v8 (ref), v7 (ref), v3 (copy)
            if v8 then
                v8:destroy();
            end;
            if v7 then
                v3.unmount(v7);
                v7 = nil;
            end;
        end);
        v10();
        return;
    end;
end;