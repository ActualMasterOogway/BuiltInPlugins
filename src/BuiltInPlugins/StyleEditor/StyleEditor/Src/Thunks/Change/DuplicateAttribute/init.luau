local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
local function v10(v4, v5) --[[ Line: 22 ]] --[[ Name: getNewAttributeName ]]
    for v6 = 0, 2 do
        local v7 = v6 * 1000;
        for v8 = 0, 99 do
            local v9 = ("%*_%*"):format(v5, (tostring(v7 + 2 + v8)));
            if v4:GetAttribute(v9) == nil then
                return v9;
            end;
        end;
    end;
    return nil;
end;
return function(v11, v12) --[[ Line: 39 ]] --[[ Name: DuplicateAttribute ]]
    -- upvalues: v10 (copy)
    return function(_, v14) --[[ Line: 40 ]]
        -- upvalues: v11 (copy), v12 (copy), v10 (ref)
        local l_v11_Attribute_0 = v11:GetAttribute(v12);
        if l_v11_Attribute_0 == nil then
            return;
        else
            local v16 = v10(v11, v12);
            if not v16 then
                return;
            else
                assert(v16 ~= nil, "expecing valid attribute name");
                v14.recordChange({
                    Name = "StyleEditor/DuplicateAttribute", 
                    DisplayName = "StyleEditor - Duplicate Attribute", 
                    DoChange = function() --[[ Line: 56 ]] --[[ Name: DoChange ]]
                        -- upvalues: v11 (ref), v16 (copy), l_v11_Attribute_0 (copy)
                        v11:SetAttribute(v16, l_v11_Attribute_0);
                        return Enum.FinishRecordingOperation.Commit;
                    end
                });
                return;
            end;
        end;
    end;
end;