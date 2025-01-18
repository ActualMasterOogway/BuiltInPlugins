local v0 = require(script.Parent.Component);
local v1 = v0:extend("PureComponent");
v1.extend = v0.extend;
v1.shouldUpdate = function(v2, v3, v4) --[[ Line: 15 ]] --[[ Name: shouldUpdate ]]
    if v4 ~= v2.state then
        return true;
    elseif v3 == v2.props then
        return false;
    else
        for v5, v6 in pairs(v3) do
            if v2.props[v5] ~= v6 then
                return true;
            end;
        end;
        for v7, v8 in pairs(v2.props) do
            if v3[v7] ~= v8 then
                return true;
            end;
        end;
        return false;
    end;
end;
return v1;