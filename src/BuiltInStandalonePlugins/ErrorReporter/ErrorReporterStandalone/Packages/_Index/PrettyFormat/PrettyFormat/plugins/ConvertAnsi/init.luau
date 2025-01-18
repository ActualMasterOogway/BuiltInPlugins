local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_1.ChalkLua);
local v4 = string.char(27) .. "%[%d+;?5?;?%d*m";
local v5 = {
    [v3.red.close] = "</>", 
    [v3.green.close] = "</>", 
    [v3.cyan.close] = "</>", 
    [v3.gray.close] = "</>", 
    [v3.white.close] = "</>", 
    [v3.yellow.close] = "</>", 
    [v3.bgRed.close] = "</>", 
    [v3.bgGreen.close] = "</>", 
    [v3.bgYellow.close] = "</>", 
    [v3.inverse.close] = "</>", 
    [v3.dim.close] = "</>", 
    [v3.bold.close] = "</>", 
    [v3.reset.open] = "</>", 
    [v3.reset.close] = "</>", 
    [v3.red.open] = "<red>", 
    [v3.green.open] = "<green>", 
    [v3.cyan.open] = "<cyan>", 
    [v3.gray.open] = "<gray>", 
    [v3.white.open] = "<white>", 
    [v3.yellow.open] = "<yellow>", 
    [v3.bgRed.open] = "<bgRed>", 
    [v3.bgGreen.open] = "<bgGreen>", 
    [v3.bgYellow.open] = "<bgYellow>", 
    [v3.inverse.open] = "<inverse>", 
    [v3.dim.open] = "<dim>", 
    [v3.bold.open] = "<bold>"
};
local function _(v6) --[[ Line: 52 ]] --[[ Name: toHumanReadableAnsi ]]
    -- upvalues: v4 (copy), v5 (copy)
    return v6:gsub(v4, function(v7) --[[ Line: 53 ]]
        -- upvalues: v5 (ref)
        if v5[v7] then
            return v5[v7];
        else
            return "";
        end;
    end);
end;
return {
    test = function(v9) --[[ Line: 62 ]] --[[ Name: test ]]
        -- upvalues: v4 (copy)
        local v10 = false;
        if typeof(v9) == "string" then
            v10 = v9:match(v4);
        end;
        return v10;
    end, 
    serialize = function(v11, v12, v13, v14, v15, v16) --[[ Line: 66 ]] --[[ Name: serialize ]]
        -- upvalues: v4 (copy), v5 (copy)
        return v16(v11:gsub(v4, function(v17) --[[ Line: 53 ]]
            -- upvalues: v5 (ref)
            if v5[v17] then
                return v5[v17];
            else
                return "";
            end;
        end), v12, v13, v14, v15);
    end, 
    ansiRegex = v4
};