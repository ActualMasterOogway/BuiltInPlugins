local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.BaseUrl);
return function(_) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    return function(v3, v4, v5, v6, v7) --[[ Line: 10 ]]
        -- upvalues: v1 (ref)
        assert(type(v3) == "number", "Expected catalogContext to be a number");
        assert(type(v4) == "number", "Expected sortType to be a number");
        assert(type(v5) == "number", "Expected sortAggregation to be a number");
        assert(type(v6) == "number", "Expected sortCurrency to be a number");
        assert(type(v7) == "number", "Expected category to be a number");
        local v8 = v1.makeQueryString({
            CatalogContext = v3, 
            SortType = v4, 
            SortAggregation = v5, 
            SortCurrency = v6, 
            Category = v7
        });
        return string.format("%sdevelop/library?%s", v1.BASE_URL, v8);
    end;
end;