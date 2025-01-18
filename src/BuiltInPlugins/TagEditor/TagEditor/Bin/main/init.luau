return function(v0, v1) --[[ Line: 1 ]]
    if not v0 then
        return;
    else
        local l_ImprovePluginSpeed_TagEditor_0 = game:GetFastFlag("ImprovePluginSpeed_TagEditor");
        if not l_ImprovePluginSpeed_TagEditor_0 then
            require(script.Parent.defineLuaFlags);
        end;
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        if not l_ImprovePluginSpeed_TagEditor_0 and not require(l_Parent_0.Src.Util.shouldPluginRun)() then
            return;
        else
            local v4 = require(l_Parent_0.Packages.Roact);
            local v5 = require(l_Parent_0.Packages.Framework);
            local v6 = require(l_Parent_0.Src.MainPlugin);
            local v7 = require(l_Parent_0.Src.Util.hasInternalPermission)();
            local v8 = nil;
            local v9 = nil;
            if v7 then
                v9 = v5.DeveloperTools.forPlugin(l_Parent_0.Name, v0);
            end;
            local function v11() --[[ Line: 38 ]] --[[ Name: init ]]
                -- upvalues: v0 (copy), l_Parent_0 (copy), v4 (copy), v6 (copy), l_ImprovePluginSpeed_TagEditor_0 (copy), v1 (copy), v8 (ref), v9 (ref)
                v0.Name = l_Parent_0.Name;
                local v10 = v4.createElement(v6, {
                    Plugin = v0, 
                    pluginLoaderContext = if l_ImprovePluginSpeed_TagEditor_0 then v1 else nil
                });
                v8 = v4.mount(v10);
                if v9 then
                    v9:addRoactTree("Roact tree", v8);
                end;
            end;
            v0.Unloading:Connect(function() --[[ Line: 53 ]]
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
end;