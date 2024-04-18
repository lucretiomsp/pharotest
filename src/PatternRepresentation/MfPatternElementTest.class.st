Class {
	#name : #MfPatternElementTest,
	#superclass : #TestCase,
	#category : #PatternRepresentation
}

{ #category : #'basic tests' }
MfPatternElementTest >> testBarsAreInitializedCorrectlyInPattern [

| pattern patternElem |

pattern:= MfPattern new name:'Snare'.
patternElem:= MfPatternElement new pattern: pattern; min: 4; max:16; nbbars:16 .
patternElem addBarsToThePattern: patternElem nbbars .
patternElem childrenDo: [ :e |
	self assert: e background paint color equals: Color white. ].
self assert:  patternElem children size equals: 16. 
]
