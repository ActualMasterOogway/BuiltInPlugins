local l_Parent_0 = script.Parent.Parent;
local l_ansiRegex_0 = require(l_Parent_0.PrettyFormat).plugins.ConvertAnsi.ansiRegex;
local v2 = require(l_Parent_0.ChalkLua);
return {
    serialize = function(v3) --[[ Line: 17 ]] --[[ Name: serialize ]]
        -- upvalues: v2 (copy), l_ansiRegex_0 (copy)
        local v4 = {
            [v2.inverse.open] = "<i>", 
            [v2.inverse.close] = "</i>", 
            [v2.bold.open] = "<b>", 
            [v2.dim.open] = "<d>", 
            [v2.green.open] = "<g>", 
            [v2.red.open] = "<r>", 
            [v2.yellow.open] = "<y>", 
            [v2.bgYellow.open] = "<Y>", 
            [v2.bold.close] = "</>", 
            [v2.dim.close] = "</>", 
            [v2.green.close] = "</>", 
            [v2.red.close] = "</>", 
            [v2.yellow.close] = "</>", 
            [v2.bgYellow.close] = "</>"
        };
        return v3:gsub(l_ansiRegex_0, function(v5) --[[ Line: 36 ]]
            -- upvalues: v4 (copy)
            if v4[v5] then
                return v4[v5];
            else
                return v5;
            end;
        end);
    end, 
    test = function(v6) --[[ Line: 45 ]] --[[ Name: test ]]
        return typeof(v6) == "string";
    end
};