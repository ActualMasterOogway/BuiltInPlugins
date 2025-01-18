local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local v4 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
return function(v6, v7, v8, v9) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v5 (copy), v4 (copy), l_ContextServices_0 (copy), v2 (copy)
    local v10 = nil;
    local function v12(v11) --[[ Line: 13 ]] --[[ Name: closeDialog ]]
        -- upvalues: v10 (ref), v1 (ref)
        if v10 then
            v1.unmount(v10);
        end;
        if v11.OnClose then
            v11.OnClose();
        end;
    end;
    local v13 = v5.RunTests();
    local v14 = v4(v13);
    local v16 = l_ContextServices_0.provide({
        v7, 
        v14, 
        v6
    }, {
        v1.createElement(v8, v2.Dictionary.join(v9, {
            OnClose = function() --[[ Line: 33 ]] --[[ Name: OnClose ]]
                -- upvalues: v9 (copy), v10 (ref), v1 (ref)
                local l_v9_0 = v9;
                if v10 then
                    v1.unmount(v10);
                end;
                if l_v9_0.OnClose then
                    l_v9_0.OnClose();
                end;
            end
        }))
    });
    v10 = v1.mount(v16);
    return v12;
end;