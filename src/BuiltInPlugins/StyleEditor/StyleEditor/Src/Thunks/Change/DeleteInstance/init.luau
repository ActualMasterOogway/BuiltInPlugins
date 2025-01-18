local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v3) --[[ Line: 13 ]] --[[ Name: DeleteInstance ]]
    return function(_, v5) --[[ Line: 14 ]]
        -- upvalues: v3 (copy)
        if not v3 then
            return;
        else
            v5.recordChange({
                Name = "StyleEditor/DeleteInstance", 
                DisplayName = "StyleEditor - Delete Instance", 
                DoChange = function() --[[ Line: 22 ]] --[[ Name: DoChange ]]
                    -- upvalues: v3 (ref)
                    if v3:IsA("Folder") then
                        for _, v7 in v3:GetChildren() do
                            local l_v7_Attribute_0 = v7:GetAttribute("StyleCategory");
                            if not l_v7_Attribute_0 or l_v7_Attribute_0 ~= "Themes" or not v7:IsA("StyleSheet") then
                                v7.Parent = v3.Parent;
                            end;
                        end;
                    end;
                    v3:Remove();
                    return Enum.FinishRecordingOperation.Commit;
                end
            });
            return;
        end;
    end;
end;