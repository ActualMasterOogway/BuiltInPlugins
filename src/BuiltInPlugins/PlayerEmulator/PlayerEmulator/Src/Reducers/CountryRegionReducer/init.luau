local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({
    userCountryRegionCode = "", 
    countryRegionTable = {}, 
    countryRegionList = {}
}, {
    LoadCountryRegion = function(v2, v3) --[[ Line: 10 ]] --[[ Name: LoadCountryRegion ]]
        -- upvalues: v1 (copy)
        local l_data_0 = v3.data;
        local v5 = {};
        local v6 = {};
        for _, v8 in pairs(l_data_0) do
            local l_code_0 = v8.code;
            local l_displayName_0 = v8.displayName;
            local v11 = string.format("%s (%s)", l_displayName_0, l_code_0);
            v5[l_code_0] = {
                code = l_code_0, 
                name = l_displayName_0, 
                displayText = v11
            };
            table.insert(v6, {
                code = l_code_0, 
                name = l_displayName_0, 
                displayText = v11
            });
        end;
        return v1.Dictionary.join(v2, {
            countryRegionTable = v5, 
            countryRegionList = v6
        });
    end, 
    OnEmulatedCountryRegionChanged = function(v12, v13) --[[ Line: 39 ]] --[[ Name: OnEmulatedCountryRegionChanged ]]
        -- upvalues: v1 (copy)
        local l_countryRegionCode_0 = v13.countryRegionCode;
        return v1.Dictionary.join(v12, {
            userCountryRegionCode = l_countryRegionCode_0
        });
    end
});