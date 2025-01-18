local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Components.ExplorerNodeRow);
local v3 = require(l_script_FirstAncestor_0.Util.Observable);
local v4 = require(l_script_FirstAncestor_0.Components.Overlays);
local v5 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v7 = require(l_script_FirstAncestor_0.Components.SearchBox);
local v8 = require(l_script_FirstAncestor_0.Components.Underlays);
local v9 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v10 = require(l_script_FirstAncestor_0.Util.mapValues);
local v11 = require(l_script_FirstAncestor_0.Hooks.useArrowKeys);
local v12 = require(l_script_FirstAncestor_0.Hooks.useBlankSpaceClicking);
local v13 = require(l_script_FirstAncestor_0.Hooks.useContextMenu);
local v14 = require(l_script_FirstAncestor_0.Hooks.useDragAndDrop);
local v15 = require(l_script_FirstAncestor_0.Hooks.useFocusListener);
local v16 = require(l_script_FirstAncestor_0.Hooks.useHoverTracker);
local v17 = require(l_script_FirstAncestor_0.Hooks.useRefs);
local v18 = require(l_script_FirstAncestor_0.Hooks.useRequestSavedFields);
local v19 = require(l_script_FirstAncestor_0.Hooks.useScrollToSelection);
local v20 = require(l_script_FirstAncestor_0.Hooks.useSelectAll);
local v21 = require(l_script_FirstAncestor_0.Hooks.useSessionCanvasHeight);
local v22 = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v5.createElement;
return function(v24) --[[ Line: 28 ]] --[[ Name: SessionView ]]
    -- upvalues: v3 (copy), v5 (copy), v1 (copy), v9 (copy), v21 (copy), v22 (copy), v11 (copy), v13 (copy), v15 (copy), v16 (copy), v18 (copy), v19 (copy), v20 (copy), v12 (copy), v14 (copy), v17 (copy), l_createElement_0 (copy), v7 (copy), v8 (copy), v10 (copy), v2 (copy), v4 (copy)
    local v25, v26 = v3.useState(0);
    local v27, v28 = v3.useState(0);
    local v29, v30 = v5.useState(0);
    local v31, v32 = v5.useState(v1.minSearchHeaderHeight);
    local v34 = v5.useCallback(function(v33) --[[ Line: 37 ]]
        -- upvalues: v30 (copy)
        v30(v33.AbsoluteSize.Y);
    end, {});
    local v36 = v5.useCallback(function(v35) --[[ Line: 41 ]]
        -- upvalues: v28 (copy), v26 (copy)
        v28(v35.CanvasPosition.X);
        v26(v35.CanvasPosition.Y);
    end, {});
    local v38 = v5.useCallback(function(v37) --[[ Line: 46 ]]
        -- upvalues: v32 (copy)
        v32(v37.AbsoluteSize.Y);
    end, {});
    local v39 = v5.useRef(nil);
    local v40 = v5.useRef(nil);
    local v41 = v9();
    v5.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v39 (copy), v30 (copy), v28 (copy), v26 (copy)
        assert(v39.current ~= nil, "ScrollingFrame not mounted yet");
        v30(v39.current.AbsoluteSize.Y);
        v28(v39.current.CanvasPosition.X);
        v26(v39.current.CanvasPosition.Y);
    end, {});
    local v42 = v21(v24.session);
    local v43 = v22(v24.session, v29, v25);
    v11(v24.session);
    v13(v24.session);
    v15(v24.session);
    v16(v24.session, v43, v25, v31, v39);
    v18(v24.session);
    v19(v24.session, v39);
    v20(v24.session);
    local v44 = v12(v24.session);
    local v45 = v14(v24.session, v39);
    local v46 = v17(#v43, nil);
    return l_createElement_0("TextButton", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Text = "", 
        [v5.Event.MouseButton1Down] = v44.click, 
        [v5.Event.MouseButton2Down] = v44.rightClick
    }, {
        SearchBox = l_createElement_0(v7, {
            headerRef = v40, 
            onSearchHeaderSizeChange = v38, 
            session = v24.session, 
            windowHeight = v29, 
            zIndex = 2
        }), 
        Contents = l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Position = UDim2.fromOffset(0, v31), 
            Size = UDim2.new(1, 0, 1, -v31)
        }, {
            Padding = l_createElement_0("UIPadding", {
                PaddingRight = UDim.new(0, 4)
            }), 
            Underlays = l_createElement_0(v8, {
                session = v24.session, 
                scrollHeightObservable = v25, 
                visibleNodeObservables = v43, 
                draggingTargetObservable = v45, 
                textLabelRefs = v46, 
                zIndex = v41()
            }), 
            ScrollingFrame = l_createElement_0("ScrollingFrame", {
                AutomaticCanvasSize = Enum.AutomaticSize.X, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                CanvasSize = v42:map(function(v47) --[[ Line: 119 ]]
                    return UDim2.fromOffset(0, v47);
                end), 
                ScrollBarThickness = v1.sessionViewScrollBarWidth, 
                Size = UDim2.fromScale(1, 1), 
                VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                ZIndex = v41(), 
                [v5.Change.AbsoluteSize] = v34, 
                [v5.Change.CanvasPosition] = v36, 
                [v5.Tag] = "Explorer-ScrollingFrame Explorer-SessionView-ScrollingFrame", 
                ref = v39
            }, v10(v43, function(v48, v49) --[[ Line: 133 ]]
                -- upvalues: l_createElement_0 (ref), v1 (ref), v2 (ref), v45 (copy), v24 (copy), v46 (copy)
                return (l_createElement_0("Frame", {
                    BackgroundTransparency = 1, 
                    Position = v48.getBinding():map(function(v50) --[[ Line: 140 ]]
                        return UDim2.fromOffset(0, v50.yPixels);
                    end), 
                    Size = UDim2.new(1, 0, 0, v1.explorerRowHeight), 
                    ZIndex = 2
                }, l_createElement_0(v2, {
                    visibleNodeObservable = v48, 
                    draggingTargetObservable = v45, 
                    session = v24.session, 
                    textLabelRef = v46[v49]
                })));
            end)), 
            Overlays = l_createElement_0(v4, {
                session = v24.session, 
                scrollHeightObservable = v25, 
                scrollWidthObservable = v27, 
                visibleNodeObservables = v43, 
                draggingTargetObservable = v45, 
                zIndex = v41()
            })
        })
    });
end;