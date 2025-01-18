local v0 = require(script.Parent.TestPlan);
return {
    createPlan = function(v1, v2, v3) --[[ Line: 26 ]] --[[ Name: createPlan ]]
        -- upvalues: v0 (copy)
        local v4 = v0.new(v2, v3);
        table.sort(v1, function(v5, v6) --[[ Line: 29 ]]
            return v5.pathStringForSorting < v6.pathStringForSorting;
        end);
        for _, v8 in ipairs(v1) do
            v4:addRoot(v8.path, v8.method);
        end;
        return v4;
    end
};