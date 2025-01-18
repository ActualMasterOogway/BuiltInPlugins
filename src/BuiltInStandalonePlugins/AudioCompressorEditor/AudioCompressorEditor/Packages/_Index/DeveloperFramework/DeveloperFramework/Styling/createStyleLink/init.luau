local _ = require(script.Parent.types);
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: createStyleLink ]]
    local l_StyleLink_0 = Instance.new("StyleLink");
    l_StyleLink_0.Name = v2.Name;
    l_StyleLink_0.StyleSheet = v2;
    l_StyleLink_0.Parent = v1;
    return l_StyleLink_0;
end;