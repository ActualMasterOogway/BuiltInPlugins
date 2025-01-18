local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_filter_0 = v1.filter;
local l_map_0 = v1.map;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v5 = require(l_Parent_0.Src.Thunks.Asset.LoadFontFamilyInfo);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function() --[[ Line: 19 ]] --[[ Name: LoadBuiltinFonts ]]
    -- upvalues: l_filter_0 (copy), l_map_0 (copy), v5 (copy)
    return function(v7, _) --[[ Line: 20 ]]
        -- upvalues: l_filter_0 (ref), l_map_0 (ref), v5 (ref)
        local v10 = l_filter_0(Enum.Font:GetEnumItems(), function(v9) --[[ Line: 21 ]]
            return v9 ~= Enum.Font.Unknown;
        end);
        local v12 = l_map_0(v10, function(v11) --[[ Line: 25 ]]
            return Font.fromEnum(v11).Family;
        end);
        v7:dispatch(v5(v12));
    end;
end;