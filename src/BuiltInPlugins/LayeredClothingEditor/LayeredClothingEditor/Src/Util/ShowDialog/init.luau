local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Mouse_0 = v2.ContextServices.Mouse;
local v5 = require(l_Parent_0.Src.Resources.PluginTheme);
local v6 = require(l_Parent_0.Src.Util.DebugFlags);
local _ = require(l_Parent_0.Src.Util.TestHelper);
local v8 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
return function(v10, v11, v12, v13) --[[ Line: 18 ]] --[[ Name: showDialog ]]
    -- upvalues: v1 (copy), v6 (copy), v5 (copy), l_ContextServices_0 (copy), l_Mouse_0 (copy), v8 (copy)
    local v14 = nil;
    local function v16(v15) --[[ Line: 20 ]] --[[ Name: closeDialog ]]
        -- upvalues: v14 (ref), v1 (ref)
        if v14 then
            v1.unmount(v14);
        end;
        if v15.OnClose then
            v15.OnClose();
        end;
    end;
    local v17 = v6.RunTests() or v6.RunRhodiumTests();
    local v18 = nil;
    v18 = if v17 then v5.mock() else v5.makePluginTheme();
    local v20 = l_ContextServices_0.provide({
        v11, 
        v18, 
        v10, 
        l_Mouse_0.new(v10:get():getMouse())
    }, {
        v1.createElement(v12, v8.Dictionary.join(v13, {
            OnClose = function() --[[ Line: 46 ]] --[[ Name: OnClose ]]
                -- upvalues: v13 (copy), v14 (ref), v1 (ref)
                local l_v13_0 = v13;
                if v14 then
                    v1.unmount(v14);
                end;
                if l_v13_0.OnClose then
                    l_v13_0.OnClose();
                end;
            end
        }))
    });
    if v17 then

    end;
    v14 = v1.mount(v20, nil);
    return v16;
end;