return function(v0, v1) --[[ Line: 1 ]]
    if not v0 then
        return;
    else
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local v3 = require(l_Parent_0.Packages.React);
        local v4 = require(l_Parent_0.Packages.ReactRoblox);
        local v5 = require(l_Parent_0.Packages.Dev.DeveloperTools);
        local v6 = require(l_Parent_0.Packages.TestLoader);
        local v7 = require(l_Parent_0.Src.MainPlugin);
        local v8 = nil;
        local v9 = nil;
        if v6.hasInternalPermission() then
            v9 = v5.forPlugin(l_Parent_0.Name, v0);
        end;
        local function v11() --[[ Line: 25 ]] --[[ Name: init ]]
            -- upvalues: v0 (copy), l_Parent_0 (copy), v3 (copy), v7 (copy), v1 (copy), v8 (ref), v4 (copy), v9 (ref)
            v0.Name = l_Parent_0.Name;
            local v10 = v3.createElement(v7, {
                Plugin = v0, 
                PluginLoaderContext = v1
            });
            v8 = v4.createRoot(Instance.new("Frame"));
            v8:render(v10);
            if v9 then
                v9:addRoactTree("Roact tree", v8);
            end;
        end;
        v0.Unloading:Connect(function() --[[ Line: 41 ]]
            -- upvalues: v9 (ref), v8 (ref)
            if v9 then
                v9:destroy();
            end;
            if v8 then
                v8:render(nil);
            end;
        end);
        v11();
        return;
    end;
end;