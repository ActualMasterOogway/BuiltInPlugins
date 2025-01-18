local l_StudioService_0 = game:GetService("StudioService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Util.createUnimplemented);
local l_createElement_0 = v2.createElement;
local v5 = {
    getClassIcon = v3("getClassIcon"), 
    default = true
};
local v6 = v2.createContext(v5);
local function v13(v7) --[[ Line: 30 ]] --[[ Name: Provider ]]
    -- upvalues: v2 (copy), l_createElement_0 (copy), v6 (copy)
    local v8 = v2.useRef({});
    local v12 = {
        getClassIcon = v2.useCallback(function(v9) --[[ Line: 35 ]]
            -- upvalues: v8 (copy), v7 (copy)
            local v10 = v8.current[v9];
            if v10 ~= nil then
                return v10;
            else
                local v11 = v7.getClassIcon(v9);
                v8.current[v9] = v11;
                return v11;
            end;
        end, {}), 
        default = false
    };
    return l_createElement_0(v6.Provider, {
        value = v12
    }, v7.children);
end;
return {
    Context = v6, 
    Provider = v13, 
    StandardProvider = function(v14) --[[ Line: 56 ]] --[[ Name: StandardProvider ]]
        -- upvalues: l_createElement_0 (copy), v13 (copy), l_StudioService_0 (copy)
        return l_createElement_0(v13, {
            getClassIcon = function(v15) --[[ Line: 60 ]] --[[ Name: getClassIcon ]]
                -- upvalues: l_StudioService_0 (ref)
                return l_StudioService_0:GetClassIcon(v15 == "" and "Instance" or v15);
            end
        }, v14.children);
    end
};