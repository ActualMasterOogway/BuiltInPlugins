local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_UI_0 = v2.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local function v11(v7) --[[ Line: 27 ]] --[[ Name: createButtons ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy), l_joinTags_0 (copy)
    local v8 = {};
    for v9, v10 in v7 do
        v8[v9] = v1.createElement(l_IconButton_0, {
            LayoutOrder = v9, 
            Cursor = "PointingHand", 
            OnClick = v10.OnClick, 
            Text = v10.Text, 
            Icon = v10.Icon, 
            [v1.Tag] = l_joinTags_0("X-Fit", v10.Tags)
        });
    end;
    return v8;
end;
return function(v12) --[[ Line: 43 ]] --[[ Name: Toolbar ]]
    -- upvalues: v11 (copy), v1 (copy), l_Pane_0 (copy)
    local v13 = v11(v12.Buttons);
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v12.LayoutOrder, 
        [v1.Tag] = "Toolbar X-FitY X-AnchorCenter X-Center"
    }, v13);
end;