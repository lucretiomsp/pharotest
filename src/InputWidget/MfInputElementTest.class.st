Class {
	#name : #MfInputElementTest,
	#superclass : #TestCase,
	#category : #InputWidget
}

{ #category : #tests }
MfInputElementTest >> testEverythingIsInitializedCorrectly [

| inputElem |

inputElem:= MfInputElement new.
self assert: inputElem children size equals: 4. 

]
