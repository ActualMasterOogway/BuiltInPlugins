local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_TreeTable_0 = require(l_Parent_0.Packages.Framework).UI.TreeTable;
local v2 = require(l_Parent_0.Packages.Dash);
local l_append_0 = v2.append;
local l_collectArray_0 = v2.collectArray;
local l_join_0 = v2.join;
local l_keys_0 = v2.keys;
local l_map_0 = v2.map;
local v8 = require(l_Parent_0.Src.Util.MenuHelpers);
local v9 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v10 = require(l_Parent_0.Src.Util.StyleSchema);
local v11 = require(l_Parent_0.Src.Util.Styling);
local v12 = require(l_Parent_0.Src.Util.TokenHelpers);
local v13 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local _ = require(l_Parent_0.Src.Types);
local v17 = {
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
    getItemChildren = function(v15) --[[ Line: 62 ]] --[[ Name: getItemChildren ]]
        return v15.Children or {};
    end, 
    getItemId = function(v16) --[[ Line: 66 ]] --[[ Name: getItemId ]]
        return v16.Id;
    end
};
local v18 = l_TreeTable_0.EditTree.new({
    getChildren = v17.getItemChildren, 
    getId = v17.getItemId
});
v17.EditTree = v18;
v17._buildStyleRule = function(v19) --[[ Line: 76 ]] --[[ Name: _buildStyleRule ]]
    -- upvalues: v13 (copy), l_map_0 (copy), v17 (copy), v8 (copy), v10 (copy), l_append_0 (copy)
    local v20 = v13.createItemId(v19);
    local v22 = l_map_0(v19:GetStyleRules(), function(v21) --[[ Line: 79 ]]
        -- upvalues: v17 (ref)
        return v17._buildStyleRule(v21);
    end);
    return {
        Id = v20, 
        Name = {
            ErrorMessage = v19.SelectorError, 
            FullSpan = true, 
            Actions = v8.FullSpanMoreAction, 
            Schema = v10.SelectorSchema, 
            Value = v19.Selector
        }, 
        Instance = v19, 
        Children = l_append_0(v17._buildProperties(v20, v19), v22)
    };
end;
v17._buildEmptyRow = function(v23, v24) --[[ Line: 97 ]] --[[ Name: _buildEmptyRow ]]
    -- upvalues: v13 (copy), l_join_0 (copy), v10 (copy), v8 (copy)
    return {
        Id = v13.createItemId(v23, "@Empty"), 
        Name = {
            Schema = l_join_0(v10.PropertyNameSchema, {
                StyleRuleInfo = v24
            }), 
            Value = ""
        }, 
        Value = {
            Actions = v8.MoreAction, 
            Schema = {
                Type = "Empty"
            }, 
            Value = ""
        }, 
        Children = {}
    };
end;
v17._buildProperties = function(v25, v26) --[[ Line: 117 ]] --[[ Name: _buildProperties ]]
    -- upvalues: v9 (copy), l_keys_0 (copy), v11 (copy), l_collectArray_0 (copy), v12 (copy), v10 (copy), l_join_0 (copy), v13 (copy), v8 (copy), v17 (copy)
    local v27 = v9.findFirstClassSelector(v26);
    local l_v26_Properties_0 = v26:GetProperties();
    local v29 = l_keys_0(l_v26_Properties_0);
    local v30 = v11.getStyleInfo(v26);
    table.sort(v29);
    local v38 = l_collectArray_0(v29, function(_, v32) --[[ Line: 124 ]]
        -- upvalues: l_v26_Properties_0 (copy), v12 (ref), v27 (copy), v10 (ref), l_join_0 (ref), v26 (copy), v13 (ref), v30 (copy), v8 (ref)
        local v33 = l_v26_Properties_0[v32];
        local v34 = nil;
        local v35 = v12.parseAttributeName(v33) ~= nil;
        if v27 and v27 ~= "" then
            v34 = v10.getPropertySchema(v32, v27);
        else
            if v33 ~= nil and not v35 then
                v34 = v10.PropertySchemas[typeof(v33)];
            end;
            if not v34 then
                v34 = v10.getPropertySchema(v32, "");
            end;
        end;
        if not v34 then
            if v32 == "" then
                return nil;
            else
                v34 = v10.TextSchema;
            end;
        end;
        if v35 then
            local v36 = v10.getPossiblePropertyTypes(v32);
            v34 = l_join_0(v10.TokenReferenceSchema, {
                Instance = v26, 
                ExpectedTypes = v36
            });
        end;
        local v37 = v13.createItemId(v26, v32);
        return {
            Id = v37, 
            Name = {
                Schema = l_join_0(v10.PropertyNameSchema, {
                    StyleRuleInfo = v30
                }), 
                Value = v32
            }, 
            Value = {
                Actions = v8.MoreAction, 
                Schema = v34, 
                Value = if v34.Validate(v33) then v33 else v34.GetDefaultValue()
            }, 
            Children = if v34.Validate(v33) and v34.GetChildren then v34.GetChildren(v33, v37) else {}
        };
    end);
    table.insert(v38, v17._buildEmptyRow(v25, v30));
    return v38;
end;
v17.buildItems = function(v39) --[[ Line: 178 ]] --[[ Name: buildItems ]]
    -- upvalues: v17 (copy), v18 (copy)
    local v40 = {
        (v17._buildStyleRule(v39))
    };
    return v18:updatePaths(v40);
end;
v17.expandNewRows = function(v41, v42) --[[ Line: 185 ]] --[[ Name: expandNewRows ]]
    -- upvalues: v17 (copy)
    if not v41 or #v41 == 0 then
        return;
    else
        for _, v44 in ipairs(v41) do
            if v42[v44.Id] ~= false and v44.Name.FullSpan then
                v42[v44.Id] = true;
            end;
            v17.expandNewRows(v44.Children, v42);
        end;
        return;
    end;
end;
return v17;