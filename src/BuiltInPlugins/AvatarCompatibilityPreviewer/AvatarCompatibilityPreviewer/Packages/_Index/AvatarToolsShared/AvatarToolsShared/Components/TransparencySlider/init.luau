local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_Components_0 = script.Parent.Parent.Components;
local v3 = require(l_Components_0.SliderSetting);
local l_Util_0 = script.Parent.Parent.Util;
local v5 = require(l_Util_0.AccessoryAndBodyToolShared.TransparencyUtil);
local v6 = require(l_Util_0.AccessoryAndBodyToolShared.Constants);
local v7 = v1.PureComponent:extend("TransparencySlider");
require(l_Parent_0.Framework).Util.Typecheck.wrap(v7, script);
v7.init = function(v8, v9) --[[ Line: 34 ]] --[[ Name: init ]]
    v8.state = {
        value = v9.Value
    };
    v8.item = v9.Item;
end;
v7.didUpdate = function(v10) --[[ Line: 41 ]] --[[ Name: didUpdate ]]
    local l_item_0 = v10.item;
    local l_Item_0 = v10.props.Item;
    if l_item_0 ~= l_Item_0 then
        v10:setState({
            value = v10.props.Value
        });
    end;
    v10.item = l_Item_0;
end;
v7.render = function(v13) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v6 (copy), v5 (copy)
    local l_props_0 = v13.props;
    local l_Title_0 = l_props_0.Title;
    local l_Item_1 = l_props_0.Item;
    local l_Height_0 = l_props_0.Height;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_IsDisabled_0 = l_props_0.IsDisabled;
    local l_SetValue_0 = l_props_0.SetValue;
    return v1.createElement(v3, {
        Title = l_Title_0, 
        Value = v13.state.value, 
        MaxValue = v6.MAX_TRANSPARENCY_PERCENT, 
        Height = l_Height_0, 
        UsePercentage = true, 
        LayoutOrder = l_LayoutOrder_0, 
        IsDisabled = l_IsDisabled_0, 
        SetValue = function(v21) --[[ Line: 69 ]] --[[ Name: SetValue ]]
            -- upvalues: l_SetValue_0 (copy), l_Item_1 (copy), v6 (ref), v5 (ref), v13 (copy)
            if l_SetValue_0 then
                l_SetValue_0(v21);
            end;
            if l_Item_1 then
                local v22 = 1 - v21 / v6.MAX_TRANSPARENCY_PERCENT;
                v5.setTransparency(l_Item_1, v22);
            end;
            v13:setState({
                value = v21
            });
        end
    });
end;
return v7;