local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return {
    createFromDatum = function(v3) --[[ Line: 8 ]] --[[ Name: createFromDatum ]]
        -- upvalues: v1 (copy)
        return {
            children = v1.empty(), 
            parent = nil, 
            datum = v3
        };
    end
};