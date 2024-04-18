Class {
	#name : #BlocAddingTest,
	#superclass : #TestCase,
	#category : #Test
}

{ #category : #tests }
BlocAddingTest >> testParentBlocIsInitialized [

| b |
b := BlocAdding new.
b initialize.
self assert: b size equals: 400@400.
]
