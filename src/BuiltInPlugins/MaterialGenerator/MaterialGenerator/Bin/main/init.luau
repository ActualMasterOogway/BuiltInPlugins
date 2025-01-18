return function(v0, v1) --[[ Line: 1 ]]
    if not v0 then
        return;
    else
        require(script.Parent.defineLuaFlags);
        require(script.Parent.commonInit)();
        local l_Parent_0 = script.Parent.Parent;
        local l_MemStorageService_0 = game:GetService("MemStorageService");
        local v4 = require(l_Parent_0.Packages.TestLoader);
        local v5 = require(l_Parent_0.SharedPluginConstants);
        local v6 = require(l_Parent_0.Src.Flags.getFFlagShowMaterialGeneratorFromElsewhere);
        if not game:GetFastFlag("EnableMaterialGenerator") then
            return;
        else
            local v7 = require(l_Parent_0.Packages.React);
            local v8 = require(l_Parent_0.Packages.ReactRoblox);
            local v9 = require(l_Parent_0.Src.MainPlugin);
            local v10 = nil;
            local v11 = nil;
            if v4.hasInternalPermission() then
                v11 = require(l_Parent_0.Packages.Dev.DeveloperTools).forPlugin(l_Parent_0.Name, v0);
            end;
            local function v13() --[[ Line: 37 ]] --[[ Name: init ]]
                -- upvalues: v0 (copy), l_Parent_0 (copy), v7 (copy), v9 (copy), v1 (copy), v10 (ref), v8 (copy), v11 (ref)
                v0.Name = l_Parent_0.Name;
                local v12 = v7.createElement(v9, {
                    Plugin = v0, 
                    pluginLoaderContext = v1
                });
                v10 = v8.createRoot(Instance.new("Frame"));
                v10:render(v12);
                if v11 then
                    v11:addRoactTree("Roact tree", v10);
                end;
            end;
            v0.Unloading:Connect(function() --[[ Line: 53 ]]
                -- upvalues: v11 (ref), v10 (ref)
                if v11 then
                    v11:destroy();
                end;
                if v10 then
                    v10:render(nil);
                end;
            end);
            if v6() then
                v1.signals["MemStorageService." .. v5.LOAD_MATERIAL_GENERATOR]:Connect(function() --[[ Line: 65 ]]
                    -- upvalues: l_MemStorageService_0 (copy), v5 (copy)
                    task.defer(function() --[[ Line: 67 ]]
                        -- upvalues: l_MemStorageService_0 (ref), v5 (ref)
                        l_MemStorageService_0:Fire(v5.MATERIAL_GENERATOR_READY);
                    end);
                end);
            end;
            v13();
            return;
        end;
    end;
end;