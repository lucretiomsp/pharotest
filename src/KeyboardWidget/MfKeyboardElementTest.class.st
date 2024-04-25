Class {
	#name : #MfKeyboardElementTest,
	#superclass : #TestCase,
	#category : #KeyboardWidget
}

{ #category : #tests }
MfKeyboardElementTest >> testAllKeysAreInDicts [

| keyB |		
	"At creation, keyboard must have all keys as BlElement childrens"
keyB:= MfKeyboardElement new.
self assert: keyB children size equals: 64.

]

{ #category : #tests }
MfKeyboardElementTest >> testWhenKeyPressedItsColorChanges [

	| keyB |
	"At creation, keyboard must have all keys as BlElement childrens"
	keyB := MfKeyboardElement new.
	"Here we simulate a press on the left key"
	BlSpace simulateKeyDownOn: keyB key: KeyboardKey left.
	"Check if his color has changed"
	self assert: (keyB children at: 61) background paint color equals: Color veryVeryLightGray 
	 
]
