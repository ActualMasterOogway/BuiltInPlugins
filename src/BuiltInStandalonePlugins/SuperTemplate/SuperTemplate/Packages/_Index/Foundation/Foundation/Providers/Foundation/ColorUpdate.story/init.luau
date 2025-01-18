local l_Parent_0 = script:FindFirstAncestor("Providers").Parent;
local v1 = require(l_Parent_0.Providers.Foundation.ColorUpdateStory);
return {
    story = function(v2) --[[ Line: 6 ]] --[[ Name: story ]]
        -- upvalues: v1 (copy)
        for v3, v4 in pairs(v2.controls) do
            v1[v3] = v4;
        end;
    end, 
    controls = v1
};