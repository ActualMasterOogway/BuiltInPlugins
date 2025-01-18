local v0 = {};
local _ = require(script.Parent.FFlag);
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
v0.onMoveBegan = function(_, _) --[[ Line: 36 ]] --[[ Name: onMoveBegan ]]
    -- upvalues: v3 (ref), v9 (ref)
    v3:hide();
    v9:setVisible(false);
end;
v0.onMoveChanged = function(_, _) --[[ Line: 42 ]] --[[ Name: onMoveChanged ]]
    -- upvalues: v7 (ref)
    v7:update();
    v7:setVisible(true);
end;
v0.onMoveEnded = function(_, _) --[[ Line: 48 ]] --[[ Name: onMoveEnded ]]
    -- upvalues: v3 (ref), v9 (ref)
    v3:updatePosition();
    v3:show();
    v9:updatePosition();
    v9:setVisible(true);
end;
v0.onResizeBegan = function(_, _) --[[ Line: 56 ]] --[[ Name: onResizeBegan ]]

end;
v0.onResizeChanged = function(_, _) --[[ Line: 59 ]] --[[ Name: onResizeChanged ]]
    -- upvalues: v7 (ref), v9 (ref)
    v7:update();
    v9:update();
end;
v0.onResizeEnded = function(_, _) --[[ Line: 65 ]] --[[ Name: onResizeEnded ]]

end;
v0.onRotateBegan = function(_, _) --[[ Line: 68 ]] --[[ Name: onRotateBegan ]]
    -- upvalues: v7 (ref), v3 (ref), v9 (ref)
    v7:setVisible(false);
    v3:hide();
    v9:setVisible(false);
end;
v0.onRotateChanged = function(_, v26) --[[ Line: 75 ]] --[[ Name: onRotateChanged ]]
    -- upvalues: v8 (ref), v4 (ref)
    v8:update(v26, v4:getRotation());
end;
v0.onRotateEnded = function(_, _) --[[ Line: 80 ]] --[[ Name: onRotateEnded ]]
    -- upvalues: v3 (ref), v9 (ref), v7 (ref)
    v3:updatePosition();
    v3:show();
    v9:setVisible(true);
    v7:update();
    v7:setVisible(true);
end;
v0.onRubberbandBegan = function(_, _) --[[ Line: 89 ]] --[[ Name: onRubberbandBegan ]]
    -- upvalues: v3 (ref), v9 (ref), v7 (ref), v10 (ref)
    v3:hide();
    v9:setVisible(false);
    v7:setVisible(false);
    v10:setSuppressFilteredSelectionChanged(true);
end;
v0.onRubberbandEnded = function(_) --[[ Line: 100 ]] --[[ Name: onRubberbandEnded ]]
    -- upvalues: v10 (ref)
    v10:setSuppressFilteredSelectionChanged(false);
end;
v0.onTextEditorBegan = function(_) --[[ Line: 108 ]] --[[ Name: onTextEditorBegan ]]
    -- upvalues: v7 (ref), v3 (ref), v9 (ref)
    v7:setVisible(false);
    v3:hide();
    v9:setVisible(false);
end;
v0.onTextEditorEnded = function(_) --[[ Line: 115 ]] --[[ Name: onTextEditorEnded ]]
    -- upvalues: v7 (ref), v3 (ref), v9 (ref)
    v7:setVisible(true);
    v3:show();
    v9:setVisible(true);
end;
v0.setMove = function(_, v35) --[[ Line: 122 ]] --[[ Name: setMove ]]
    -- upvalues: v2 (ref)
    v2 = v35;
end;
v0.setRotate = function(_, v37) --[[ Line: 127 ]] --[[ Name: setRotate ]]
    -- upvalues: v4 (ref)
    v4 = v37;
end;
v0.setResize = function(_, v39) --[[ Line: 132 ]] --[[ Name: setResize ]]
    -- upvalues: v3 (ref)
    v3 = v39;
end;
v0.setRubberband = function(_, v41) --[[ Line: 137 ]] --[[ Name: setRubberband ]]
    -- upvalues: v5 (ref)
    v5 = v41;
end;
v0.setTextEditor = function(_, v43) --[[ Line: 142 ]] --[[ Name: setTextEditor ]]
    -- upvalues: v6 (ref)
    v6 = v43;
end;
v0.setDistanceLinesManager = function(_, v45) --[[ Line: 147 ]] --[[ Name: setDistanceLinesManager ]]
    -- upvalues: v7 (ref)
    v7 = v45;
end;
v0.setRotationBox = function(_, v47) --[[ Line: 152 ]] --[[ Name: setRotationBox ]]
    -- upvalues: v8 (ref)
    v8 = v47;
end;
v0.setSizeBox = function(_, v49) --[[ Line: 157 ]] --[[ Name: setSizeBox ]]
    -- upvalues: v9 (ref)
    v9 = v49;
end;
v0.setSelectionManager = function(_, v51) --[[ Line: 162 ]] --[[ Name: setSelectionManager ]]
    -- upvalues: v10 (ref)
    v10 = v51;
end;
return v0;