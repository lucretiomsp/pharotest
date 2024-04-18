Class {
	#name : #MfPatternElementTest,
	#superclass : #TestCase,
	#category : #PatternRepresentation
}

{ #category : #'basic tests' }
MfPatternElementTest >> testBarsAreInitializedCorrectlyInPattern [

| pattern patternElem nbBars |

nbBars:= 16.
pattern:= MfPattern new name:'Snare'.
patternElem:= MfPatternElement new pattern: pattern.
patternElem addBarsToThePattern: nbBars .
patternElem childrenDo: [ :e |
	self assert: e background paint color equals: Color white. ].
self assert:  patternElem children size equals: 16. 
]
