local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v8 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v9 = require(l_script_FirstAncestor_0.Packages.React);
local l_useRef_0 = v9.useRef;
local l_useState_0 = v9.useState;
local l_useEffect_0 = v9.useEffect;
local l_ScrollingFrame_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.ScrollingFrame;
local l_TweenService_0 = game:GetService("TweenService");
local v15 = require(l_script_FirstAncestor_0.Src.Components.ScrollingCarousel.Chevron);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function _(v17, v18, v19) --[[ Line: 44 ]] --[[ Name: calculateRightChevronVisible ]]
    return v17 + v18.X < v19.X;
end;
local function _(v21) --[[ Line: 48 ]] --[[ Name: calculateLeftChevronVisible ]]
    return v21 ~= Vector2.new(0, 0);
end;
return function(v23) --[[ Line: 52 ]] --[[ Name: ScrollingCarousel ]]
    -- upvalues: l_useState_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v9 (copy), l_TweenService_0 (copy), v15 (copy), l_ScrollingFrame_0 (copy), v8 (copy)
    local v24 = false;
    local v25, v26 = l_useState_0(false);
    local v27, v28 = l_useState_0(0);
    local v29 = l_useRef_0(nil);
    local v30, v31 = l_useState_0(Vector2.new(0, 0));
    l_useEffect_0(function() --[[ Line: 58 ]]
        -- upvalues: v23 (copy)
        if v23.OnLoadRange then
            v23.OnLoadRange(0, 10);
        end;
    end, {});
    local v32 = {};
    for _, v34 in v23.Cells do
        table.insert(v32, v9.createElement(v23.CellComponent, {
            Size = v23.CellSize, 
            Cell = v34
        }));
    end;
    local function v39(v35) --[[ Line: 77 ]] --[[ Name: moveScrollByPixels ]]
        -- upvalues: v25 (copy), v29 (copy), l_TweenService_0 (ref), v26 (copy)
        if v25 then
            return;
        else
            local l_current_0 = v29.current;
            if not l_current_0 then
                return;
            else
                local v37 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
                local v38 = l_TweenService_0:Create(l_current_0, v37, {
                    CanvasPosition = Vector2.new(l_current_0.CanvasPosition.X + v35, 0)
                });
                v38:Play();
                v26(true);
                v38.Completed:Connect(function() --[[ Line: 93 ]]
                    -- upvalues: v26 (ref)
                    v26(false);
                end);
                return;
            end;
        end;
    end;
    local l_createElement_0 = v9.createElement;
    local v41 = "Frame";
    local v43 = {
        Size = v23.Size, 
        Position = v23.Position, 
        [v9.Change.AbsoluteSize] = function(v42) --[[ Line: 101 ]]
            -- upvalues: v28 (copy)
            v28(v42.AbsoluteSize.X);
        end, 
        [v9.Tag] = "X-Transparent"
    };
    local v44 = {};
    local v45 = if v30 ~= Vector2.new(0, 0) then v9.createElement(v15, {
        Size = UDim2.new(0, 100, 0, v23.CellSize.Height.Offset), 
        Position = UDim2.new(0, 0, 0, 0), 
        IsArrowRight = false, 
        OnClick = function() --[[ Line: 111 ]] --[[ Name: OnClick ]]
            -- upvalues: v39 (copy)
            v39(-236);
        end
    }) else nil;
    local v46 = v9.createElement(l_ScrollingFrame_0, {
        Size = if v8 then nil else UDim2.new(1, 0, 1, 0), 
        ScrollBarThickness = 0, 
        Layout = Enum.FillDirection.Horizontal, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ForwardRef = v29, 
        ScrollingEnabled = true, 
        OnScrollUpdate = v31, 
        [v9.Tag] = v8 and "X-Fill X-RowM X-Middle StartPage-PadScrollingCarouselLeft X-Transparent" or "X-RowM X-Middle StartPage-PadScrollingCarouselLeft X-Transparent"
    }, v32);
    local v47;
    if v29.current then
        local l_AbsoluteCanvasSize_0 = v29.current.AbsoluteCanvasSize;
        if v27 + v30.X < l_AbsoluteCanvasSize_0.X then
            v47 = v9.createElement(v15, {
                Size = UDim2.new(0, 100, 0, v23.CellSize.Height.Offset), 
                Position = UDim2.new(1, -100, 0, 0), 
                OnClick = function() --[[ Line: 137 ]] --[[ Name: OnClick ]]
                    -- upvalues: v39 (copy)
                    v39(236);
                end, 
                IsArrowRight = true
            });
            v24 = true;
        end;
    end;
    if not v24 then
        v47 = nil;
    end;
    v24 = false;
    v6(v44, 1, v45, v46, v47);
    return l_createElement_0(v41, v43, v44);
end;