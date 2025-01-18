local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_useState_0 = v1.useState;
local v9 = require(l_script_FirstAncestor_0.Src.Networking);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v12) --[[ Line: 29 ]] --[[ Name: CheckboxRow ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v9 (copy), l_useState_0 (copy), v1 (copy), l_Pane_0 (copy), l_Image_0 (copy), l_TextLabel_0 (copy), l_Checkbox_0 (copy)
    local v13 = l_LayoutOrderIterator_0.new();
    local v14 = v9.use();
    local v15, v16 = l_useState_0("");
    if v12.ScopeInfo then
        local function v18(v17) --[[ Line: 35 ]] --[[ Name: setThumbnailIfChanged ]]
            -- upvalues: v15 (copy), v16 (copy)
            if v15 ~= v17 then
                v16(v17);
            end;
        end;
        if v15 == "" or v15 ~= v14:getThumbnailUriForScope(v12.ScopeInfo) then
            v14:getThumbnailForScopeAsync(v12.ScopeInfo, v18);
        end;
    end;
    local v19 = "";
    if v12.Text then
        v19 = v12.Text;
    elseif v12.ScopeInfo then
        v19 = if v12.ScopeInfo.Name then v12.ScopeInfo.Name else tostring(v12.ScopeInfo.Id);
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v12.LayoutOrder, 
        Position = v12.Position, 
        [v1.Tag] = "CheckboxRow X-FitY"
    }, {
        Contents = v1.createElement(l_Pane_0, {
            LayoutOrder = v13:getNextOrder(), 
            [v1.Tag] = "CheckboxRowContents X-Row X-Middle X-Left"
        }, {
            Icon = if v12.ScopeInfo then v1.createElement(l_Image_0, {
                LayoutOrder = v13:getNextOrder(), 
                Image = v15, 
                [v1.Tag] = "ScopeIcon Icon16"
            }) else nil, 
            TextLabel = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v13:getNextOrder(), 
                Text = v19, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                [v1.Tag] = "Left X-FitY X-Pad"
            })
        }), 
        Checkbox = v1.createElement(l_Checkbox_0, {
            LayoutOrder = v13:getNextOrder(), 
            Checked = v12.Checked, 
            OnClick = function() --[[ Line: 80 ]] --[[ Name: OnClick ]]
                -- upvalues: v12 (copy)
                v12.OnChecked();
            end
        })
    });
end;