local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v6) --[[ Line: 18 ]] --[[ Name: PasteInstanceInto ]]
    -- upvalues: v1 (copy), v3 (copy)
    return function(v7, v8) --[[ Line: 19 ]]
        -- upvalues: v6 (copy), v1 (ref), v3 (ref)
        local l_Instance_0 = v7:getState().Clipboard.Instance;
        if not l_Instance_0 then
            return nil;
        else
            assert(l_Instance_0 ~= nil, "expecting valid instance");
            local v10 = nil;
            v8.recordChange({
                Name = "StyleEditor/PasteInstanceInto", 
                DisplayName = "StyleEditor - Paste Instance", 
                DoChange = function() --[[ Line: 32 ]] --[[ Name: DoChange ]]
                    -- upvalues: v10 (ref), l_Instance_0 (copy), v6 (ref)
                    v10 = l_Instance_0:Clone();
                    v10.Parent = v6;
                    return Enum.FinishRecordingOperation.Commit;
                end
            });
            if v10 then
                local v11 = v1.createItemId(v10);
                v7:dispatch(v3(v11));
            end;
            return v10;
        end;
    end;
end;