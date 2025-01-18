if not plugin then
    return;
else
    require(script.Parent.defineLuaFlags);
    require(script.Parent.commonInit)();
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("WindControl", l_Parent_0.Src);
    if v1.isCli() then
        return;
    else
        local v2 = require(l_Parent_0.Packages.React);
        local v3 = require(l_Parent_0.Packages.ReactRoblox);
        local v4 = require(l_Parent_0.Packages.Framework);
        local v5 = require(l_Parent_0.Src.MainPlugin);
        local v6 = nil;
        local v7 = nil;
        if v1.hasInternalPermission() then
            v7 = v4.DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
        end;
        local function v9() --[[ Line: 41 ]] --[[ Name: init ]]
            -- upvalues: l_Parent_0 (copy), v2 (copy), v5 (copy), v6 (ref), v3 (copy), v7 (ref)
            plugin.Name = l_Parent_0.Name;
            local v8 = v2.createElement(v5, {
                Plugin = plugin
            });
            v6 = v3.createRoot(Instance.new("Frame"));
            v6:render(v8);
            if v7 then
                v7:addRoactTree("Roact tree", v6);
            end;
        end;
        plugin.Unloading:Connect(function() --[[ Line: 56 ]]
            -- upvalues: v7 (ref), v6 (ref)
            if v7 then
                v7:destroy();
            end;
            if v6 then
                v6:render(nil);
            end;
        end);
        v9();
        return;
    end;
end;