local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_TreeTable_0 = require(l_Parent_0.Packages.Framework).UI.TreeTable;
local v2 = require(l_Parent_0.Packages.Dash);
local l_collectArray_0 = v2.collectArray;
local l_keys_0 = v2.keys;
local l_join_0 = v2.join;
local v6 = require(l_Parent_0.Src.Util.MenuHelpers);
local v7 = require(l_Parent_0.Src.Util.StyleSchema);
local v8 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local _ = require(l_Parent_0.Src.Types);
local v12 = {
    Columns = {
        {
            Name = "Name", 
            Key = "Name", 
            Width = UDim.new(0.5, 0)
        }, 
        {
            Name = "Value", 
            Key = "Value", 
            Width = UDim.new(0.5, 0)
        }
    }, 
    NAME_COLUMN_INDEX = 1, 
    VALUE_COLUMN_INDEX = 2, 
    getItemChildren = function(v10) --[[ Line: 55 ]] --[[ Name: getItemChildren ]]
        return v10.Children or {};
    end, 
    getItemId = function(v11) --[[ Line: 59 ]] --[[ Name: getItemId ]]
        return v11.Id;
    end
};
local v13 = l_TreeTable_0.EditTree.new({
    getChildren = v12.getItemChildren, 
    getId = v12.getItemId
});
v12.EditTree = v13;
v12._buildEmptyRow = function(v14, v15) --[[ Line: 69 ]] --[[ Name: _buildEmptyRow ]]
    -- upvalues: v8 (copy), l_join_0 (copy), v7 (copy), v6 (copy)
    return {
        Id = v8.createItemId(v14, "@Empty"), 
        Name = {
            Schema = l_join_0(v7.TextSchema, {
                PlaceholderText = "Add a Token..."
            }), 
            Value = ""
        }, 
        Value = {
            Actions = v6.MoreAction, 
            Schema = v7.SelectTokenSchema, 
            Value = v15 or ""
        }, 
        Children = {}
    };
end;
v12._buildTokens = function(v16) --[[ Line: 86 ]] --[[ Name: _buildTokens ]]
    -- upvalues: l_keys_0 (copy), l_collectArray_0 (copy), v7 (copy), l_join_0 (copy), v8 (copy), v6 (copy)
    local l_v16_Attributes_0 = v16:GetAttributes();
    local v18 = l_keys_0(l_v16_Attributes_0);
    table.sort(v18);
    return (l_collectArray_0(v18, function(_, v20) --[[ Line: 90 ]]
        -- upvalues: l_v16_Attributes_0 (copy), v7 (ref), l_join_0 (ref), v16 (copy), v8 (ref), v6 (ref)
        if v20 == "StyleCategory" then
            return nil;
        else
            local v21 = l_v16_Attributes_0[v20];
            local v22 = v7.getAttributeSchema(v21);
            if typeof(v21) == "string" and v21:sub(1, 1) == "$" then
                v22 = l_join_0(v7.TokenReferenceSchema, {
                    Instance = v16, 
                    ExpectedTypes = nil, 
                    HideSelfTokens = true
                });
            end;
            if not v22.Validate(v21) then
                return nil;
            else
                local v23 = v8.createItemId(v16, v20);
                return {
                    Id = v23, 
                    Name = {
                        Schema = v7.TextSchema, 
                        Value = v20
                    }, 
                    Value = {
                        Actions = v6.MoreAction, 
                        Schema = v22, 
                        Value = v21 or ""
                    }, 
                    Children = if v22.GetChildren then v22.GetChildren(v21, v23) else nil
                };
            end;
        end;
    end));
end;
v12.buildTree = function(v24, v25, v26, v27) --[[ Line: 126 ]] --[[ Name: buildTree ]]
    -- upvalues: v7 (copy), v8 (copy), v6 (copy), v12 (copy), v13 (copy)
    local v28 = if v25 ~= nil then v7.ThemeSchema else v7.SelectorSchema;
    local v29 = {
        Id = v8.createItemId(v24), 
        Name = {
            Actions = if v25 ~= nil then nil else v6.MoreAction, 
            FullSpan = true, 
            OnClick = v26, 
            Schema = v28, 
            Selected = v25, 
            Value = if v28 == v7.ThemeSchema then v24 else v24.Name
        }, 
        Children = if v24 then v12._buildTokens(v24) else {}
    };
    table.insert(v29.Children, v12._buildEmptyRow(v24, v27));
    return v13:updatePaths({
        v29
    });
end;
return v12;