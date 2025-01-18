local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_joinTags_0 = v3.Styling.joinTags;
local l_Focus_0 = v3.ContextServices.Focus;
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useFocusLost);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useViewportPosition);
local v9 = require(l_script_FirstAncestor_0.Src.Contexts.InputListenerContext);
local v10 = {
    Size = UDim2.fromOffset(128, 0), 
    AutomaticSize = Enum.AutomaticSize.Y, 
    ImageTag = "MoreIcon", 
    Disabled = false
};
return function(v11) --[[ Line: 33 ]] --[[ Name: DropdownButton ]]
    -- upvalues: v4 (copy), v10 (copy), l_Focus_0 (copy), v9 (copy), v1 (copy), v8 (copy), v7 (copy), l_joinTags_0 (copy), v2 (copy)
    local v12 = v4.Dictionary.join(v10, v11);
    local v13 = l_Focus_0:use():get();
    local v14 = v9:use();
    local v15, v16 = v1.useState(not v12.Disabled);
    local v17, v18 = v1.useState(false);
    local v19, v20 = v1.useState(false);
    local v21 = v1.useRef(nil);
    local v22, v23 = v1.useState(Vector2.zero);
    local v24 = v8(if v21.current then UDim2.fromOffset(v21.current.AbsolutePosition.X - v22.X + 16, v21.current.AbsolutePosition.Y + 16) else UDim2.new(0, 0), v22.X, v22.Y);
    v7(v17, function() --[[ Line: 54 ]]
        -- upvalues: v20 (copy), v14 (copy)
        v20(false);
        v14:SetFocusedElement(nil);
    end);
    v1.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v14 (copy), v16 (copy)
        v14.FocusedElementChangedSignal:Connect(function() --[[ Line: 60 ]]
            -- upvalues: v16 (ref), v14 (ref)
            v16(not v14:GetFocusedElement());
        end);
    end, {});
    local v25 = {};
    for v26, v27 in v12.DropdownItems do
        if type(v27) == "string" then
            assert(v12.OnSelect, "String items must have an OnSelect fn defined.");
            v25[v26] = v1.createElement("TextButton", {
                Text = v27, 
                [v1.Event.Activated] = function() --[[ Line: 71 ]]
                    -- upvalues: v12 (copy), v27 (copy), v20 (copy), v18 (copy), v14 (copy)
                    v12.OnSelect(v27);
                    v20(false);
                    v18(false);
                    v14:SetFocusedElement(nil);
                end, 
                [v1.Tag] = "Component-DropdownItem"
            });
        else
            local v28 = v27.props[v1.Event.Activated];
            v27.props[v1.Event.Activated] = function() --[[ Line: 81 ]]
                -- upvalues: v28 (copy), v20 (copy), v18 (copy), v14 (copy)
                v28();
                v20(false);
                v18(false);
                v14:SetFocusedElement(nil);
            end;
            v25[v26] = v27;
        end;
    end;
    return v1.createElement("ImageButton", {
        ref = v21, 
        Interactable = v15 and not v12.Disabled, 
        [v1.Event.Activated] = function() --[[ Line: 94 ]]
            -- upvalues: v15 (copy), v20 (copy), v14 (copy), v21 (copy)
            if v15 then
                v20(true);
                v14:SetFocusedElement(v21.current);
            end;
        end, 
        [v1.Tag] = l_joinTags_0("Component-DropdownButton", v12.ImageTag, v12[v1.Tag], v12.Disabled and "Disabled" or nil)
    }, {
        Dropdown = if v19 then v2.createPortal(v1.createElement("CanvasGroup", {
            Position = v24, 
            Size = v12.Size, 
            AutomaticSize = v12.AutomaticSize, 
            [v1.Event.MouseEnter] = function() --[[ Line: 113 ]]
                -- upvalues: v18 (copy)
                v18(true);
            end, 
            [v1.Event.MouseLeave] = function() --[[ Line: 116 ]]
                -- upvalues: v18 (copy)
                v18(false);
            end, 
            [v1.Change.AbsoluteSize] = function(v29) --[[ Line: 119 ]]
                -- upvalues: v23 (copy)
                v23(v29.AbsoluteSize);
            end, 
            [v1.Tag] = "Component-Dropdown X-Column"
        }, v25), v13) else nil
    });
end;