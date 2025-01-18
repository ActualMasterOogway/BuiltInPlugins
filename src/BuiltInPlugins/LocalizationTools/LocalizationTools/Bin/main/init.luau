return function(v0, v1) --[[ Line: 1 ]]
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.Packages.Roact);
    local v4 = require(l_Parent_0.Src.MainPlugin);
    local v5 = nil;
    local function _() --[[ Line: 12 ]] --[[ Name: init ]]
        -- upvalues: v0 (copy), v3 (copy), v4 (copy), v1 (copy), v5 (ref)
        v0.Name = "LocalizationTools";
        local v6 = v3.createElement(v4, {
            Plugin = v0, 
            pluginLoaderContext = v1 or nil
        });
        v5 = v3.mount(v6);
    end;
    v0.Unloading:Connect(function() --[[ Line: 23 ]]
        -- upvalues: v5 (ref), v3 (copy)
        if v5 then
            v3.unmount(v5);
            v5 = nil;
        end;
    end);
    v0.Name = "LocalizationTools";
    local v8 = v3.createElement(v4, {
        Plugin = v0, 
        pluginLoaderContext = v1 or nil
    });
    v5 = v3.mount(v8);
end;