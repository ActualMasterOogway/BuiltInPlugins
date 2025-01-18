local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Pane_0 = v2.UI.Pane;
local v4 = require(script.ScopeExplorer);
local v5 = require(script.SearchOptions);
local v6 = require(script.SearchPanel);
local v7 = require(script.ScopeOptions);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useExplorerInfo);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useSearchInfo);
local v12 = require(l_script_FirstAncestor_0.Src.Controllers.SearchController);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v14) --[[ Line: 33 ]] --[[ Name: Sidebar ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v9 (copy), v8 (copy), v12 (copy), v10 (copy), v11 (copy), v1 (copy), v7 (copy), v6 (copy), v5 (copy), v4 (copy), l_Pane_0 (copy)
    local v15 = l_LayoutOrderIterator_0.new();
    local v16 = v9.use();
    local v17 = v8.use();
    local v18 = v12.use();
    local v19 = v10(v16, v17);
    local v20 = v11(v18);
    local v21 = {};
    if v19.ShowScopeOptions then
        v21.ScopeOptions = v1.createElement(v7, {
            LayoutOrder = v15:getNextOrder()
        });
    else
        v21.SearchPanel = v1.createElement(v6, {
            LayoutOrder = v15:getNextOrder()
        });
        v21.SidebarContent = if v20.ShowSearchOptions then v1.createElement(v5, {
            LayoutOrder = v15:getNextOrder()
        }) else v1.createElement(v4, {
            LayoutOrder = v15:getNextOrder()
        });
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v14.LayoutOrder, 
        [v1.Tag] = "Main X-Top X-Column"
    }, v21);
end;