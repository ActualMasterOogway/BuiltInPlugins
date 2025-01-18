local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ExplorerGuiUri);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_createElement_0 = v3.createElement;
return function() --[[ Line: 9 ]] --[[ Name: WidgetRegister ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy), l_createElement_0 (copy)
    local v5 = v2.ContextServices.Plugin:use():get();
    local v6 = v3.useRef(nil);
    v3.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: v6 (copy), v5 (copy), v1 (ref)
        assert(v6.current ~= nil, "WidgetRegister not mounted");
        local l_v5_PluginComponent_0 = v5:GetPluginComponent("Widgets");
        task.spawn(function() --[[ Line: 19 ]]
            -- upvalues: l_v5_PluginComponent_0 (copy), v1 (ref), v6 (ref)
            l_v5_PluginComponent_0:RegisterAsync({
                {
                    Uri = v1, 
                    Widget = v6.current, 
                    DEPRECATED_PluginGui = v6.current:FindFirstAncestorWhichIsA("PluginGui")
                }
            });
        end);
        return function() --[[ Line: 29 ]]
            -- upvalues: l_v5_PluginComponent_0 (copy), v1 (ref)
            task.spawn(function() --[[ Line: 30 ]]
                -- upvalues: l_v5_PluginComponent_0 (ref), v1 (ref)
                l_v5_PluginComponent_0:DeregisterAsync({
                    v1
                });
            end);
        end;
    end, {});
    return l_createElement_0("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ref = v6
    });
end;