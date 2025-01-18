local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
return function(v8) --[[ Line: 18 ]] --[[ Name: MinimalButton ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_Image_0 (copy), l_joinTags_0 (copy), l_Tooltip_0 (copy)
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v8.LayoutOrder, 
        OnClick = v8.OnClick, 
        [v1.Tag] = ("MinimalButton X-Corner %*"):format(v8[v1.Tag])
    }, {
        Icon = v1.createElement(l_Image_0, {
            [v1.Tag] = l_joinTags_0("Icon16 X-PadL X-AnchorCenter", v8[v1.Tag])
        }, {
            Tooltip = if v8.Tooltip then v1.createElement(l_Tooltip_0, {
                Text = v8.Tooltip
            }) else nil
        })
    });
end;