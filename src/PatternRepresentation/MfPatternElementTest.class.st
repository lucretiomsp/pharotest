Class {
	#name : #MfPatternElementTest,
	#superclass : #TestCase,
	#category : #PatternRepresentation
}

{ #category : #'test-init' }
MfPatternElementTest >> testBarsAreInitializedCorrectlyInPattern [

| pattern patternElem |

pattern:= MfPattern new name:'Snare'.
patternElem:= MfPatternElement new pattern: pattern; min: 4; max:16; nbbars:16 .
patternElem childrenDo: [ :e |
	self assert: e drum equals: false. 
	self assert: e background paint color equals: Color white. ].
self assert:  patternElem children size equals: 16. 


]

{ #category : #tests }
MfPatternElementTest >> testIfDrumAssignedOnClick [

| pattern patternElem |

pattern:= MfPattern new name:'random'.
patternElem:= MfPatternElement new pattern: pattern; min: 4; max:16; nbbars:12 .
patternElem childrenDo: [ :e |
	BlSpace simulateClickOn: e.
	self assert: e drum equals: true
	 ].


]
