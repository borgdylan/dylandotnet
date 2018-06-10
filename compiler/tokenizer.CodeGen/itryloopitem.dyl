enum public integer TryLoopItemKind
    Try = 1
    Loop = 2
end enum

interface public ITryLoopItem
    property public autogen initonly TryLoopItemKind Kind
end interface