local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_collectArray_0 = require(l_Parent_0.Packages.Dash).collectArray;
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Button_0 = l_UI_0.Button;
local l_Select_0 = l_UI_0.PropertyCell.Renderers.Select;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v9 = require(l_Parent_0.Src.Util.sortByLabel);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("PropertyCellSize");
return v1.connect(function(v14) --[[ Line: 93 ]]
    return {
        Fonts = v14.Asset.Fonts
    };
end)(function(v15) --[[ Line: 38 ]] --[[ Name: FontFamilyRenderer ]]
    -- upvalues: l_useMemo_0 (copy), l_collectArray_0 (copy), v9 (copy), v2 (copy), l_Button_0 (copy), l_Attribute_0 (copy), l_TextLabel_0 (copy), l_Select_0 (copy)
    local v19 = l_useMemo_0(function() --[[ Line: 39 ]]
        -- upvalues: l_collectArray_0 (ref), v15 (copy), v9 (ref)
        local v18 = l_collectArray_0(v15.Fonts, function(_, v17) --[[ Line: 40 ]]
            if v17.AssetId == "rbxasset://fonts/families/LegacyArial.json" then
                return nil;
            else
                return {
                    Id = v17.AssetId, 
                    Label = v17.Name, 
                    Value = v17.AssetId
                };
            end;
        end);
        return v9(v18);
    end, {
        v15.Fonts
    });
    local function v24(v20, v21, v22, _) --[[ Line: 57 ]] --[[ Name: onRenderItem ]]
        -- upvalues: v2 (ref), l_Button_0 (ref), l_Attribute_0 (ref), l_TextLabel_0 (ref)
        return v2.createElement(l_Button_0, {
            LayoutOrder = v21, 
            OnClick = function() --[[ Line: 65 ]] --[[ Name: OnClick ]]
                -- upvalues: v22 (copy)
                v22();
            end, 
            Size = l_Attribute_0
        }, {
            Label = v2.createElement(l_TextLabel_0, {
                RichText = true, 
                Text = ("<font family='%*'>%*</font>"):format(v20.Id, v20.Label), 
                [v2.Tag] = "X-Fill X-Pad ItemTextSize TextXAlignLeft"
            })
        });
    end;
    return v2.createElement(l_Select_0, {
        OnChanged = function(v25) --[[ Line: 79 ]] --[[ Name: OnChanged ]]
            -- upvalues: v15 (copy)
            local l_Value_0 = v15.Value;
            l_Value_0.Family = v25;
            v15.OnChanged(l_Value_0);
        end, 
        OnRenderItem = v24, 
        PlaceholderText = v15.Value.Family == "rbxasset://fonts/families/LegacyArial.json" and "Arial (Legacy)" or "Font...", 
        Schema = {
            Items = v19
        }, 
        Value = v15.Value.Family
    });
end);