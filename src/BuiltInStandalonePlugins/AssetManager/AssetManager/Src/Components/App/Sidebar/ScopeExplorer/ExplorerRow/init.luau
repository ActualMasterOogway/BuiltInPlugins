local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useExplorerInfo);
local v11 = require(l_script_FirstAncestor_0.Src.Types);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local function _(v13) --[[ Line: 33 ]] --[[ Name: getRowIcon ]]
    -- upvalues: v11 (copy)
    if v13.Scope == v11.Scope.Group then
        return "GroupDefaultIcon";
    elseif v13.Scope == v11.Scope.User then
        return "UserDefaultIcon";
    elseif v13.Scope == v11.Scope.Universe then
        return "UniverseDefaultIcon";
    else
        return "PlaceholderIcon";
    end;
end;
return function(v15) --[[ Line: 45 ]] --[[ Name: ExplorerRow ]]
    -- upvalues: l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), v9 (copy), v8 (copy), v11 (copy), v10 (copy), v1 (copy), l_Pane_0 (copy), l_Image_0 (copy), l_TextLabel_0 (copy)
    local v16 = l_Localization_0:use();
    local v17 = l_LayoutOrderIterator_0.new();
    local v18 = v9.use();
    local v19 = v8.use();
    local l_Item_0 = v15.Item;
    local v21 = l_Item_0.Scope == v11.Scope.Group and "GroupDefaultIcon" or l_Item_0.Scope == v11.Scope.User and "UserDefaultIcon" or l_Item_0.Scope == v11.Scope.Universe and "UniverseDefaultIcon" or "PlaceholderIcon";
    local v22 = v10(v18, v19).Selection.Id == v15.Item.Id and "Selected" or "";
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v15.Index, 
        Position = v15.Position, 
        OnPress = function() --[[ Line: 58 ]] --[[ Name: OnPress ]]
            -- upvalues: v19 (copy), v15 (copy)
            v19:setSelection(v15.Item);
        end, 
        OnRightClick = function() --[[ Line: 61 ]] --[[ Name: OnRightClick ]]
            -- upvalues: v19 (copy), v15 (copy), v16 (copy)
            v19:handleRowRightClick(v15.Item.Id, v16);
        end, 
        [v1.Tag] = ("Element X-RowS X-Left X-Middle X-PadS %*"):format(v22)
    }, {
        Thumbnail = v1.createElement(l_Image_0, {
            LayoutOrder = v17:getNextOrder(), 
            [v1.Tag] = ("ScopeIcon %* Icon16"):format(v21)
        }), 
        Name = v1.createElement(l_TextLabel_0, {
            LayoutOrder = v17:getNextOrder(), 
            Text = v15.Item.Name, 
            [v1.Tag] = "ScopeName X-Fit Left"
        })
    });
end;