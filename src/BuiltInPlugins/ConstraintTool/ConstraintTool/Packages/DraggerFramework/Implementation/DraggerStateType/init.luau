local v0 = {};
setmetatable(v0, {
    __index = function(_, v2) --[[ Line: 3 ]] --[[ Name: __index ]]
        error("Attempt to get invalid StateType `" .. tostring(v2) .. "`");
    end
});
v0.Ready = "Ready";
v0.PendingDraggingParts = "PendingDraggingParts";
v0.PendingSelectNext = "PendingSelectNext";
v0.DraggingHandle = "DraggingHandle";
v0.DraggingParts = "DraggingParts";
v0.DragSelecting = "DragSelecting";
v0.DraggingFaceInstance = "DraggingFaceInstance";
return v0;