local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.Cryo);
local l_Util_0 = l_Parent_0.Util;
local v4 = require(l_Util_0.deepCopy);
local v5 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v5.withContext;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v8 = require(script.ThumbnailWidget);
local _ = require(script.types);
local v10 = v1.PureComponent:extend("MultiImagePicker");
v10.init = function(v11) --[[ Line: 79 ]] --[[ Name: init ]]
    v11.dispatchAction = function(v12, v13) --[[ Line: 80 ]]
        -- upvalues: v11 (copy)
        if v12 == "AddNew" then
            v11:addNew();
            return;
        elseif v12 == "Delete" then
            v11:deleteThumbnail(v13.thumbnailId);
            return;
        elseif v12 == "MoveTo" then
            v11:moveToIndex(v13.thumbnailId, v13.index);
            return;
        else
            if v12 == "UpdateAltTexts" then
                v11:updateAltTexts(v13);
            end;
            return;
        end;
    end;
end;
v10.addNew = function(v14) --[[ Line: 93 ]] --[[ Name: addNew ]]
    v14.props.AddThumbnail();
end;
v10.deleteThumbnail = function(v15, v16) --[[ Line: 99 ]] --[[ Name: deleteThumbnail ]]
    -- upvalues: v2 (copy)
    local l_props_0 = v15.props;
    local v18 = v2.List.removeValue(l_props_0.Order, v16);
    local v19 = v2.Dictionary.join(l_props_0.Thumbnails, {
        [v16] = v2.None
    });
    if l_props_0.DeleteThumbnail then
        l_props_0.DeleteThumbnail(v18, v19);
        return;
    else
        l_props_0.ThumbnailOrderChanged(v18);
        l_props_0.ThumbnailsChanged(v19);
        return;
    end;
end;
v10.updateAltTexts = function(v20, v21) --[[ Line: 117 ]] --[[ Name: updateAltTexts ]]
    -- upvalues: v4 (copy)
    local l_props_1 = v20.props;
    local v23 = v4(l_props_1.Thumbnails);
    for v24, v25 in pairs(v21) do
        v23[v24].altText = v25;
    end;
    l_props_1.ThumbnailsChanged(v23);
end;
v10.moveToIndex = function(v26, v27, v28) --[[ Line: 129 ]] --[[ Name: moveToIndex ]]
    -- upvalues: v2 (copy)
    local l_props_2 = v26.props;
    local v30 = v2.List.removeValue(l_props_2.Order, v27);
    table.insert(v30, v28, v27);
    l_props_2.ThumbnailOrderChanged(v30);
end;
v10.render = function(v31) --[[ Line: 137 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v8 (copy), l_join_0 (copy)
    local l_props_3 = v31.props;
    return v1.createElement(v8, l_join_0(l_props_3, {
        Theme = l_props_3.Stylizer, 
        ThumbnailAction = v31.dispatchAction
    }));
end;
return (l_withContext_0({
    Stylizer = v5.Stylizer
})(v10));