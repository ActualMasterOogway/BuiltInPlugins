local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Observable);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Util.mapValues);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v2.createElement;
return function(v7) --[[ Line: 13 ]] --[[ Name: FieldsList ]]
    -- upvalues: v1 (copy), l_createElement_0 (copy), v2 (copy), v4 (copy)
    local v8 = v1.use(v7.session.requestedFieldsObservable);
    return l_createElement_0("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v7.layoutOrder, 
        [v2.Tag] = "X-FitX X-RowS X-Middle", 
        Visible = v7.visibleNodeObservable.getBinding():map(function(v9) --[[ Line: 29 ]]
            return v9.datum.fieldValues ~= nil;
        end)
    }, v4(v8, function(v10, v11) --[[ Line: 33 ]]
        -- upvalues: l_createElement_0 (ref), v2 (ref), v7 (copy)
        if v10.field.render == nil then
            return nil;
        else
            return (l_createElement_0("Frame", {
                key = v10.token, 
                BackgroundTransparency = 1, 
                LayoutOrder = v11, 
                Size = UDim2.fromOffset(16, 16), 
                [v2.Tag] = ("data-testid=Field-%*"):format(v10.field.key)
            }, v10.field.render(v7.visibleNodeObservable.getBinding():map(function(v12) --[[ Line: 52 ]]
                -- upvalues: v10 (copy)
                return v12.datum.fieldValues and v10.token and v12.datum.fieldValues[v10.token];
            end), function(v13, ...) --[[ Line: 57 ]]
                -- upvalues: v10 (copy), v7 (ref)
                assert(v10.token ~= nil, "Luau");
                v7.session.performFieldAction(v7.visibleNodeObservable.get().datum.id, v10.token, v13, ...);
            end, v10.parameters)));
        end;
    end));
end;