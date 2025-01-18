local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ItemState);
local v5 = require(l_script_FirstAncestor_0.Src.Components.CharacterConversion.CharacterList);
local v6 = require(l_script_FirstAncestor_0.Src.Util.sanitizeString);
local l_ContextServices_0 = v1.ContextServices;
local v8 = v2.PureComponent:extend("ModelConversionMainView");
v8.getChildItems = function(_, v10) --[[ Line: 16 ]] --[[ Name: getChildItems ]]
    -- upvalues: v6 (copy)
    local v11 = {};
    for _, v13 in v10 do
        table.insert(v11, {
            key = v13.key, 
            text = v6(v13.fullName), 
            characterInfo = v13
        });
    end;
    return v11;
end;
v8.getItems = function(v14) --[[ Line: 31 ]] --[[ Name: getItems ]]
    -- upvalues: v4 (copy)
    local l_props_0 = v14.props;
    local l_Localization_0 = l_props_0.Localization;
    local v17 = {};
    table.insert(v17, {
        key = v4.InProgress, 
        text = l_Localization_0:getText("CharacterConversion", "Issues"), 
        children = v14:getChildItems(l_props_0.characters)
    });
    table.insert(v17, {
        key = v4.Completed, 
        text = l_Localization_0:getText("CharacterConversion", "Converted"), 
        children = v14:getChildItems(l_props_0.convertedCharacters)
    });
    return v17;
end;
v8.render = function(v18) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy)
    local l_props_1 = v18.props;
    local l_Size_0 = l_props_1.Size;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local v22 = v18:getItems();
    return v2.createElement(v5, {
        OnResetPlugin = l_props_1.OnResetPlugin, 
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Items = v22
    });
end;
v8 = l_ContextServices_0.withContext({
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v8);
return v3.connect(function(v23, _) --[[ Line: 74 ]] --[[ Name: mapStateToProps ]]
    return {
        characters = v23.CharacterConversion.characters, 
        convertedCharacters = v23.CharacterConversion.convertedCharacters
    };
end)(v8);