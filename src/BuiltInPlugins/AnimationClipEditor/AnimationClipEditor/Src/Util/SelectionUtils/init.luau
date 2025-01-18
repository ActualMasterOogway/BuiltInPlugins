local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v3 = {};
v3.traverse = function(v4, v5, v6, v7, v8) --[[ Line: 38 ]] --[[ Name: traverse ]]
    -- upvalues: v1 (copy), v3 (copy)
    if v6 then
        v6(v4, v5, v8 or {});
    end;
    if v4.Components then
        for v9, v10 in pairs(v4.Components) do
            local v11 = v1.List.join(v8 or {}, {
                v9
            });
            v3.traverse(v10, v5 and v5.Components[v9] or nil, v6, v7, v11);
        end;
    end;
    if v7 then
        v7(v4, v5, v8 or {});
    end;
end;
return v3;