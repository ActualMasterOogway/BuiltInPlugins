local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Utility.Logger);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Components.Text);
local v8 = require(l_script_FirstAncestor_0.Components.Image);
local v9 = require(l_script_FirstAncestor_0.Components.Button);
local v10 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v14 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v15 = require(l_script_FirstAncestor_0.Enums.ButtonSize);
local v16 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v17 = {
    onActivated = function() --[[ Line: 43 ]] --[[ Name: onActivated ]]

    end, 
    variant = v14.Standard, 
    text = "Button"
};
return v2.memo(v2.forwardRef(function(v18, v19) --[[ Line: 48 ]] --[[ Name: Toast ]]
    -- upvalues: v11 (copy), v10 (copy), v2 (copy), v4 (copy), v3 (copy), v13 (copy), v17 (copy), v15 (copy), v16 (copy), v9 (copy), v6 (copy), v12 (copy), v8 (copy), v7 (copy)
    local v20 = v11();
    local v21 = v10({
        radius = UDim.new(0, v20.Radius.Medium), 
        offset = v20.Size.Size_200, 
        borderWidth = v20.Stroke.Thicker
    });
    local l_actions_0 = v18.actions;
    local v27 = v2.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: l_actions_0 (copy), v4 (ref), v3 (ref), v13 (ref), v17 (ref), v15 (ref), v16 (ref), v2 (ref), v9 (ref)
        local v23 = {};
        if l_actions_0 then
            for v24, v25 in l_actions_0 do
                if v24 > 2 then
                    v4:warning((("Toast only supports up to %* actions"):format(2)));
                    return v23;
                else
                    local v26 = v3.Dictionary.union(v13(v25, v17), {
                        LayoutOrder = v24, 
                        size = v15.Small, 
                        fillBehavior = v16.Fill
                    });
                    v23["ToastButton" .. v24] = v2.createElement(v9, v26);
                end;
            end;
        end;
        return v23;
    end, {
        l_actions_0
    });
    local v28 = v18.icon and v18.icon ~= "";
    local v29 = v18.title and v18.title ~= "";
    local v30 = v18.text and v18.text ~= "";
    return v2.createElement(v6, v12(v18, {
        Size = UDim2.new(0, v20.Size.Size_1000 * 9, 0, 0), 
        Position = UDim2.new(0.5, 0, 0.1, 0), 
        selection = {
            Selectable = false, 
            SelectionImageObject = v21
        }, 
        tag = "auto-y padding-medium radius-medium row gap-small bg-over-media-0", 
        ref = v19
    }), {
        Media = if v28 then v2.createElement(v8, {
            LayoutOrder = 1, 
            Image = v18.icon, 
            tag = "bg-transparency-100 size-1200-1200"
        }) else nil, 
        Content = v2.createElement(v6, {
            LayoutOrder = 2, 
            tag = {
                ["auto-y fill self-center"] = true, 
                ["col gap-xxsmall"] = v29 or v30
            }
        }, {
            Header = if v29 then v2.createElement(v7, {
                LayoutOrder = 1, 
                Text = v18.title, 
                tag = "auto-y size-full-0 text-align-x-left text-title-small content-emphasis text-truncate-end"
            }) else nil, 
            Body = if v30 then v2.createElement(v7, {
                LayoutOrder = 2, 
                Text = v18.text, 
                tag = "auto-y size-full-0 text-wrap text-align-x-left text-body-small content-default"
            }) else nil, 
            Actions = if l_actions_0 and #l_actions_0 > 0 then v2.createElement(v6, {
                LayoutOrder = 3, 
                tag = {
                    ["auto-y row gap-small size-full-0"] = true, 
                    ["padding-top-small"] = v29 or v30
                }
            }, v27) else nil
        })
    });
end));