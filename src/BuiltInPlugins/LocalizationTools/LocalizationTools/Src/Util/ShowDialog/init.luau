local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Promise_0 = v2.Util.Promise;
local v5 = require(l_Parent_0.Src.Resources.PluginTheme);
local _ = Vector2.new(300, 370);
return function(v7, v8, _, v10) --[[ Line: 12 ]]
    -- upvalues: l_Promise_0 (copy), v1 (copy), v5 (copy), l_ContextServices_0 (copy)
    return function(v11, v12, v13) --[[ Line: 13 ]]
        -- upvalues: l_Promise_0 (ref), v7 (copy), v1 (ref), v5 (ref), l_ContextServices_0 (ref), v8 (copy), v10 (copy)
        return l_Promise_0.new(function(v14, _) --[[ Line: 14 ]]
            -- upvalues: v7 (ref), v11 (copy), v12 (copy), v1 (ref), v5 (ref), l_ContextServices_0 (ref), v8 (ref), v10 (ref), v13 (copy)
            spawn(function() --[[ Line: 15 ]]
                -- upvalues: v7 (ref), v11 (ref), v12 (ref), v1 (ref), v14 (copy), v5 (ref), l_ContextServices_0 (ref), v8 (ref), v10 (ref), v13 (ref)
                local v16 = nil;
                local l_v7_QWidgetPluginGui_0 = v7:CreateQWidgetPluginGui(v11, {
                    Size = v12, 
                    Modal = true
                });
                l_v7_QWidgetPluginGui_0.Enabled = true;
                l_v7_QWidgetPluginGui_0.Title = v11;
                local function v18() --[[ Line: 24 ]] --[[ Name: ok ]]
                    -- upvalues: v1 (ref), v16 (ref), l_v7_QWidgetPluginGui_0 (copy), v14 (ref)
                    v1.unmount(v16);
                    l_v7_QWidgetPluginGui_0:Destroy();
                    v14(true);
                end;
                local function v19() --[[ Line: 30 ]] --[[ Name: cancel ]]
                    -- upvalues: v1 (ref), v16 (ref), l_v7_QWidgetPluginGui_0 (copy), v14 (ref)
                    v1.unmount(v16);
                    l_v7_QWidgetPluginGui_0:Destroy();
                    v14(false);
                end;
                l_v7_QWidgetPluginGui_0:GetPropertyChangedSignal("Enabled"):connect(function() --[[ Line: 36 ]]
                    -- upvalues: v1 (ref), v16 (ref), l_v7_QWidgetPluginGui_0 (copy), v14 (ref)
                    v1.unmount(v16);
                    l_v7_QWidgetPluginGui_0:Destroy();
                    v14(false);
                end);
                local v20 = v5();
                local v21 = l_ContextServices_0.provide({
                    v8, 
                    v20, 
                    v10
                }, {
                    Content = v13(v18, v19)
                });
                v16 = v1.mount(v21, l_v7_QWidgetPluginGui_0);
            end);
        end);
    end;
end;