local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_Localization_0 = v2.ContextServices.Localization;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v10 = require(script.HeaderOptions);
local v11 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v12 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v13 = require(l_script_FirstAncestor_0.Src.Controllers.SearchController);
local v14 = require(l_script_FirstAncestor_0.Src.Networking);
local l_useState_0 = v1.useState;
local v16 = require(l_script_FirstAncestor_0.Src.Hooks.useExplorerInfo);
local v17 = require(l_script_FirstAncestor_0.Src.Hooks.useSearchInfo);
local function v19(v18) --[[ Line: 43 ]] --[[ Name: ScopeTitle ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_joinTags_0 (copy), l_Image_0 (copy), l_TextLabel_0 (copy)
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v18.LayoutOrder, 
        [v1.Tag] = l_joinTags_0("HeaderTitle X-Row X-Pad X-Left X-Middle", v18[v1.Tag])
    }, {
        ScopeThumbnail = v1.createElement(l_Image_0, {
            LayoutOrder = 1, 
            Image = v18.Thumbnail, 
            [v1.Tag] = "ScopeThumbnail X-Pad"
        }), 
        ScopeTitle = v1.createElement(l_TextLabel_0, {
            LayoutOrder = 2, 
            Text = v18.Text, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            [v1.Tag] = "Title X-Fit X-Pad"
        })
    });
end;
return function(v20) --[[ Line: 62 ]] --[[ Name: HeaderBar ]]
    -- upvalues: l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), v14 (copy), v12 (copy), v11 (copy), v13 (copy), l_useState_0 (copy), v16 (copy), v17 (copy), v1 (copy), l_Pane_0 (copy), v19 (copy), v10 (copy)
    local v21 = l_Localization_0.use();
    local v22 = l_LayoutOrderIterator_0.new();
    local v23 = v14.use();
    local v24 = v12.use();
    local v25 = v11.use();
    local v26 = v13.use();
    local v27, v28 = l_useState_0("");
    local l_Selection_0 = v16(v24, v25).Selection;
    local v30 = v17(v26);
    local function v32(v31) --[[ Line: 76 ]] --[[ Name: setThumbnailIfChanged ]]
        -- upvalues: v27 (copy), v28 (copy)
        if v27 ~= v31 then
            v28(v31);
        end;
    end;
    if v27 == "" or v27 ~= v23:getThumbnailUriForScope(l_Selection_0) then
        v23:getThumbnailForScopeAsync(l_Selection_0, v32);
    end;
    local v33 = if v30.ShowSearchOptions then v21:getText("SearchOptions", "SearchResults") else l_Selection_0.Name;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v20.LayoutOrder, 
        [v1.Tag] = "TopBar HeaderBar X-Left X-Row X-Stroke"
    }, {
        ScopeTitleContainer = v1.createElement(v19, {
            LayoutOrder = v22:getNextOrder(), 
            Text = v33, 
            Thumbnail = if v27 ~= "" then v27 else nil, 
            [v1.Tag] = ("%*"):format(v30.ShowSearchOptions and "SearchResults" or l_Selection_0.Scope)
        }), 
        Options = v1.createElement(v10, {
            LayoutOrder = v22:getNextOrder()
        })
    });
end;