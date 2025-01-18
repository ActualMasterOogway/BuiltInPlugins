local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_createElement_0 = v1.createElement;
local v3 = {
    registerSelectAll = function() --[[ Line: 12 ]] --[[ Name: registerSelectAll ]]
        return function() --[[ Line: 13 ]]

        end;
    end
};
local v4 = v1.createContext(v3);
return {
    Context = v4, 
    Provider = function(v5) --[[ Line: 19 ]] --[[ Name: Provider ]]
        -- upvalues: l_createElement_0 (copy), v4 (copy)
        local v6 = {
            registerSelectAll = v5.registerSelectAll
        };
        return l_createElement_0(v4.Provider, {
            value = v6
        }, v5.children);
    end
};