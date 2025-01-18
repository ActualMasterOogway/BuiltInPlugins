local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_List_0 = l_UI_0.List;
local v6 = require(script.HeaderRow);
local v7 = require(script.ItemRow);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useItems);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(script.styles);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v13) --[[ Line: 30 ]] --[[ Name: ContentList ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v8 (copy), v9 (copy), v1 (copy), l_Pane_0 (copy), v6 (copy), l_List_0 (copy), v7 (copy), v11 (copy)
    local v14 = l_LayoutOrderIterator_0.new();
    local v15 = v8.use();
    local v16 = v9(v15);
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v13.LayoutOrder, 
        [v1.Tag] = ("MainContents ContentList X-Top X-Column X-Center %*"):format(v13[v1.Tag])
    }, {
        HeaderRow = v1.createElement(v6, {
            LayoutOrder = v14:getNextOrder()
        }), 
        ListContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = v14:getNextOrder(), 
            [v1.Tag] = "ItemList"
        }, {
            List = v1.createElement(l_List_0, {
                LayoutOrder = v14:getNextOrder(), 
                GetRowProps = function(v17, v18, v19, v20) --[[ Line: 50 ]] --[[ Name: GetRowProps ]]
                    return {
                        Key = v18, 
                        Position = v19, 
                        AssetInfo = v17, 
                        Size = v20
                    };
                end, 
                Rows = v16, 
                RowComponent = v7, 
                RowHeight = v11:GetAttribute("RowHeight"), 
                ScrollingDirection = Enum.ScrollingDirection.XY
            })
        })
    });
end;