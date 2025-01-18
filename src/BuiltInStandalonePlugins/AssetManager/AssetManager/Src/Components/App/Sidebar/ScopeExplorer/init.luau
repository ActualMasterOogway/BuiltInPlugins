local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TreeView_0 = l_UI_0.TreeView;
local v7 = require(script.ExplorerRow);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useExplorerInfo);
local v11 = require(script.styles);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v13) --[[ Line: 32 ]] --[[ Name: ScopeExplorer ]]
    -- upvalues: l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), v9 (copy), v8 (copy), v10 (copy), v1 (copy), l_Pane_0 (copy), l_TreeView_0 (copy), v7 (copy), v11 (copy)
    local v14 = l_Localization_0:use();
    local v15 = l_LayoutOrderIterator_0.new();
    local v16 = v9.use();
    local v17 = v8.use();
    local v18 = v10(v16, v17);
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v13.LayoutOrder, 
        OnRightClick = function() --[[ Line: 42 ]] --[[ Name: OnRightClick ]]
            -- upvalues: v17 (copy), v14 (copy)
            v17:handleRightClick(v14);
        end, 
        [v1.Tag] = "Explorer X-Column"
    }, {
        TreeView = v1.createElement(l_TreeView_0, {
            LayoutOrder = v15:getNextOrder(), 
            RootItems = v18.Items, 
            Expansion = v18.Expansion, 
            OnExpansionChange = function(_) --[[ Line: 51 ]] --[[ Name: OnExpansionChange ]]

            end, 
            RowComponent = v7, 
            RowHeight = v11:GetAttribute("RowHeight"), 
            [v1.Tag] = ""
        })
    });
end;