Class {
	#name : #MfInputValueElement,
	#superclass : #BlTextElement,
	#category : #InputWidget
}

{ #category : #initialization }
MfInputValueElement >> initialize [ 

super initialize .

self constraintsDo: [ :c |
	c frame horizontal alignCenter.
	c frame vertical alignCenter  ].

]
