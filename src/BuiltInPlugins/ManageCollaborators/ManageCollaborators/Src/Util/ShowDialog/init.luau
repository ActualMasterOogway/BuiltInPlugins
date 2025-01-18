local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Resources.MakeTheme);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
return function(v6, v7, v8, v9, v10) --[[ Line: 10 ]] --[[ Name: showDialog ]]
    -- upvalues: v1 (copy), l_ContextServices_0 (copy), v3 (copy), v4 (copy)
    local v11 = nil;
    local function v13(v12) --[[ Line: 12 ]] --[[ Name: closeDialog ]]
        -- upvalues: v11 (ref), v1 (ref)
        if v11 then
            v1.unmount(v11);
        end;
        if v12.OnClose then
            v12.OnClose();
        end;
    end;
    local v17 = l_ContextServices_0.provide({
        v7, 
        v3(), 
        v6
    }, {
        v1.createElement(v8, v4.Dictionary.join(v9, {
            OnClose = function() --[[ Line: 29 ]] --[[ Name: OnClose ]]
                -- upvalues: v9 (copy), v11 (ref), v1 (ref)
                local l_v9_0 = v9;
                if v11 then
                    v1.unmount(v11);
                end;
                if l_v9_0.OnClose then
                    l_v9_0.OnClose();
                end;
            end, 
            OnButtonPressed = function(v15) --[[ Line: 32 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: v9 (copy), v11 (ref), v1 (ref)
                v9.OnButtonPressed(v15);
                local l_v9_1 = v9;
                if v11 then
                    v1.unmount(v11);
                end;
                if l_v9_1.OnClose then
                    l_v9_1.OnClose();
                end;
            end
        }), v10)
    });
    v11 = v1.mount(v17, nil);
    return v13;
end;