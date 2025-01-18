local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
return {
    resolveDefaultProps = function(v2, v3) --[[ Line: 18 ]] --[[ Name: resolveDefaultProps ]]
        -- upvalues: l_Object_0 (copy)
        if typeof(v2) == "table" and v2 and v2.defaultProps then
            local v4 = l_Object_0.assign({}, v3);
            local l_defaultProps_0 = v2.defaultProps;
            for v6, _ in pairs(l_defaultProps_0) do
                if v4[v6] == nil then
                    v4[v6] = l_defaultProps_0[v6];
                end;
            end;
            return v4;
        else
            return v3;
        end;
    end
};