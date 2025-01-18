local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_join_0 = v4.Dash.join;
local l_deepEqual_0 = v4.Util.deepEqual;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_TreeView_0 = v4.UI.TreeView;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v13 = require(l_Actions_0.SetPath);
local l_Util_0 = l_Parent_0.Src.Util;
local v15 = require(l_Util_0.getCategories);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v17 = require(l_Controllers_0.MaterialServiceController);
local v18 = v2.PureComponent:extend("SideBar");
v18.updateSelection = function(v19) --[[ Line: 49 ]] --[[ Name: updateSelection ]]
    -- upvalues: l_deepEqual_0 (copy), l_join_0 (copy)
    local l_props_0 = v19.props;
    if #l_props_0.Path ~= 0 and v19.state.lastPath ~= l_props_0.Path then
        local v21 = {};
        local function v22(v23, v24, v25) --[[ Line: 55 ]] --[[ Name: recurseCategoriesByChildren ]]
            -- upvalues: v21 (copy), l_deepEqual_0 (ref), v19 (copy), v22 (copy)
            table.insert(v21, v24);
            for _, v27 in pairs(v23) do
                if v27.path and l_deepEqual_0(v27.path, v25) then
                    v19.currentCategory = v27;
                elseif v27.children and next(v19.currentCategory) == nil then
                    v22(v27.children, v27, v25);
                end;
            end;
            if next(v19.currentCategory) == nil then
                table.remove(v21, #v21);
            end;
        end;
        v22(v19.categories, {}, l_props_0.Path);
        if next(v21) and v19.currentCategory.path and not l_deepEqual_0(v19.categories, v21) then
            local v28 = {};
            local v29 = {};
            for _, v31 in ipairs(v21) do
                v29[v31] = true;
            end;
            v28[v19.currentCategory] = true;
            if not l_deepEqual_0(v19.state.Selection, v28) then
                v19:setState(function(v32) --[[ Line: 89 ]]
                    -- upvalues: l_join_0 (ref), v29 (copy), v28 (copy)
                    return {
                        Expansion = l_join_0(v32.Expansion, v29), 
                        Selection = v28
                    };
                end);
            end;
        end;
        v19.currentCategory = {};
        v19:setState({
            lastPath = l_props_0.Path
        });
    end;
end;
v18.init = function(v33) --[[ Line: 105 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy)
    v33.currentCategory = {};
    v33.onExpansionChange = function(v34) --[[ Line: 108 ]]
        -- upvalues: v33 (copy), l_join_0 (ref)
        v33:setState(function(v35) --[[ Line: 109 ]]
            -- upvalues: l_join_0 (ref), v34 (copy)
            return {
                Expansion = l_join_0(v35.Expansion, v34)
            };
        end);
    end;
    v33.onSelectionChange = function(v36) --[[ Line: 116 ]]
        -- upvalues: v33 (copy)
        local l_props_1 = v33.props;
        for v38, _ in pairs(v36) do
            l_props_1.MaterialServiceController:setPath(v38.path);
        end;
        l_props_1.Analytics:report("clickOnCategoriesOpen");
        v33:setState({
            Selection = v36
        });
    end;
    v33.state = {
        Expansion = {}, 
        Selection = {}, 
        lastPath = {}
    };
end;
v18.didMount = function(v40) --[[ Line: 135 ]] --[[ Name: didMount ]]
    -- upvalues: v15 (copy)
    local l_props_2 = v40.props;
    local l_Localization_1 = l_props_2.Localization;
    local v43 = l_props_2.MaterialServiceController:getRootCategory();
    if not v40.categories then
        v40.categories = v15(v43, l_Localization_1);
        local v44 = v40.categories[1];
        v40:setState({
            Expansion = {
                [v44] = true
            }, 
            Selection = {
                [v44] = true
            }
        });
    end;
    v40:updateSelection();
end;
v18.didUpdate = function(v45) --[[ Line: 157 ]] --[[ Name: didUpdate ]]
    v45:updateSelection();
end;
v18.render = function(v46) --[[ Line: 161 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_TreeView_0 (copy)
    local l_props_3 = v46.props;
    local l_state_0 = v46.state;
    local l_Size_0 = l_props_3.Size;
    local l_ZIndex_0 = l_props_3.ZIndex;
    return v2.createElement(l_TreeView_0, {
        Size = l_Size_0, 
        ZIndex = l_ZIndex_0, 
        Expansion = l_state_0.Expansion, 
        Selection = l_state_0.Selection, 
        RootItems = v46.categories or {}, 
        OnExpansionChange = v46.onExpansionChange, 
        OnSelectionChange = v46.onSelectionChange
    });
end;
v18 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    MaterialServiceController = v17
})(v18);
return v3.connect(function(v51, _) --[[ Line: 185 ]]
    return {
        Path = v51.MaterialBrowserReducer.Path
    };
end, function(v53) --[[ Line: 189 ]]
    -- upvalues: v13 (copy)
    return {
        dispatchSetPath = function(v54) --[[ Line: 191 ]] --[[ Name: dispatchSetPath ]]
            -- upvalues: v53 (copy), v13 (ref)
            v53(v13(v54));
        end
    };
end)(v18);