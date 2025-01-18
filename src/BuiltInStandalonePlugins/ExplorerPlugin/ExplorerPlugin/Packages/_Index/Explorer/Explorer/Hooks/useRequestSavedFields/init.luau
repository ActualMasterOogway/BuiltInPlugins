local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Fields.AllFields);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Components.Contexts.SettingsContext);
return function(v5) --[[ Line: 8 ]] --[[ Name: useRequestSavedFields ]]
    -- upvalues: v2 (copy), v4 (copy), v1 (copy)
    local v6 = v2.useContext(v4.Context);
    v2.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v5 (copy), v6 (copy), v1 (ref)
        if v5 == nil then
            return;
        else
            for _, v8 in v6.rememberedFields do
                local v9 = v1[v8.fieldKey];
                assert(v9 ~= nil, "Couldn't find remembered field");
                v5.addField(v9, v8.parameters);
            end;
            return;
        end;
    end, {
        v5 and v5.addField
    });
end;