local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Packages.LuauPolyfill);
local v3 = require(l_Parent_0.Packages.Promise);
local v4 = require(l_Parent_0.Src.Resources.StyleTips);
local v5 = require(l_Parent_0.Packages.Cryo);
local _ = require(l_Parent_0.Packages.VirtualizedList).VirtualizedList;
return function(v7, v8, v9, v10, _) --[[ Line: 46 ]] --[[ Name: useBidirectionalInfiniteScroll ]]
    -- upvalues: v1 (copy), v5 (copy), v4 (copy), v3 (copy)
    local v12, v13 = v1.useState({
        addedEventList = {}, 
        eventList = {}, 
        prevCursor = "", 
        nextCursor = ""
    });
    local v14 = v1.useRef(nil);
    local v15, v16 = v1.useState(false);
    local v17, v18 = v1.useState(false);
    local v19 = v1.useRef({});
    local v20 = v1.useRef({});
    local v21 = v1.useRef(nil);
    local v22 = v1.useRef(nil);
    local v23 = v1.useRef(0);
    local v24 = v1.useRef(nil);
    local v25 = v1.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: v8 (copy), v5 (ref), v12 (copy)
        return v8(v5.List.join(v12.addedEventList, v12.eventList));
    end, {
        v12.addedEventList, 
        v12.eventList, 
        v8
    });
    local v32 = v1.useCallback(function(v26, v27, v28, v29, v30) --[[ Line: 78 ]]
        -- upvalues: v13 (copy), v5 (ref), v23 (copy), v4 (ref)
        v13(function(v31) --[[ Line: 85 ]]
            -- upvalues: v29 (copy), v5 (ref), v26 (copy), v27 (copy), v28 (copy)
            return {
                addedEventList = {}, 
                eventList = v29 and v5.List.join(v26, v31.eventList) or v5.List.join(v31.eventList, v26), 
                nextCursor = v29 and v31.nextCursor or v27, 
                prevCursor = not v29 and v31.prevCursor or v28, 
                startDate = v31.startDate
            };
        end);
        if v29 then
            v23.current = (v23.current or 0) + #v26 * v4.bubbleHeight + v4.filterHeaderHeight;
        end;
        if v30 then
            v30();
        end;
    end, {
        v13
    });
    local v34 = v1.useCallback(function(v33) --[[ Line: 111 ]]
        -- upvalues: v21 (copy), v22 (copy), v19 (copy), v20 (copy), v16 (copy), v18 (copy), v13 (copy)
        v21.current = nil;
        v22.current = nil;
        v19.current = {};
        v20.current = {};
        v16(false);
        v18(false);
        v13({
            addedEventList = {}, 
            eventList = {}, 
            nextCursor = "", 
            prevCursor = "", 
            startDate = v33
        });
    end, {
        v18, 
        v16, 
        v13
    });
    local v37 = v1.useCallback(function(v35, v36) --[[ Line: 133 ]]
        -- upvalues: v12 (copy), v24 (copy), v34 (copy)
        if v35 ~= v12.startDate then
            v24.current = v36;
            v34(v35);
        end;
    end, {
        v34, 
        v12.startDate
    });
    local v39 = v1.useCallback(function() --[[ Line: 148 ]]
        -- upvalues: v3 (ref), v12 (copy), v7 (copy), v32 (copy), v24 (copy)
        return v3.new(function(v38) --[[ Line: 149 ]]
            -- upvalues: v12 (ref), v7 (ref), v32 (ref), v24 (ref)
            if v12.nextCursor ~= nil then
                v7(v32, v12.nextCursor, v12.startDate, false, v38, v24.current);
                return;
            else
                if v38 then
                    v38();
                end;
                return;
            end;
        end);
    end, {
        v7, 
        v32, 
        v12.nextCursor, 
        v12.startDate
    });
    local v41 = v1.useCallback(function() --[[ Line: 168 ]]
        -- upvalues: v3 (ref), v12 (copy), v7 (copy), v32 (copy), v24 (copy)
        return v3.new(function(v40) --[[ Line: 169 ]]
            -- upvalues: v12 (ref), v7 (ref), v32 (ref), v24 (ref)
            if v12.prevCursor ~= nil and v12.startDate ~= nil then
                v7(v32, v12.prevCursor, v12.startDate, true, v40, v24.current);
                return;
            else
                if v40 then
                    v40();
                end;
                return;
            end;
        end);
    end, {
        v7, 
        v32, 
        v12.prevCursor, 
        v12.startDate
    });
    local function v51(v42) --[[ Line: 189 ]] --[[ Name: calculateScrollPosition ]]
        local l_X_0 = v42.AbsoluteCanvasSize.X;
        local l_Y_0 = v42.AbsoluteCanvasSize.Y;
        local l_X_1 = v42.AbsoluteWindowSize.X;
        local l_Y_1 = v42.AbsoluteWindowSize.Y;
        local l_X_2 = v42.CanvasPosition.X;
        local l_Y_2 = v42.CanvasPosition.Y;
        local v49 = l_X_0 - l_X_1 - l_X_2;
        local v50 = l_Y_0 - l_Y_1 - l_Y_2;
        if v42.ScrollingDirection == Enum.ScrollingDirection.Y then
            return l_Y_2 / l_Y_1, v50 / l_Y_1, l_Y_2;
        elseif v42.ScrollingDirection == Enum.ScrollingDirection.X then
            return l_X_2 / l_X_1, v49 / l_X_1, l_X_2;
        elseif l_Y_1 < l_X_1 then
            return l_X_2 / l_X_1, v49 / l_X_1, l_X_2;
        else
            return l_Y_2 / l_Y_1, v50 / l_Y_1, l_Y_2;
        end;
    end;
    local v54 = v1.useCallback(function() --[[ Line: 213 ]]
        -- upvalues: v17 (copy), v20 (copy), v12 (copy), v3 (ref), v22 (copy), v18 (copy), v21 (copy), v39 (copy)
        if v17 or v20.current and v20.current[#v12.eventList] then
            return;
        else
            if v20.current then
                v20.current[#v12.eventList] = true;
            end;
            local function v53() --[[ Line: 226 ]] --[[ Name: fetchNextPageFinished ]]
                -- upvalues: v3 (ref), v22 (ref), v18 (ref)
                return v3.new(function(v52) --[[ Line: 227 ]]
                    -- upvalues: v22 (ref), v18 (ref)
                    v22.current = nil;
                    v18(false);
                    v52();
                end);
            end;
            if v21.current then
                v21.current:andThen(function() --[[ Line: 236 ]]
                    -- upvalues: v18 (ref), v22 (ref), v39 (ref), v53 (copy)
                    v18(true);
                    v22.current = v39():andThen(v53);
                end);
                return;
            else
                v18(true);
                v22.current = v39():andThen(v53);
                return;
            end;
        end;
    end, {
        v39, 
        v17, 
        v18, 
        #v12.eventList
    });
    local v57 = v1.useCallback(function() --[[ Line: 252 ]]
        -- upvalues: v15 (copy), v19 (copy), v12 (copy), v3 (ref), v21 (copy), v16 (copy), v14 (copy), v23 (copy), v22 (copy), v41 (copy)
        if v15 or v19.current and v19.current[#v12.eventList] then
            return;
        else
            if v19.current then
                v19.current[#v12.eventList] = true;
            end;
            local function v56() --[[ Line: 265 ]] --[[ Name: fetchPreviousPageFinished ]]
                -- upvalues: v3 (ref), v21 (ref), v16 (ref), v14 (ref), v23 (ref)
                return v3.new(function(v55) --[[ Line: 266 ]]
                    -- upvalues: v21 (ref), v16 (ref), v14 (ref), v23 (ref)
                    v21.current = nil;
                    v16(false);
                    if v14.current and v23.current > 0 then
                        v14.current:scrollToOffset({
                            animated = false, 
                            offset = v23.current
                        });
                    end;
                    v55();
                end);
            end;
            if v22.current then
                v22.current:andThen(function() --[[ Line: 282 ]]
                    -- upvalues: v16 (ref), v21 (ref), v41 (ref), v56 (copy)
                    v16(true);
                    v21.current = v41():andThen(v56);
                end);
                return;
            else
                v16(true);
                v21.current = v41():andThen(v56);
                return;
            end;
        end;
    end, {
        v41, 
        v15, 
        v16, 
        #v12.eventList
    });
    local v62 = v1.useCallback(function(v58) --[[ Line: 300 ]]
        -- upvalues: v51 (copy), v10 (copy), v54 (copy), v23 (copy), v57 (copy)
        local v59, v60, v61 = v51(v58);
        if v60 < v10 / 100 then
            v54();
        end;
        if v59 < v10 / 100 then
            v23.current = v61;
            v57();
        end;
    end, {
        v10, 
        v54, 
        v57
    });
    v1.useEffect(function() --[[ Line: 312 ]]
        -- upvalues: v34 (copy)
        v34(nil);
    end, {
        v7
    });
    v1.useEffect(function() --[[ Line: 318 ]]
        -- upvalues: v25 (copy), v9 (copy), v12 (copy), v54 (copy), v57 (copy)
        if #v25 < v9 then
            if v12.nextCursor ~= nil then
                v54();
                return;
            elseif v12.prevCursor ~= nil then
                v57();
            end;
        end;
    end, {
        #v25, 
        v54, 
        v57, 
        v9, 
        v12.nextCursor, 
        v12.prevCursor
    });
    local v65 = v1.useCallback(function(v63) --[[ Line: 341 ]]
        -- upvalues: v12 (copy), v13 (copy), v5 (ref)
        if v12.prevCursor ~= nil and v12.startDate ~= nil then
            return;
        else
            v13(function(v64) --[[ Line: 346 ]]
                -- upvalues: v5 (ref), v63 (copy)
                return {
                    addedEventList = v5.List.join({
                        v63
                    }, v64.addedEventList), 
                    eventList = v64.eventList, 
                    nextCursor = v64.nextCursor, 
                    prevCursor = v64.prevCursor, 
                    startDate = v64.startDate
                };
            end);
            return;
        end;
    end, {
        v13, 
        v12.prevCursor
    });
    return {
        vlref = v14, 
        eventList = v25, 
        jumpToDate = v37, 
        addNewEvent = v65, 
        onScroll = v62, 
        fetchPreviousPageInProgress = v15, 
        fetchNextPageInProgress = v17
    };
end;