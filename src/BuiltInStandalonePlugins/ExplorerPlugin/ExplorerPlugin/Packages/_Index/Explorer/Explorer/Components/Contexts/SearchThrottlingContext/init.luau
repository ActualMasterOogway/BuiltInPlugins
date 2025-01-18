local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_createElement_0 = v1.createElement;
local v3 = {
    waitForNextSearchAsync = function() --[[ Line: 11 ]] --[[ Name: waitForNextSearchAsync ]]
        task.wait();
    end
};
local v4 = v1.createContext(v3);
return {
    Context = v4, 
    Provider = function(v5) --[[ Line: 21 ]] --[[ Name: Provider ]]
        -- upvalues: l_createElement_0 (copy), v4 (copy)
        local v6 = {
            waitForNextSearchAsync = v5.waitForNextSearchAsync
        };
        return l_createElement_0(v4.Provider, {
            value = v6
        }, v5.children);
    end
};