local v0 = {
    LeftIcon = {
        Image = "rbxasset://textures/Debugger/debugger_arrow.png", 
        Size = UDim2.new(0, 14, 0, 14)
    }, 
    Value = ""
};
local v1 = {
    LeftIcon = {
        Image = "rbxasset://textures/Debugger/debugger_arrow_curve_left.png", 
        Size = UDim2.new(0, 14, 0, 14)
    }, 
    Value = ""
};
return {
    new = function() --[[ Line: 26 ]] --[[ Name: new ]]
        return {
            frameColumn = "", 
            functionColumn = "", 
            lineColumn = "", 
            sourceColumn = ""
        };
    end, 
    fromData = function(v2) --[[ Line: 35 ]] --[[ Name: fromData ]]
        return {
            frameColumn = v2.frameColumn, 
            functionColumn = v2.functionColumn, 
            lineColumn = v2.lineColumn, 
            sourceColumn = v2.sourceColumn
        };
    end, 
    ICON_FRAME_TOP = v0, 
    ICON_CURRENT_FRAME = v1
};