local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = v1.Tag ~= nil;
local _ = require(l_Parent_0.Types);
local l_map_0 = require(l_Parent_0.Parent.Dash).map;
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
local v9 = require(l_Parent_0.UI.Components.Pane);
local _ = require(script.InlineElement);
local v11 = require(script.HoverContext);
local function v25(v12, v13) --[[ Line: 26 ]] --[[ Name: layoutElements ]]
    -- upvalues: l_map_0 (copy), v1 (copy), v9 (copy)
    if #v12 == 0 then
        return {};
    else
        local v14 = {};
        local v15 = {};
        local l_v13_0 = v13;
        local v17 = nil;
        local v18 = 1;
        local v19 = 0;
        while (v18 <= #v12 or v17) and v19 < 100 do
            local v20 = v17 or v12[v18];
            local v21 = v20:getWidth();
            if v21 <= l_v13_0 then
                table.insert(v15, v20:render(v18));
                l_v13_0 = l_v13_0 - v21;
                v17 = nil;
                v18 = v18 + 1;
            else
                local v22, v23 = v20:split(l_v13_0);
                if v22:getWidth() <= l_v13_0 then
                    table.insert(v15, v22:render(v18));
                    v17 = v23;
                elseif #v15 == 0 then
                    table.insert(v15, v22:render(v18));
                    v17 = v23;
                else
                    v17 = v20;
                end;
                table.insert(v14, v15);
                v15 = {};
                l_v13_0 = v13;
            end;
            v19 = v19 + 1;
        end;
        if v19 == 100 then
            warn("InlineLayout: trying to wrap text across multiple lines and iterations cap is reached. Layout may be imperfect");
        end;
        if #v15 > 0 then
            table.insert(v14, v15);
        end;
        return l_map_0(v14, function(v24) --[[ Line: 84 ]]
            -- upvalues: v1 (ref), v9 (ref)
            return v1.createElement(v9, {
                [v1.Tag] = "X-Fit X-Row"
            }, v24);
        end);
    end;
end;
return function(v26) --[[ Line: 89 ]] --[[ Name: InlineLayout ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), v2 (copy), l_useCallback_0 (copy), v25 (copy), l_useEffect_0 (copy), v1 (copy), v11 (copy), v9 (copy)
    local v27 = l_useRef_0(nil);
    local v28, v29 = l_useState_0({});
    if not v2 then
        warn("Can't use InlineLayout in old Roact, please upgrade your plugin to React 17");
        return;
    else
        local v30 = l_useCallback_0(function() --[[ Line: 98 ]]
            -- upvalues: v27 (copy), v29 (copy), v25 (ref), v26 (copy)
            if v27.current == nil then
                return;
            elseif v27.current.AbsoluteSize.X == 0 then
                return;
            else
                v29(v25(v26.Elements, v27.current.AbsoluteSize.X));
                return;
            end;
        end, {
            v26.Elements
        });
        l_useEffect_0(v30, {});
        return v1.createElement(v11.Provider, nil, v1.createElement(v9, {
            [v1.Change.AbsoluteSize] = v30, 
            ref = v27, 
            [v1.Tag] = "X-FitY X-ColumnS"
        }, v28));
    end;
end;